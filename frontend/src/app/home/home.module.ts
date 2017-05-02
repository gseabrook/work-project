import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MaterialModule } from '@angular/material';
import { FlexLayoutModule } from '@angular/flex-layout';

import { HomeComponent } from './home.component';
import { HomeRoutingModule } from './home-routing.module';
import { MandateModule } from '../mandate/mandate.module';
import { AuthModule } from '../auth/auth.module';

@NgModule({
	imports: [
		CommonModule,
		MaterialModule,
		HomeRoutingModule,
		MandateModule,
		FlexLayoutModule,
		AuthModule
	],
	declarations: [
		HomeComponent
	]
})
export class HomeModule { }
