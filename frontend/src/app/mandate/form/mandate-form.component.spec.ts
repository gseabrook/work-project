import { fakeAsync, async, ComponentFixture, TestBed, inject, tick } from '@angular/core/testing';
import { MockBackend, MockConnection } from '@angular/http/testing';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { By } from '@angular/platform-browser';
import { MaterialModule } from '@angular/material';
import { Md2Module } from 'md2';
import { FormsModule } from '@angular/forms';
import { MandateFormComponent } from './mandate-form.component';
import { RouterTestingModule } from '@angular/router/testing';
import { ActivatedRoute, Router } from '@angular/router';
import { MandateService } from '../mandate.service';
import { MandateFormService } from './mandate-form.service';
import { Observable } from 'rxjs/Observable';
import { Mandate } from '../model/mandate';
import { TestHelpers } from '../../../test/test-helpers';

import * as mandatePendingAuthorisation from '../../../../fixtures/mandatePendingAuthorisation.json';
import * as banks from '../../../../fixtures/banks.json';

describe('MandateFormComponent', () => {
  let component: MandateFormComponent;
  let fixture: ComponentFixture<MandateFormComponent>;
  let data: {};

  beforeEach(async(() => {
	TestBed.configureTestingModule({
	  declarations: [ MandateFormComponent ],
	  imports: [MaterialModule, RouterTestingModule, Md2Module, FormsModule],
	  providers: [MandateService, MandateFormService, {
		  provide: ActivatedRoute,
		  useValue: {
			data: Observable.of({
			   mandate: new Mandate().deserialize(mandatePendingAuthorisation),
			   mode: 'standAlone'
			}),
			snapshot: {}
		  }
		},{
			provide: Http,
			useFactory: (mockBackend, options) => {
				return new Http(mockBackend, options);
			},
			deps: [MockBackend, BaseRequestOptions]
		}, MockBackend, BaseRequestOptions]
	})
	.compileComponents();
  }));

  function createComponent() {
	fixture = TestBed.createComponent(MandateFormComponent);
	component = fixture.componentInstance;
	fixture.detectChanges();
  }

  it('should create', () => {
  	createComponent();
	expect(component).toBeTruthy();
  });

  it('should hide some of the html in standalone mode', () => {
  	createComponent();
	expect(fixture.debugElement.queryAll(By.css('div.buttonContainer button')).length).toEqual(1);
	expect(fixture.debugElement.queryAll(By.css('h1.subheader')).length).toEqual(0);
  });

  it('should update the mandate when clicking the button', fakeAsync(inject([MockBackend], (mockBackend) => {
	let connection: MockConnection;
	mockBackend.connections.subscribe((c: MockConnection) => connection = c);

	createComponent();

	connection.mockRespond(new Response(new ResponseOptions({body: banks, status: 200})));
	tick();
	fixture.detectChanges();

	TestHelpers.pickFromMdSelect('md-select[name="bank"]', '1', fixture);
    TestHelpers.inputValue(fixture.debugElement.query(By.css('input[name="accountNumber"]')), '11223344');
    
    expect(component.model.customerBankAccount.accountNumber).toEqual('11223344');
  })));
});
