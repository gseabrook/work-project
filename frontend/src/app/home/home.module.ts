import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MaterialModule } from '@angular/material';
import { FlexLayoutModule } from '@angular/flex-layout';

import { HomeComponent } from './home.component';
import { HomeRoutingModule } from './home-routing.module';
import { RegistrationModule } from '../registration/registration.module';

@NgModule({
	imports: [
		CommonModule,
		MaterialModule,
		HomeRoutingModule,
		RegistrationModule,
		FlexLayoutModule
	],
	declarations: [
		HomeComponent
	]
})
export class HomeModule { }