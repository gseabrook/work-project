import { fakeAsync, async, ComponentFixture, TestBed, inject, tick } from '@angular/core/testing';
import { MockBackend, MockConnection } from '@angular/http/testing';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { By } from '@angular/platform-browser';
import { MaterialModule } from '@angular/material';
import { Md2Module } from 'md2';
import { FormsModule } from '@angular/forms';
import { MandateFormComponent } from './mandate-form.component';
import { RouterTestingModule } from '@angular/router/testing';
import { ActivatedRoute, Router } from '@angular/router';
import { MandateService } from '../mandate.service';
import { MandateFormService } from './mandate-form.service';
import { Observable } from 'rxjs/Observable';
import { Mandate } from '../model/mandate';
import { TestHelpers } from '../../../test/test-helpers';

import * as mandatePendingAuthorisation from '../../../../fixtures/mandatePendingAuthorisation.json';
import * as mandateAuthorised from '../../../../fixtures/mandateAuthorised.json';
import * as banks from '../../../../fixtures/banks.json';

describe('MandateFormComponent', () => {
	let component: MandateFormComponent;
	let fixture: ComponentFixture<MandateFormComponent>;

	function createComponent() {
		fixture = TestBed.createComponent(MandateFormComponent);
		component = fixture.componentInstance;
		fixture.detectChanges();
	}

	function setupTestBed(routeData) {
		TestBed.configureTestingModule({
			declarations: [MandateFormComponent],
			imports: [MaterialModule, RouterTestingModule, Md2Module, FormsModule],
			providers: [MandateService, MandateFormService, {
				provide: ActivatedRoute,
				useValue: {
					data: routeData,
					snapshot: {}
				}
			}, {
					provide: Http,
					useFactory: (mockBackend, options) => {
						return new Http(mockBackend, options);
					},
					deps: [MockBackend, BaseRequestOptions]
				}, MockBackend, BaseRequestOptions]
		})
			.compileComponents();
	}

	describe("new mandate", () => {
		beforeEach(async(() => {
			setupTestBed(Observable.of({
				mandate: new Mandate(),
				mode: 'form'
			}));
		}));

		function initialiseComponentWithBankData(mockBackend: MockBackend) {
			let connection: MockConnection;
			mockBackend.connections.subscribe((c: MockConnection) => connection = c);

			createComponent();

			connection.mockRespond(new Response(new ResponseOptions({ body: banks, status: 200 })));
			tick();
			fixture.detectChanges();
		}

		it('should display error messages for failed validation', fakeAsync(inject([MockBackend], (mockBackend) => {
			initialiseComponentWithBankData(mockBackend);

			fixture.debugElement.query(By.css("div.buttonContainer button[color=primary]")).nativeElement.click();
			fixture.detectChanges();

			expect(fixture.debugElement.query(By.css("div.alert")).nativeElement.textContent).toContain('referenceNumber is not valid');
		})));

		it('should fill in all the fields', fakeAsync(inject([MockBackend], (mockBackend) => {
			initialiseComponentWithBankData(mockBackend);

			TestHelpers.inputValue('input[name="referenceNumber"]', 'TEST-1', fixture);
			TestHelpers.inputValue('input[name="accountHolderName"]', 'Joe', fixture);
			TestHelpers.inputValue('input[name="email"]', 'Joe', fixture);
			TestHelpers.pickFromMdSelect('md-select[name="idType"]', '1', fixture);
			TestHelpers.inputValue('input[name="idValue"]', '12341234', fixture);
			TestHelpers.inputValue('input[name="amount"]', '100', fixture);
			TestHelpers.pickFromMdSelectByValue('md-select[name="frequency"]', 'WEEKLY', fixture);

			tick(1000);
		})));
	});

	describe("pending authorisation", () => {
		beforeEach(async(() => {
			setupTestBed(Observable.of({
				mandate: new Mandate().deserialize(mandatePendingAuthorisation),
				mode: 'standAlone'
			}));
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
			let connection: MockConnection;
			mockBackend.connections.subscribe((c: MockConnection) => connection = c);

			createComponent();

			connection.mockRespond(new Response(new ResponseOptions({ body: banks, status: 200 })));
			tick();
			fixture.detectChanges();

			TestHelpers.pickFromMdSelect('md-select[name="bank"]', '1', fixture);
			TestHelpers.inputValue('input[name="accountNumber"]', '11223344', fixture);

			expect(component.model.customerBankAccount.accountNumber).toEqual('11223344');
			tick(1000);
		})));
	});

	describe("authorised", () => {
		beforeEach(async(() => {
			setupTestBed(Observable.of({
				mandate: new Mandate().deserialize(mandateAuthorised),
				mode: 'standAlone'
			}));
		}));

		it("should update the mandate with the bank details from the rest call", fakeAsync(inject([MockBackend], (mockBackend) => {
			let connection: MockConnection;
			mockBackend.connections.subscribe((c: MockConnection) => connection = c);

			createComponent();
			connection.mockRespond(new Response(new ResponseOptions({ body: banks, status: 200 })));
			tick();

			expect(component.model.customerBankAccount.bank).toEqual(component.banks[3]);
		})));
	});
});
