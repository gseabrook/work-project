import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MaterialModule } from '@angular/material';

import { LoginComponent } from './login.component';

@NgModule({
	imports: [
		CommonModule, FormsModule, MaterialModule
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
