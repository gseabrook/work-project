import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MaterialModule } from '@angular/material';

import { SignUpComponent } from './signup.component';
import { SignUpService } from './signup.service';

@NgModule({
	imports: [
		CommonModule, FormsModule, MaterialModule
	],
	declarations: [
		SignUpComponent
	],
	providers: [
		SignUpService
	]
})
export class SignUpModule { }
