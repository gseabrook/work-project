import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MerchantSettingsComponent } from './merchant-settings.component';

describe('MerchantSettingsComponent', () => {
  let component: MerchantSettingsComponent;
  let fixture: ComponentFixture<MerchantSettingsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MerchantSettingsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MerchantSettingsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
