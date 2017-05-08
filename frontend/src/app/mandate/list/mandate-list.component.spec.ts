/* tslint:disable:no-unused-variable */
import { By } from '@angular/platform-browser';
import { fakeAsync, async, ComponentFixture, TestBed, inject, tick } from '@angular/core/testing';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { MockBackend, MockConnection } from '@angular/http/testing';
import { MandateService } from '../mandate.service';
import { Mandate } from '../model/mandate';
import { MaterialModule } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { RouterTestingModule } from '@angular/router/testing';
import { Observable } from 'rxjs/Observable';

import * as Mandates from '../../../../fixtures/mandates.json';

import { MandateListComponent } from './mandate-list.component';

describe('MandateListComponent', () => {
	let component: MandateListComponent;
	let fixture: ComponentFixture<MandateListComponent>;

	beforeEach(() => {
		TestBed.configureTestingModule({
			declarations: [MandateListComponent],
			imports: [HttpModule, MaterialModule, RouterTestingModule],
			providers: [MandateService,
				{
					provide: Http,
					useFactory: (mockBackend, options) => {
						return new Http(mockBackend, options);
					},
					deps: [MockBackend, BaseRequestOptions]
				}, {
					provide: ActivatedRoute,
					useValue: {
						data: Observable.of({
							 user: {
							 	type: "MERCHANT"
							 }
						}),
						snapshot: {}
					}
				},
				MockBackend,
				BaseRequestOptions
			]
		})
			.compileComponents(); ;
	});

	function createComponent() {
		fixture = TestBed.createComponent(MandateListComponent);
		component = fixture.componentInstance;
		fixture.detectChanges();
	}

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

			expect(fixture.debugElement.queryAll(By.css('tbody tr')).length).toEqual(1);
			expect(fixture.debugElement.query(By.css('tbody tr td:nth-child(4)')).nativeElement.textContent).toContain('Daily');
			expect(fixture.debugElement.query(By.css('tbody tr td:nth-child(6)')).nativeElement.textContent).toContain('Business Registration Number');
		})
	})));
});