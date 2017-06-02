import { TestBed, inject } from '@angular/core/testing';

import { FpxService } from './fpx.service';

describe('FpxService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [FpxService]
    });
  });

  it('should ...', inject([FpxService], (service: FpxService) => {
    expect(service).toBeTruthy();
  }));
});
