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
import { MandateFormService } from './mandate-form.service';

@Component({
	selector: 'mandate-form',
	templateUrl: './mandate-form.component.html',
	styleUrls: ['./mandate-form.component.css']
})
export class MandateFormComponent implements OnInit {

  	banks: Bank[];

	constructor(
		private registrationService: RegistrationService,
		private mandateFormService: MandateFormService,
		private dialog: MdDialog,
		private location: Location,
		private router: Router
	) { }

	ngOnInit() {
		this.mandateFormService.getBanks().subscribe(banks => this.banks = banks);
	}

	model: Registration = Registration.newRegistration();
	fieldErrors : ValidationError[] = [];

	idTypes = [
		{ value: 'PASSPORT_NUMBER', viewValue: 'Passport Number' },
		{ value: 'NRIC', viewValue: 'NRIC' },
		{ value: 'OLD_IC', viewValue: 'Old IC' },
		{ value: 'BUSINESS_REGISTRATION_NUMBER', viewValue: 'Business Registration' }
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
