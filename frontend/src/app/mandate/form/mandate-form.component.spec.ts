import { fakeAsync, async, ComponentFixture, TestBed, inject, tick } from '@angular/core/testing';
import { MockBackend, MockConnection } from '@angular/http/testing';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { By } from '@angular/platform-browser';
import { MaterialModule, MdDialogRef, MdDialog } from '@angular/material';
import { Md2Module } from 'md2';
import { FormsModule } from '@angular/forms';
import { MandateFormComponent } from './mandate-form.component';
import { RouterTestingModule } from '@angular/router/testing';
import { ActivatedRoute, Router } from '@angular/router';
import { MandateService } from '../mandate.service';
import { MandateFormService } from './mandate-form.service';
import { MandateModule } from '../mandate.module';
import { FpxAuthenticationComponent } from '../fpx-authentication/fpx-authentication.component';
import { Observable } from 'rxjs/Observable';
import { Mandate } from '../model/mandate';
import { TestHelpers } from '../../../test/test-helpers';
import { DisplayEnum } from '../model/displayEnum';

import * as mandatePendingAuthorisation from '../../../../fixtures/mandatePendingAuthorisation.json';
import * as mandateAuthorised from '../../../../fixtures/mandateAuthorised.json';
import * as banks from '../../../../fixtures/banks.json';
import * as idTypes from '../../../../fixtures/idTypes.json';
import * as frequencies from '../../../../fixtures/frequencies.json';

describe('MandateFormComponent', () => {
	let component: MandateFormComponent;
	let fixture: ComponentFixture<MandateFormComponent>;
	let dialogMock = {
		close: function() { 
			console.log("In dialog mock");
		},
		config: {
			data: {}
		}
	};
	let mdDialogMock = {
		open: function() {
			return {
				afterClosed: function() {
					return Observable.of(true);
				}
			}
		}
	}

	function createComponent() {
		fixture = TestBed.createComponent(MandateFormComponent);
		component = fixture.componentInstance;
		fixture.detectChanges();
	}

	function setupTestBed(routeData: any, includeDialog: boolean) {
		let providers: any[] = [{
			provide: ActivatedRoute,
			useValue: {
				data: routeData,
				snapshot: {}
			}
		}, {
			provide: MdDialog,
			useValue: mdDialogMock
		}, {
			provide: Http,
			useFactory: (mockBackend, options) => {
				return new Http(mockBackend, options);
			}, 
			deps: [MockBackend, BaseRequestOptions]
		}, MockBackend, BaseRequestOptions, MandateService, MandateFormService];

		if (includeDialog) {
			dialogMock.config.data = routeData;
			providers.push({
				provide: MdDialogRef,
				useValue: dialogMock
			});
		}

		TestBed.configureTestingModule({
			declarations: [],
			imports: [MaterialModule, RouterTestingModule, Md2Module, FormsModule, MandateModule],
			providers: providers
		})
			.compileComponents();
	}

	let connections: MockConnection[] = [];

	function initialiseComponentWithReferenceData(mockBackend: MockBackend) {
		connections = [];
		mockBackend.connections.subscribe((c: MockConnection) => connections.push(c));

		createComponent();

		connections[0].mockRespond(new Response(new ResponseOptions({ body: banks, status: 200 })));
		connections[1].mockRespond(new Response(new ResponseOptions({ body: frequencies, status: 200 })));
		tick();
		fixture.detectChanges();

		if (connections.length === 3) {
			connections[2].mockRespond(new Response(new ResponseOptions({ body: idTypes, status: 200 })));
			tick();
			fixture.detectChanges();
		}
	}

	describe("new mandate - Merchant", () => {
		beforeEach(async(() => {
			setupTestBed(Observable.of({
				mandate: new Mandate(),
				mode: 'form',
				user: {
					type: "MERCHANT"
				}
			}), false);
		}));

		it('should display error messages for failed validation', fakeAsync(inject([MockBackend], (mockBackend) => {
			initialiseComponentWithReferenceData(mockBackend);

			fixture.debugElement.query(By.css("div.buttonContainer button[color=primary]")).nativeElement.click();
			fixture.detectChanges();

			expect(fixture.debugElement.query(By.css("div.alert")).nativeElement.textContent).toContain('referenceNumber is not valid');
			expect(component.model.status.value).toEqual("PENDING_AUTHORISATION");
		})));

		it('should fill in all the fields', fakeAsync(inject([MockBackend], (mockBackend) => {
			initialiseComponentWithReferenceData(mockBackend);

			TestHelpers.inputValue('input[name="referenceNumber"]', 'TEST-1', fixture);
			TestHelpers.inputValue('input[name="accountHolderName"]', 'Joe', fixture);
			TestHelpers.inputValue('input[name="email"]', 'Joe', fixture);
			TestHelpers.pickFromMdSelect('md-select[name="idType"]', '1', fixture);
			TestHelpers.inputValue('input[name="idValue"]', '12341234', fixture);
			TestHelpers.inputValue('input[name="amount"]', '100', fixture);
			TestHelpers.pickFromMdSelect('md-select[name="frequency"]', '3', fixture, '4');
			TestHelpers.pickFromMdSelect('md-select[name="bank"]', '2', fixture, '6');
			TestHelpers.inputValue('input[name="accountNumber"]', '87288888', fixture);

			fixture.debugElement.query(By.css("div.buttonContainer button[color=primary]")).nativeElement.click();
			let connection = connections.pop();

			expect(connection.request.getBody()).toContain('"status":"AUTHORISED"');
			tick(1000);
		})));
	});

	describe("dialog popup - merchant", () => {

		let mandate = new Mandate().deserialize(mandatePendingAuthorisation);

		beforeEach(async(() => {
			setupTestBed({
				mandate: mandate,
				mode: 'dialog',
				user: {
					type: "MERCHANT"
				}
			}, true);
		}));

		it('should clone the mandate to avoid unsaved changes modifying the list', () => {
			createComponent();

			component.model.referenceNumber = "ABC-123";
			expect(mandate.referenceNumber).toEqual("BBB333");

			component.model.customer.idType = <DisplayEnum>{
				value: 'PASSPORT_NUMBER',
				displayValue: 'Passport Number'
			};
			expect(mandate.customer.idType.value).toEqual('BUSINESS_REGISTRATION_NUMBER');
		});
	});

	describe("dialog popup - pending authorisation - customer", () => {
		beforeEach(async(() => {
			spyOn(dialogMock, 'close');
			setupTestBed({
				mandate: new Mandate().deserialize(mandatePendingAuthorisation),
				mode: 'dialog',
				user: {
					type: "CUSTOMER"
				}
			}, true);
		}));

		it('should prevent authorising without bank details', () => {
			createComponent();

			expect(fixture.debugElement.queryAll(By.css("div.buttonContainer button"))[0].nativeElement.disabled).toBeTruthy();
		});

		it('should enter bank details and authorise', fakeAsync(inject([MockBackend], (mockBackend) => {
			initialiseComponentWithReferenceData(mockBackend);

			TestHelpers.pickFromMdSelect('md-select[name="bank"]', '1', fixture);
			TestHelpers.inputValue('input[name="accountNumber"]', '11223344', fixture);
			tick();
			fixture.detectChanges();

			expect(fixture.debugElement.queryAll(By.css("div.buttonContainer button"))[0].nativeElement.disabled).toBeFalsy();
			fixture.debugElement.queryAll(By.css("div.buttonContainer button"))[0].nativeElement.click();

			let connection = connections.pop();
			expect(connection.request.getBody()).toContain('"status":"AUTHORISED"');
			connection.mockRespond(new Response(new ResponseOptions({status: 200})));
			tick(1000);
			expect(dialogMock.close).toHaveBeenCalled();
		})));
	});

	describe("pending authorisation - standAlone", () => {

		beforeEach(async(() => {
			setupTestBed(Observable.of({
				mandate: new Mandate().deserialize(mandatePendingAuthorisation),
				mode: 'standAlone'
			}), false);
		}));

		it('should create', () => {
			createComponent();
			expect(component).toBeTruthy();
		});

		it('should hide some of the html in standalone mode', () => {
			createComponent();
			expect(fixture.debugElement.queryAll(By.css('div.buttonContainer button')).length).toEqual(1);
			expect(fixture.debugElement.queryAll(By.css('h1.subheader')).length).toEqual(0);
		});

		it('should update the mandate when clicking the button', fakeAsync(inject([MockBackend], (mockBackend) => {
			initialiseComponentWithReferenceData(mockBackend);

			TestHelpers.pickFromMdSelect('md-select[name="bank"]', '1', fixture);
			TestHelpers.inputValue('input[name="accountNumber"]', '11223344', fixture);

			expect(component.model.customerBankAccount.accountNumber).toEqual('11223344');
			tick(1000);
		})));
	});

	describe("authorised - standAlone", () => {
		beforeEach(async(() => {
			setupTestBed(Observable.of({
				mandate: new Mandate().deserialize(mandateAuthorised),
				mode: 'standAlone',
				user: {
					type: "MERCHANT"
				}
			}), false);
		}));

		it("should update the mandate with the bank details from the rest call", fakeAsync(inject([MockBackend], (mockBackend) => {
			initialiseComponentWithReferenceData(mockBackend);

			expect(component.model.customerBankAccount.bank).toEqual(component.banks[3]);
		})));
	});
});
