import { fakeAsync, async, ComponentFixture, TestBed, inject, tick } from '@angular/core/testing';
import { MockBackend, MockConnection } from '@angular/http/testing';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { By } from '@angular/platform-browser';
import { MaterialModule, MdDialogRef, MdDialog, MD_DIALOG_DATA } from '@angular/material';
import { Md2Module } from 'md2';
import { FormsModule } from '@angular/forms';
import { MandateFormComponent } from './mandate-form.component';
import { RouterTestingModule } from '@angular/router/testing';
import { ActivatedRoute, Router } from '@angular/router';
import { MandateService } from '../mandate.service';
import { MerchantService } from '../../merchant/merchant.service';
import { FpxService } from '../fpx.service';
import { MandateFormService } from './mandate-form.service';
import { MandateModule } from '../mandate.module';
import { Observable } from 'rxjs/Observable';
import { Mandate } from '../model/mandate';
import { Merchant } from '../../merchant/model/merchant';
import { TestHelpers } from '../../../test/test-helpers';
import { DisplayEnum } from '../../model/displayEnum';
import { RouterStub } from '../../../test/router-stub';
import { TestModule } from '../../../test/test.module';

import * as mandateNew from '../../../../fixtures/mandateNew.json';
import * as mandatePendingAuthorisation from '../../../../fixtures/mandatePendingAuthorisation.json';
import * as mandateAuthorised from '../../../../fixtures/mandateAuthorised.json';
import * as adMessageAuthorisation from '../../../../fixtures/adMessageAuthorisation.json';
import * as banks from '../../../../fixtures/banks.json';
import * as idTypes from '../../../../fixtures/idTypes.json';
import * as merchant from '../../../../fixtures/merchant.json';

describe('MandateFormComponent', () => {
	let component: MandateFormComponent;
	let fixture: ComponentFixture<MandateFormComponent>;
	let dialogMock = {
		close: function() { },
		config: {
			data: {}
		}
	};
	let fpxMock = {
		processFpxRedirect: function(response: Response) { }
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
	let routerStub = new RouterStub();

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
			provide: Router,
			useValue: routerStub
		}, { 
			provide: FpxService,
			useValue: fpxMock
		}, {
			provide: Http,
			useFactory: (mockBackend, options) => {
				return new Http(mockBackend, options);
			},
			deps: [MockBackend, BaseRequestOptions]
		}, MockBackend, BaseRequestOptions, MandateService, MandateFormService, MerchantService];

		if (includeDialog) {
			dialogMock.config.data = routeData;
			providers.push({
				provide: MdDialogRef,
				useValue: dialogMock
			});
			providers.push({
				provide: MD_DIALOG_DATA, 
				useValue: routeData
			});
		}

		TestBed.configureTestingModule({
			declarations: [],
			imports: [MaterialModule, RouterTestingModule, Md2Module, FormsModule, MandateModule, TestModule],
			providers: providers
		})
			.compileComponents();
	}

	let connections: MockConnection[] = [];

	function initialiseComponentWithReferenceData(mockBackend: MockBackend) {
		connections = [];
		mockBackend.connections.subscribe((c: MockConnection) => connections.push(c));

		createComponent();

		expect(connections[0].request.url).toEqual("bank");
		connections[0].mockRespond(new Response(new ResponseOptions({ body: banks, status: 200 })));
		tick();
		fixture.detectChanges();

		if (connections.length === 2) {
			expect(connections[1].request.url).toEqual("mandate/idType");
			connections[1].mockRespond(new Response(new ResponseOptions({ body: idTypes, status: 200 })));
			tick();
			fixture.detectChanges();
		}
	}

	describe("new mandate - Merchant", () => {
		beforeEach(async(() => {
			spyOn(routerStub, 'navigate');
			setupTestBed(Observable.of({
				mandate: new Mandate(new Merchant().deserialize(merchant)),
				mode: 'form',
				user: {
					type: "MERCHANT",
					id: "1"
				}
			}), false);
		}));

		it('should display error messages for failed validation', fakeAsync(inject([MockBackend], (mockBackend) => {
			initialiseComponentWithReferenceData(mockBackend);

			fixture.debugElement.query(By.css("div.buttonContainer button[color=primary]")).nativeElement.click();
			fixture.detectChanges();

			expect(fixture.debugElement.query(By.css("div.alert")).nativeElement.textContent).toContain('amount is not valid');
			expect(component.model.status.value).toEqual("NEW");
		})));

		it('should fill in all the fields', fakeAsync(inject([MockBackend], (mockBackend) => {
			initialiseComponentWithReferenceData(mockBackend);

			TestHelpers.inputValue('input[name="referenceNumber"]', 'TEST-1', fixture);
			TestHelpers.inputValue('input[name="accountHolderName"]', 'Joe', fixture);
			TestHelpers.inputValue('input[name="email"]', 'Joe', fixture);
			TestHelpers.pickFromMdSelect('md-select[name="idType"]', '1', fixture);
			TestHelpers.inputValue('input[name="idValue"]', '12341234', fixture);
			TestHelpers.inputValue('input[name="amount"]', '100', fixture);
			TestHelpers.pickFromMdSelect('md-select[name="frequency"]', '1', fixture, '4');
			TestHelpers.pickFromMdSelect('md-select[name="bank"]', '2', fixture, '6');

			fixture.debugElement.query(By.css("div.buttonContainer button[color=primary]")).nativeElement.click();
			let connection = connections.pop();

			tick(1000);
		})));

		it("should post the form and navigate after clicking email", fakeAsync(inject([MockBackend], (mockBackend) => {
			initialiseComponentWithReferenceData(mockBackend);
			fixture.detectChanges();

			TestHelpers.inputValue('input[name="referenceNumber"]', 'TEST-1', fixture);
			TestHelpers.inputValue('input[name="accountHolderName"]', 'Joe', fixture);
			TestHelpers.inputValue('input[name="email"]', 'Joe', fixture);
			TestHelpers.pickFromMdSelect('md-select[name="idType"]', '1', fixture);
			TestHelpers.inputValue('input[name="idValue"]', '12341234', fixture);
			TestHelpers.inputValue('input[name="amount"]', '100', fixture);
			TestHelpers.pickFromMdSelect('md-select[name="frequency"]', '2', fixture, '4');
			TestHelpers.inputValue('input[name="maximumFrequency"]', '1', fixture);

			fixture.debugElement.query(By.css("div.buttonContainer button:nth-child(2)")).nativeElement.click();

			let connection = connections.pop();
			expect(connection.request.url).toEqual("merchant/mandate");

			connection.mockRespond(new Response(new ResponseOptions({ status: 200 })));

			expect(routerStub.navigate).toHaveBeenCalled();

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
					type: "MERCHANT",
					id: "1"
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

	describe("dialog popup - new - customer", () => {
		beforeEach(async(() => {
			spyOn(dialogMock, 'close');
			spyOn(fpxMock, 'processFpxRedirect');

			setupTestBed({
				mandate: new Mandate().deserialize(mandateNew),
				mode: 'dialog',
				user: {
					type: "CUSTOMER"
				}
			}, true);
		}));

		it('should prevent authorising without bank details', () => {
			createComponent();

			expect(fixture.debugElement.queryAll(By.css("div.buttonContainer button"))[2].nativeElement.disabled).toBeTruthy();
		});

		// The material2 select component only supports object equality for decided which item is selected, so its important
		// that we change the frequency to be the exact object from the array it is looping over (the selected frequencies)
		// otherwise the frequency drop down won't be selected when we view a saved mandate
		it('should use the exact object from the available frequencies for the available frequncies', () => {
			createComponent();

			expect(component.model.frequency).toBe(component.model.merchant.merchantSettings.selectedFrequencies[0]);
		});

		it('should post details to FPX', fakeAsync(inject([MockBackend], (mockBackend) => {
			initialiseComponentWithReferenceData(mockBackend);

			TestHelpers.inputValue('input[name="maximumFrequency"]', '1', fixture);
			TestHelpers.pickFromMdSelect('md-select[name="bank"]', '1', fixture);
			tick();
			fixture.detectChanges();

			expect(fixture.debugElement.queryAll(By.css("div.buttonContainer button"))[2].nativeElement.disabled).toBeFalsy();
			fixture.debugElement.queryAll(By.css("div.buttonContainer button"))[2].nativeElement.click();
			tick();
			fixture.detectChanges();	

			let connection = connections.pop();
			connection.mockRespond(new Response(new ResponseOptions({ body: adMessageAuthorisation, status: 200 })));
			tick();

			expect(fpxMock.processFpxRedirect).toHaveBeenCalled();
			tick(1000);
		})));
	});

	it("should add the mandate frequency to the list of available frequencies if it isn't there", () => {
		let mandate = new Mandate().deserialize(mandateNew);
		mandate.frequency = DisplayEnum.of("MONTHLY", "Monthly");

		setupTestBed({
			mandate: mandate,
			mode: 'dialog',
			user: {
				type: "CUSTOMER"
			}
		}, true);

		createComponent();

		expect(component.frequencyTypes).toContain(mandate.frequency);
	});
});
