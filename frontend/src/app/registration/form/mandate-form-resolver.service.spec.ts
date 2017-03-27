import { TestBed, inject } from '@angular/core/testing';

import { MandateFormResolverService } from './mandate-form-resolver.service';

describe('MandateFormResolverService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [MandateFormResolverService]
    });
  });

  it('should ...', inject([MandateFormResolverService], (service: MandateFormResolverService) => {
    expect(service).toBeTruthy();
  }));
});
