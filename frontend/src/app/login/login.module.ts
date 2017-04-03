import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MaterialModule } from '@angular/material';
import { FlexLayoutModule } from '@angular/flex-layout';
import { LoginComponent } from './login.component';
import { RouterModule } from '@angular/router';

@NgModule({
	imports: [
		CommonModule, FormsModule, MaterialModule, FlexLayoutModule, RouterModule
	],
	declarations: [
		LoginComponent
	],
	exports: [
		LoginComponent
	],
	providers: [
	]
})
export class LoginModule { }
