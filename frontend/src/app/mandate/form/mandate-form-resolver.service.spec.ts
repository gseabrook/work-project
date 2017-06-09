import { TestBed, inject, fakeAsync } from '@angular/core/testing';
import { RouterStateSnapshot, ActivatedRouteSnapshot } from '@angular/router';
import { Observable } from 'rxjs/Observable';
import { Response, ResponseOptions } from '@angular/http';
import { MockBackend, MockConnection } from '@angular/http/testing';

import { MandateFormResolver } from './mandate-form-resolver.service';
import { MandateFormService } from './mandate-form.service';
import { AuthService } from '../../auth/auth.service';
import { MerchantService } from '../../merchant/merchant.service';
import { TestModule } from '../../../test/test.module';

import * as userMerchant from '../../../../fixtures/userMerchant.json';
import * as merchant from '../../../../fixtures/merchant.json';

describe('MandateFormResolver', () => {

	beforeEach(() => {
		TestBed.configureTestingModule({
			imports: [TestModule],
			providers: [{
				provide: AuthService,
				useValue: {
					getUserDetailsObservable: function() {
						return Observable.of(userMerchant);
					}
				}
			},
				MandateFormResolver, MandateFormService, MerchantService],
		});
	});

	it('should initialise a new mandate with the merchant information', function(done) {
		fakeAsync(inject([MandateFormResolver, MockBackend], (service: MandateFormResolver, mockBackend: MockBackend) => {

			let connections: MockConnection[] = [];
			mockBackend.connections.subscribe((c: MockConnection) => connections.push(c));

			service.resolve(<ActivatedRouteSnapshot>{ queryParams: {} }, <RouterStateSnapshot>{}).subscribe((mandate) => {
				expect(mandate.merchant).toBeTruthy();
				done();
			});

			connections.pop().mockRespond(new Response(new ResponseOptions({ body: merchant, status: 200 })));
		}))();
	});
});
