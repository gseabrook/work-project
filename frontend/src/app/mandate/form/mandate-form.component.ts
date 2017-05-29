import { Component, OnInit, Optional } from '@angular/core';
import { Location } from '@angular/common';
import { FlexLayoutModule } from '@angular/flex-layout';
import { NgForm } from '@angular/forms';
import { Response } from '@angular/http';
import { Router, ActivatedRoute } from '@angular/router';
import { MdDialog, MdDialogRef } from '@angular/material';

import { Bank } from '../model/bank';
import { Mandate } from '../model/mandate';
import { MandateService } from '../mandate.service';
import { FpxAuthenticationComponent } from '../fpx-authentication/fpx-authentication.component';
import { ErrorResponse } from '../../model/errorResponse';
import { ValidationError } from '../../model/validationError';
import { User } from '../../model/user'; 
import { MandateFormService } from './mandate-form.service';
import { DisplayEnum } from '../model/displayEnum';

@Component({
	selector: 'mandate-form',
	templateUrl: './mandate-form.component.html',
	styleUrls: ['./mandate-form.component.css']
})
export class MandateFormComponent implements OnInit {

	banks: Bank[];
	frequencyTypes: DisplayEnum[];
	idTypes: DisplayEnum[];
	model: Mandate;
	user: User;
	mode: string;
	fpxData: any;
	errors: ValidationError[] = [];

	constructor(
		private mandateService: MandateService,
		private mandateFormService: MandateFormService,
		private dialog: MdDialog,
		private location: Location,
		private router: Router,
		private route: ActivatedRoute,
		@Optional() private dialogRef: MdDialogRef<FpxAuthenticationComponent>
	) { }

	ngOnInit() {
		if (this.dialogRef) {
			this.model = this.dialogRef.config.data.mandate.clone();
			this.mode = 'dialog';
			this.user = this.dialogRef.config.data.user;
		} else {
			this.route.data.subscribe((data: { user: User, mandate: Mandate, mode: string }) => {
				this.model = data.mandate;
				this.mode = data.mode;
				this.user = data.user;
			});
		}

		this.mandateFormService.getBanks().subscribe(banks => {
			this.banks = banks

			if (this.model.customerBankAccount && this.model.customerBankAccount.bank) {
				this.model.customerBankAccount.bank = banks.filter(bank => bank.id === this.model.customerBankAccount.bank.id)[0];
			}
		});

		this.mandateFormService.getFrequencies().subscribe(frequencies => {
			this.frequencyTypes = frequencies;

			if (this.model.frequency) {
				this.model.frequency = frequencies.filter(freq => freq.value === this.model.frequency.value)[0];
			}
		});
	}

	close(success) {
		this.dialogRef.close(success ? this.model : undefined);
	}

	displayFormErrors(mandateForm: NgForm) {
		this.errors = [];
		let validationErrors = Object.keys(mandateForm.form.controls)
			.filter(key => !mandateForm.form.controls[key].valid)
			.map(field => {
				return new ValidationError().deserialize({
					field: field, 
					value: "", 
					message: field + " is not valid"
				});
			});
		Array.prototype.push.apply(this.errors, validationErrors);
	}

	email(mandateForm: NgForm) {
		if (mandateForm.valid) {
			this.mandateFormService.email(this.model).subscribe(
				result => this.handleSuccess(result),
				error => this.handleError(error)
			)
		}
	}

	processFpxRedirect(result: Response) {
		var form = document.createElement("form");
    	form.setAttribute("method", "POST");
    	form.setAttribute("action", "http://localhost:8080");
		var fpxFormData = result.json();

		for (const key of Object.keys(fpxFormData)) {
			var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", fpxFormData[key]);
            form.appendChild(hiddenField);
		}

		document.body.appendChild(form);
		form.submit();    	
	}

	save(mandateForm: NgForm) {
		if (mandateForm.valid) {
			this.mandateService.save(this.model).subscribe(
				result => this.processFpxRedirect(result),
				error => this.handleError(error)
			);
		} else {
			this.displayFormErrors(mandateForm);
		}
	}

	showFpxDialog() {
		return this.dialog.open(FpxAuthenticationComponent, {
			data: {
				mandate: this.model
			}
		});
	}

	authorise(mandateForm: NgForm) {
		if (mandateForm.valid) {
			this.showFpxDialog().afterClosed().subscribe(success => {
				if (success) {
					this.model.authorise();
					this.mandateService.update(this.model).subscribe(
						result => {
							if (this.dialogRef) {
								this.close(true);
							} else {
								this.router.navigate(['/mandate-complete'])
							}
						}
					);
				}
			});
		}
	}

	private handleSuccess(result) {
		this.router.navigate(['../mandate-list'], { relativeTo: this.route });
	}

	private handleError(result: Response) {
		if (result.status === 422) {
			Array.prototype.push.apply(this.errors, new ErrorResponse().deserialize(result.json()).fieldErrors);
		} else {
			let error = new ValidationError();
			error.message = "Error: " + result.json().message;
			this.errors = [error];
		}
	}
}
