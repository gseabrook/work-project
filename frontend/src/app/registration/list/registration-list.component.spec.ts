/* tslint:disable:no-unused-variable */
import { By } from '@angular/platform-browser';
import { TestBed, async, inject } from '@angular/core/testing';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { MockBackend } from '@angular/http/testing';
import { RegistrationService } from '../registration.service';
import { Registration } from '../registration';
import { MaterialModule } from '@angular/material';
import { Router } from '@angular/router';

class RouterStub {
  navigate(args: any[]) { }
}

import { RegistrationListComponent } from './registration-list.component';

describe('RegistrationListComponent', () => {
  let component: RegistrationListComponent;
  let fixture: ComponentFixture<RegistrationListComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [RegistrationListComponent],
      imports: [HttpModule, MaterialModule],
      providers: [RegistrationService,
        { provide: Router, useClass: RouterStub },
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
    })
      .compileComponents();;
  });

  function createComponent() {
    fixture = TestBed.createComponent(RegistrationListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }

  it('should create', () => {
    createComponent();

    expect(component).toBeTruthy();
  });

  it('should load all the registrations and display them in the table',
    async(inject([MockBackend], (mockBackend) => {
      mockBackend.connections.subscribe((connection) => {
        expect(connection.request.method).toBe(RequestMethod.Get);
        connection.mockRespond(new Response(new ResponseOptions({ status: 200, body: [{ accountHolderName: 'Graham' }] })));
      });

      createComponent();

      fixture.whenStable().then(() => {
        fixture.detectChanges();

        expect(fixture.debugElement.queryAll(By.css('tbody tr')).length).toEqual(1);
      });
    })));

});