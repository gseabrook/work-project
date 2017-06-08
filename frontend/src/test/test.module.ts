import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';
import { BaseRequestOptions, Http } from '@angular/http';
import { RouterTestingModule } from '@angular/router/testing';
import { MockBackend } from '@angular/http/testing';

@NgModule({
	imports: [
		CommonModule, NoopAnimationsModule, RouterTestingModule
	],
	declarations: [],
	providers: [{
		provide: Http,
		useFactory: (mockBackend, options) => {
			return new Http(mockBackend, options);
		},
		deps: [MockBackend, BaseRequestOptions]
	},
		MockBackend, BaseRequestOptions
	]
})
export class TestModule { }
