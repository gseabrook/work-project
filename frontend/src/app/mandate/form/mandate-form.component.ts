import { Component, OnInit, Optional, Inject } from '@angular/core';
import { Location } from '@angular/common';
import { FlexLayoutModule } from '@angular/flex-layout';
import { NgForm, FormControl } from '@angular/forms';
import { Response } from '@angular/http';
import { Router, ActivatedRoute } from '@angular/router';
import { MdDialog, MdDialogRef, MD_DIALOG_DATA } from '@angular/material';

import { Bank } from '../model/bank';
import { Mandate } from '../model/mandate';
import { MandateService } from '../mandate.service';
import { MerchantService } from '../../merchant/merchant.service';
import { FpxService } from '../fpx.service';
import { ErrorResponse } from '../../model/errorResponse';
import { ValidationError } from '../../model/validationError';
import { User } from '../../model/user';
import { MandateFormService } from './mandate-form.service';
import { DisplayEnum } from '../../model/displayEnum';

import 'rxjs/add/operator/startWith';
import 'rxjs/add/operator/map';

@Component({
	selector: 'mandate-form',
	templateUrl: './mandate-form.component.html',
	styleUrls: ['./mandate-form.component.css']
})
export class MandateFormComponent implements OnInit {

	banks: Bank[];
	frequencyTypes: DisplayEnum[];
	model: Mandate;
	user: User;
	mode: string;
	fpxData: any;
	errors: ValidationError[] = [];
	popCtrl: FormControl;
	filteredPurposes: any;

	constructor(
		private merchantService: MerchantService,
		private mandateService: MandateService,
		private mandateFormService: MandateFormService,
		private fpxService: FpxService,
		private dialog: MdDialog,
		private location: Location,
		private router: Router,
		private route: ActivatedRoute,
		@Optional() @Inject(MD_DIALOG_DATA) private data: any,
		@Optional() private dialogRef: MdDialogRef<MandateFormComponent>
	) {
		this.popCtrl = new FormControl();
		this.filteredPurposes = this.popCtrl.valueChanges
			.startWith(null)
			.map(name => this.filterPurposes(name));
	}

	ngOnInit() {
		if (this.dialogRef) {
			this.model = this.data.mandate.clone();
			this.mode = 'dialog';
			this.user = this.data.user;
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

		this.frequencyTypes = this.model.merchant.merchantSettings.selectedFrequencies;
		if (this.model.frequency) {
			this.model.frequency = this.frequencyTypes.filter(freq => freq.value === this.model.frequency.value)[0];
		}
	}

	filterPurposes(val: string) {
		let allPurposes = this.model.merchant.merchantSettings.purposeOfPayments
		return val ? allPurposes.filter(s => new RegExp(`^${val}`, 'gi').test(s)) : allPurposes;
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

	authorise(mandateForm: NgForm) {
		this.checkFormValidity(mandateForm, this.authoriseFormAndHandleResut);
	}

	email(mandateForm: NgForm) {
		this.checkFormValidity(mandateForm, this.emailFormAndHandleResult);
	}

	proceed(mandateForm: NgForm) {
		this.checkFormValidity(mandateForm, this.saveFormAndHandleResult);
	}

	private authoriseFormAndHandleResut() {
		this.model.requestAuthorisation();
		this.mandateService.update(this.model)
			.subscribe(this.fpxService.processFpxRedirect);
	}

	private emailFormAndHandleResult() {
		this.mandateFormService.email(this.model).subscribe(
			result => this.handleSuccess(result),
			error => this.handleError(error)
		);
	}

	private saveFormAndHandleResult() {
		this.model.requestAuthorisation();
		this.mandateService.save(this.model).subscribe(
			result => this.fpxService.processFpxRedirect(result),
			error => this.handleError(error)
		);
	}

	private checkFormValidity(mandateForm: NgForm, successCallback: Function) {
		if (mandateForm.valid) {
			successCallback.call(this);
		} else {
			this.displayFormErrors(mandateForm);
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
