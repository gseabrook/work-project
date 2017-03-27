import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';
import { FlexLayoutModule } from '@angular/flex-layout';
import { NgForm } from '@angular/forms';
import { Response } from '@angular/http';
import { Router, ActivatedRoute } from '@angular/router';
import { MdDialog } from '@angular/material';

import { Bank } from '../model/bank';
import { Mandate } from '../model/mandate';
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
  	model: Mandate;

	constructor(
		private registrationService: RegistrationService,
		private mandateFormService: MandateFormService,
		private dialog: MdDialog,
		private location: Location,
		private router: Router,
    	private route: ActivatedRoute
	) { }

	ngOnInit() {
		this.route.data.subscribe((data: { mandate: Mandate}) => {
			this.model = data.mandate;
		});

		this.mandateFormService.getBanks().subscribe(banks => this.banks = banks);
	}

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

	email(mandateForm: NgForm) {
		if (mandateForm.valid) {
			this.mandateFormService.email(this.model).subscribe(this.handleSuccess, this.handleError);
		}
	}

	save(mandateForm: NgForm) {
		if (mandateForm.valid) {
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

	private handleSuccess(result) {
		this.router.navigate(['/home/registration-list']);
	}

	private handleError(result) {
		Array.prototype.push.apply(this.fieldErrors, new ErrorResponse().deserialize(result.json()).fieldErrors);
	}
}
