import { TestBed, inject } from '@angular/core/testing';

import { MandateFormResolver } from './mandate-form-resolver.service';
import { MandateFormService } from './mandate-form.service';

describe('MandateFormResolver', () => {
	
	let service: MandateFormResolver;

	var mockService = {
		getMandate: function(id) {

		}
	};
	
	it('should ...', () => {
		service = new MandateFormResolver(mockService as MandateFormService);
		expect(service).toBeTruthy();
	});
});
