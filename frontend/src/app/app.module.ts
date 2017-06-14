import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { FlexLayoutModule } from '@angular/flex-layout';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { MaterialModule, MdNativeDateModule, MdDatepickerModule } from '@angular/material';
import { RouterModule } from '@angular/router';

import { Md2Module } from 'md2';

import { HomeModule } from './home/home.module';
import { LoginModule } from './login/login.module';
import { MandateModule } from './mandate/mandate.module';
import { SignUpModule } from './signup/signup.module';
import { AuthModule } from './auth/auth.module';
import { MerchantModule } from './merchant/merchant.module';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';

@NgModule({
	declarations: [
		AppComponent
	],
	imports: [
		BrowserModule,
		FlexLayoutModule,
		FormsModule,
		ReactiveFormsModule,
		HttpModule,
		MaterialModule,
		MdDatepickerModule, 
		MdNativeDateModule,
		BrowserAnimationsModule,
		Md2Module.forRoot(),
		HomeModule,
		LoginModule,
		MandateModule,
		SignUpModule,
		AppRoutingModule,
		MerchantModule
	],
	bootstrap: [AppComponent]
})
export class AppModule { }
