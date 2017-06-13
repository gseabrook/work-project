/* tslint:disable:no-unused-variable */
import { By } from '@angular/platform-browser';
import { fakeAsync, async, ComponentFixture, TestBed, inject, tick } from '@angular/core/testing';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { MockBackend, MockConnection } from '@angular/http/testing';
import { MandateService } from '../mandate.service';
import { FpxService } from '../fpx.service';
import { Mandate } from '../model/mandate';
import { MaterialModule, MdDialog } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { RouterTestingModule } from '@angular/router/testing';
import { Observable } from 'rxjs/Observable';
import { DialogService } from '../../dialog/dialog.service';

import * as Mandates from '../../../../fixtures/mandates.json';
import * as AdMessageTermination from '../../../../fixtures/adMessageTermination.json';

import { MandateListComponent } from './mandate-list.component';

describe('MandateListComponent', () => {
	let component: MandateListComponent;
	let fixture: ComponentFixture<MandateListComponent>;
	let dialogMock = {
		open: function(a, b) {}
	};
	let fpxMock = {
		processFpxRedirect: function(response: Response){}
	};
	let confirmationDialogMock = {
		openConfirmationDialog: function(){
			return Observable.of(true);
		}
	};

	function setupTestBed(routeData) {
		TestBed.configureTestingModule({
			declarations: [MandateListComponent],
			imports: [HttpModule, MaterialModule, RouterTestingModule],
			providers: [{
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
			}, {
				provide: MdDialog,
				useValue: dialogMock
			}, {
				provide: DialogService,
				useValue: confirmationDialogMock
			}, {
				provide: FpxService,
				useValue: fpxMock
			},
				MockBackend,
				BaseRequestOptions,
				MandateService]
		})
			.compileComponents();
	}

	function createComponent() {
		fixture = TestBed.createComponent(MandateListComponent);
		component = fixture.componentInstance;
		fixture.detectChanges();
	}

	describe('Customer view', () => {

		beforeEach(() => {
			spyOn(dialogMock, 'open').and.returnValue({
				afterClosed: function() {
					return Observable.of(true);
				}
			});
			spyOn(fpxMock, 'processFpxRedirect');
			setupTestBed(Observable.of({
				user: {
					type: "CUSTOMER"
				}
			}));
		});

		it('should create', () => {
			createComponent();
			expect(component).toBeTruthy();
		});

		it('should load all the mandates and display them in the table', fakeAsync(inject([MockBackend], (mockBackend) => {
			let connection: MockConnection;
			mockBackend.connections.subscribe((c: MockConnection) => connection = c);
			createComponent();

			fixture.whenStable().then(() => {

				connection.mockRespond(new Response(new ResponseOptions({ body: Mandates, status: 200 })));
				tick();
				fixture.detectChanges();

				expect(fixture.debugElement.queryAll(By.css('tbody tr')).length).toEqual(5);
				expect(fixture.debugElement.query(By.css('tbody tr td:nth-child(4)')).nativeElement.textContent).toContain('Yearly');
				expect(fixture.debugElement.query(By.css('tbody tr td:nth-child(5)')).nativeElement.textContent).toContain('Ag I Solutions');
				expect(fixture.debugElement.query(By.css('tbody tr td:nth-child(6)')).nativeElement.textContent).toContain('Approved');
			});
		})));

		it('should terminate a mandate after clicking the terminate button', fakeAsync(inject([MockBackend], (mockBackend) => {
			spyOn(confirmationDialogMock, 'openConfirmationDialog').and.returnValue(Observable.of(true));

			let connection: MockConnection;
			mockBackend.connections.subscribe((c: MockConnection) => connection = c);
			createComponent();

			fixture.whenStable().then(() => {

				connection.mockRespond(new Response(new ResponseOptions({ body: Mandates, status: 200 })));
				tick();
				fixture.detectChanges();

				fixture.debugElement.queryAll(By.css("tbody tr button"))[1].nativeElement.click();

				connection.mockRespond(new Response(new ResponseOptions({ body: AdMessageTermination, status: 204 })));
				tick(1000);
				fixture.detectChanges();

				expect(fpxMock.processFpxRedirect).toHaveBeenCalled();
			});
		})));

		it('should open a dialog when clicking on the update button', fakeAsync(inject([MockBackend], (mockBackend) => {
			let connection: MockConnection;
			mockBackend.connections.subscribe((c: MockConnection) => connection = c);
			createComponent();

			fixture.whenStable().then(() => {

				connection.mockRespond(new Response(new ResponseOptions({ body: Mandates, status: 200 })));
				tick();
				fixture.detectChanges();

				fixture.debugElement.queryAll(By.css('tbody tr button'))[0].nativeElement.click();;

				expect(dialogMock.open).toHaveBeenCalled();
			});
		})));
	});

	describe('Merchant view', () => {

		beforeEach(() => {
			setupTestBed(Observable.of({
				user: {
					type: "MERCHANT"
				}
			}));
		});

		it('should create', () => {
			createComponent();
			expect(component).toBeTruthy();
		});

		it('should load all the mandates and display them in the table', fakeAsync(inject([MockBackend], (mockBackend) => {

			let connection: MockConnection;
			mockBackend.connections.subscribe((c: MockConnection) => connection = c);

			createComponent();

			fixture.whenStable().then(() => {

				connection.mockRespond(new Response(new ResponseOptions({ body: Mandates, status: 200 })));
				tick();
				fixture.detectChanges();

				expect(fixture.debugElement.queryAll(By.css('tbody tr')).length).toEqual(5);
				expect(fixture.debugElement.query(By.css('tbody tr:nth-child(1) td:nth-child(4)')).nativeElement.textContent).toContain('Yearly');
				expect(fixture.debugElement.query(By.css('tbody tr:nth-child(1) td:nth-child(6)')).nativeElement.textContent).toContain('Passport Number');
				expect(fixture.debugElement.query(By.css('tbody tr td:nth-child(7)')).nativeElement.textContent).toContain('Approved');
			});
		})));
	});
});