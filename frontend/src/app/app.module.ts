import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FlexLayoutModule } from '@angular/flex-layout';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { MaterialModule } from '@angular/material';
import { RouterModule } from '@angular/router';

import { Md2Module } from 'md2';

import { HomeModule } from './home/home.module';
import { LoginModule } from './login/login.module';
import { RegistrationModule } from './registration/registration.module';
import { SignUpModule } from './signup/signup.module';

import { AppComponent } from './app.component';

import { AuthGuard } from './auth-guard.service';
import { AuthService } from './auth.service';

import { AppRoutingModule } from './app-routing.module';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    FlexLayoutModule,
    FormsModule,
    HttpModule,
    MaterialModule.forRoot(),
    Md2Module.forRoot(),
    HomeModule,
    LoginModule,
    RegistrationModule,
    SignUpModule,
    AppRoutingModule
  ],
  providers: [
    AuthGuard,
    AuthService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
