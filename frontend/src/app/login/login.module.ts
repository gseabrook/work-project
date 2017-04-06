import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MaterialModule } from '@angular/material';
import { FlexLayoutModule } from '@angular/flex-layout';
import { LoginComponent } from './login.component';
import { RouterModule } from '@angular/router';
import { AuthModule } from '../auth/auth.module';

@NgModule({
	imports: [
		CommonModule, FormsModule, MaterialModule, FlexLayoutModule, RouterModule, AuthModule
	],
	declarations: [
		LoginComponent
	],
	exports: [
		LoginComponent
	]
})
export class LoginModule { }
