/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { MandateService } from './mandate.service';
import { Mandate } from './model/mandate';
import { MockBackend } from '@angular/http/testing';

import 'rxjs/add/operator/toPromise';

describe('MandateService', () => {
	beforeEach(() => {
		TestBed.configureTestingModule({
			imports: [HttpModule],
			providers: [MandateService,
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

	it('should create a mandate form',
		async(inject([MandateService, MockBackend], (service, mockBackend) => {
			mockBackend.connections.subscribe((connection) => {
				expect(connection.request.method).toBe(RequestMethod.Post);
				connection.mockRespond(new Response(new ResponseOptions({ status: 201 })));
			});

			const mandate = new Mandate();

			service.save(mandate).subscribe((response) => {
				expect(response).toBeDefined();
				expect(response.status).toEqual(201);
			});
		})
		)
	);
});

