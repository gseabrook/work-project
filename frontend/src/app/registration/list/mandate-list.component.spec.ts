/* tslint:disable:no-unused-variable */
import { By } from '@angular/platform-browser';
import { TestBed, async, inject } from '@angular/core/testing';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { MockBackend } from '@angular/http/testing';
import { MandateService } from '../mandate.service';
import { Mandate } from '../model/mandate';
import { MaterialModule } from '@angular/material';
import { RouterTestingModule } from '@angular/router/testing';

import data from '/fixtures/mandates.json';

import { MandateListComponent } from './mandate-list.component';

describe('MandateListComponent', () => {
  let component: MandateListComponent;
  let fixture: ComponentFixture<MandateListComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [MandateListComponent],
      imports: [HttpModule, MaterialModule, RouterTestingModule],
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
    })
      .compileComponents();;
  });

  function createComponent() {
    fixture = TestBed.createComponent(MandateListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }

  it('should create', () => {
    createComponent();

    expect(component).toBeTruthy();
  });

  it('should load all the mandates and display them in the table',
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