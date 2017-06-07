import { DebugElement, NgModule } from '@angular/core';
import { fakeAsync, async, ComponentFixture, TestBed, inject, tick } from '@angular/core/testing';
import { FormsModule } from '@angular/forms';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { MockBackend, MockConnection } from '@angular/http/testing';
import { MaterialModule } from '@angular/material';
import { By } from '@angular/platform-browser';
import { RouterTestingModule } from '@angular/router/testing';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs/Observable';
import { FlexLayoutModule } from '@angular/flex-layout';

import { SignUpComponent } from './signup.component';
import { SignUpService } from './signup.service';
import { AuthService } from '../auth/auth.service';

import { TestHelpers } from '../../test/test-helpers';
import { RouterStub } from '../../test/router-stub';

import * as SignupErrorResponse from '../../../fixtures/signupErrorResponse.json';
import * as Token from '../../../fixtures/token.json';

describe('SignUpComponent', () => {
	let component: SignUpComponent;
	let fixture: ComponentFixture<SignUpComponent>;

	beforeEach(async(() => {
		TestBed.configureTestingModule({
			declarations: [SignUpComponent],
			imports: [FormsModule, MaterialModule, FlexLayoutModule],
			providers: [AuthService, SignUpService,
				{
					provide: Http,
					useFactory: (mockBackend, options) => {
						return new Http(mockBackend, options);
					},
					deps: [MockBackend, BaseRequestOptions]
				}, {
					provide: Router, useClass: RouterStub
				}, {
					provide: ActivatedRoute,
					useValue: {
						queryParams: Observable.of({ token: '123' }),
						snapshot: {}
					}
				},
				MockBackend,
				BaseRequestOptions]
		})
			.compileComponents();
	}));

	function createComponent() {
		fixture = TestBed.createComponent(SignUpComponent);
		component = fixture.componentInstance;
		fixture.detectChanges();
	}

	it('should create', () => {
		createComponent();
		expect(component).toBeTruthy();
	});

	it('should prepopulate the email address', fakeAsync(inject([MockBackend], (mockBackend) => {
		let connection: MockConnection;
		mockBackend.connections.subscribe((c: MockConnection) => connection = c);

		createComponent();

		fixture.whenStable().then(() => {
			connection.mockRespond(new Response(new ResponseOptions({body: Token, status: 200})));
			tick();
		    fixture.detectChanges();
		    tick();

			expect(fixture.debugElement.query(By.css('input[name="email"]')).nativeElement.value).toEqual('test@example.com');
		});
	})));

	it('should post the values and token to the backend',
		async(inject([MockBackend], (mockBackend) => {
			createComponent();
			fixture.whenStable().then(() => {
				TestHelpers.inputValue('input[name="email"]', 'joe@dog.com', fixture);
				TestHelpers.inputValue('input[name="password"]', 'supersecretpassword', fixture);
				TestHelpers.inputValue('input[name="repeatPassword"]', 'supersecretpassword', fixture);

				mockBackend.connections.subscribe((connection) => {
					expect(connection.request.method).toBe(RequestMethod.Post);
					expect(JSON.parse(connection.request.getBody()))
					.toEqual({ 'email': 'joe@dog.com', 'token': '123', 'password': 'supersecretpassword', 'repeatPassword': 'supersecretpassword' });

					connection.mockRespond(new Response(new ResponseOptions({ status: 200 })));
				});

				fixture.debugElement.query(By.css('button[type=submit]')).nativeElement.click();
			});
		}))
	);

	//Ignored until there is support for returning errors with a body
	xit('should display validation errors', fakeAsync(inject([MockBackend], (mockBackend) => {
		fixture.whenStable().then(() => {
			let connection: MockConnection;
			mockBackend.connections.subscribe((c: MockConnection) => connection = c);

			fixture.debugElement.query(By.css('button[type=submit]')).nativeElement.click();

			connection.mockError(new Error(JSON.stringify(SignupErrorResponse)));
			tick();

			expect(fixture.debugElement.query(By.css('div.alert')).nativeElement.textContent).toContain('!!!');
		});
	})));
});
