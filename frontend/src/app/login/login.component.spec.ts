/* tslint:disable:no-unused-variable */
import { DebugElement, NgModule } from '@angular/core';
import { async, ComponentFixture, TestBed, inject } from '@angular/core/testing';
import { FormsModule } from '@angular/forms';
import { BaseRequestOptions, HttpModule, Http, Response, ResponseOptions, RequestMethod } from '@angular/http';
import { MockBackend } from '@angular/http/testing';
import { MaterialModule } from '@angular/material';
import { By } from '@angular/platform-browser';
import { Router } from '@angular/router';

import { LoginComponent } from './login.component';
import { AuthService } from '../auth/auth.service';

class RouterStub {
  navigate(args: any[]) { }
}

describe('LoginComponent', () => {
  let component: LoginComponent;
  let fixture: ComponentFixture<LoginComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [LoginComponent],
      imports: [FormsModule, MaterialModule.forRoot()],
      providers: [AuthService,
        { provide: Router, useClass: RouterStub },
        {
          provide: Http,
          useFactory: (mockBackend, options) => {
            return new Http(mockBackend, options);
          },
          deps: [MockBackend, BaseRequestOptions]
        },
        MockBackend,
        BaseRequestOptions]
    })
      .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LoginComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  function inputValue(inputElement, value) {
    const el = inputElement.nativeElement;
    el.value = value;
    el.dispatchEvent(new Event('input'));
  }

  it('should enter values and login',
    async(inject([MockBackend], (mockBackend) => {
      fixture.whenStable().then(() => {
        inputValue(fixture.debugElement.query(By.css('input[name="username"]')), 'JoeDog');
        inputValue(fixture.debugElement.query(By.css('input[name="password"]')), 'supersecretpassword');

        mockBackend.connections.subscribe((connection) => {
          expect(connection.request.method).toBe(RequestMethod.Post);
          expect(connection.request.getBody()).toEqual('username=JoeDog&password=supersecretpassword');

          connection.mockRespond(new Response(new ResponseOptions({ status: 200 })));
        });

        fixture.debugElement.query(By.css('button')).nativeElement.click();
      });
    })));

  it('should show error message for incorrect username and password',
    async(inject([MockBackend], (mockBackend) => {
      fixture.whenStable().then(() => {

        mockBackend.connections.subscribe((connection) => {
          connection.mockRespond(new Response(new ResponseOptions({ status: 401 })));
        });

        fixture.debugElement.query(By.css('button')).nativeElement.click();


      });
    })));
});
