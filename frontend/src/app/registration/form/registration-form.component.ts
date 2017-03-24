import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';
import { FlexLayoutModule } from '@angular/flex-layout';
import { NgForm } from '@angular/forms';
import { Response } from '@angular/http';
import { Router } from '@angular/router';
import { MdDialog } from '@angular/material';

import { Bank } from '../model/bank';
import { Registration } from '../model/registration';
import { RegistrationService } from '../registration.service';
import { FpxAuthenticationComponent } from '../fpx-authentication/fpx-authentication.component';
import { ErrorResponse } from '../../model/errorResponse';
import { ValidationError } from '../../model/validationError';

@Component({
	selector: 'registration-form',
	templateUrl: './registration-form.component.html',
	styleUrls: ['./registration-form.component.css']
})
export class RegistrationFormComponent {
	vm: RegistrationFormComponent = this;

	constructor(
		private registrationService: RegistrationService,
		private dialog: MdDialog,
		private location: Location,
		private router: Router
	) { }

	model: Registration = Registration.newRegistration();
	fieldErrors : ValidationError[] = [];

	idTypes = [
		{ value: 'PASSPORT_NUMBER', viewValue: 'Passport Number' },
		{ value: 'NRIC', viewValue: 'NRIC' },
		{ value: 'OLD_IC', viewValue: 'Old IC' },
		{ value: 'BUSINESS_REGISTRATION_NUMBER', viewValue: 'Business Registration' }
	];

	banks = [
		new Bank('b7bc8b7449614d159ce0869306f04d36-c5c7e7e7d62c46a4a6fae91dc22004d9', 'AFFB0123', 'Affin Bank'),
		new Bank('b7bc8b7449614d159ce0869306f04d36-cccab6d0af204c8795d11e13698796b8', 'BIMB0340', 'Bank Islam'),
		new Bank('b7bc8b7449614d159ce0869306f04d36-h37714a8ad974a8d8977d27bcbf6c52c', 'BOFA0207', 'Bank of America')
	];

	frequencyTypes = [
		{ value: 'DAILY', viewValue: 'Daily' },
		{ value: 'WEEKLY', viewValue: 'Weekly' },
		{ value: 'MONTHLY', viewValue: 'Monthly' },
		{ value: 'QUARTERLY', viewValue: 'Quarterly' },
		{ value: 'YEARLY', viewValue: 'Yearly' }
	];

	save(registrationForm: NgForm) {
		if (registrationForm.valid) {
			 let dialogRef = this.dialog.open(FpxAuthenticationComponent, {
				data: {
					registration: this.model
				}
			});

			dialogRef.afterClosed().subscribe(success => { 
				if (success) {
					this.registrationService.save(this.model)
						.subscribe(
							result => this.router.navigate(['/home/registration-list']),
							error => Array.prototype.push.apply(this.fieldErrors, new ErrorResponse().deserialize(error.json()).fieldErrors)
					);
				}
			});
		}
	}
}
