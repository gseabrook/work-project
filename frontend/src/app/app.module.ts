import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { FlexLayoutModule } from '@angular/flex-layout';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { MaterialModule } from '@angular/material';
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
import { ConfirmationDialogComponent } from './confirmation-dialog/confirmation-dialog.component';
import { ConfirmationDialogService } from './confirmation-dialog/confirmation-dialog.service';

@NgModule({
	declarations: [
		AppComponent,
		ConfirmationDialogComponent
	],
	imports: [
		BrowserModule,
		FlexLayoutModule,
		FormsModule,
		HttpModule,
		MaterialModule,
		BrowserAnimationsModule,
		Md2Module.forRoot(),
		HomeModule,
		LoginModule,
		MandateModule,
		SignUpModule,
		AppRoutingModule,
		MerchantModule
	],
	entryComponents: [
		ConfirmationDialogComponent
	],
	providers: [
		ConfirmationDialogService
	],
	bootstrap: [AppComponent]
})
export class AppModule { }
