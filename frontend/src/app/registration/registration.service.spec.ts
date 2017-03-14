/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { RegistrationService } from './registration.service';
import { Registration } from './model/registration';
import { HttpModule, Http, BaseRequestOptions } from '@angular/http';
import { MockBackend } from '@angular/http/testing';

import 'rxjs/add/operator/toPromise';

describe('RegistrationService', () => {
	beforeEach(() => {
		TestBed.configureTestingModule({
			imports: [HttpModule],
			providers: [RegistrationService,
				{
					provide: Http,
					useFactory: (mockBackend, options) => {
						return new Http(mockBackend, options);
					},
					deps: [MockBackend, BaseRequestOptions]
				},
				MockBackend,
				BaseRequestOptions
			]
		});
	});

	it('should create a registration form',
		async(inject([RegistrationService, MockBackend], (service, mockBackend) => {
			mockBackend.connections.subscribe((connection) => {
				expect(connection.request.method).toBe(RequestMethod.Post);
				connection.mockRespond(new Response(new ResponseOptions({ status: 201 })));
			});

			let registration = new Registration('a', 'b', 'c', 'd', new Date());

			service.save(registration).then((response) => {
				expect(response).toBeDefined();
				expect(response.status).toEqual(201);
			});
		})
		)
	);
});

