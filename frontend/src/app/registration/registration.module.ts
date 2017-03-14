import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FlexLayoutModule } from '@angular/flex-layout';
import { FormsModule } from '@angular/forms';
import { MaterialModule } from '@angular/material';
import { RouterModule } from '@angular/router';
import { Md2Module } from 'md2';

import { RegistrationFormComponent } from './form/registration-form.component';
import { RegistrationListComponent } from './list/registration-list.component';
import { FpxAuthenticationComponent } from './fpx-authentication/fpx-authentication.component';
import { RegistrationService } from './registration.service';
import { CompleteComponent } from './complete/complete.component';

@NgModule({
	imports: [
		CommonModule, FormsModule, MaterialModule, RouterModule, Md2Module.forRoot(), FlexLayoutModule
	],
	declarations: [
		RegistrationFormComponent, RegistrationListComponent, FpxAuthenticationComponent, CompleteComponent
	],
	entryComponents: [
		FpxAuthenticationComponent
	],
	exports: [
		RegistrationFormComponent, RegistrationListComponent, CompleteComponent
	],
	providers: [
		RegistrationService
	]
})
export class RegistrationModule { }
