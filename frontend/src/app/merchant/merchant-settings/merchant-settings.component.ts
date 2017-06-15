import { Component, OnInit } from '@angular/core';
import { RequestOptions, Request, RequestMethod, Headers, Http } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { Router, ActivatedRoute } from '@angular/router';
import { User } from '../../model/user';
import { ErrorResponse } from '../../model/errorResponse';
import { Merchant } from '../model/merchant';
import { MerchantSettingsService } from './merchant-settings.service';
import { MerchantService } from '../merchant.service';
import { DisplayEnum } from '../../model/displayEnum';
import { DialogService } from '../../dialog/dialog.service';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';

@Component({
	selector: 'app-merchant-settings',
	templateUrl: './merchant-settings.component.html',
	styleUrls: ['./merchant-settings.component.css']
})
export class MerchantSettingsComponent implements OnInit {

	user: User;
	logo: any;
	allFrequencies: DisplayEnum[];
	showSuccess: boolean = false;
	merchant: Merchant;
	errors: any = [];

	constructor(
		private http: Http, 		
		private route: ActivatedRoute,
		private merchantSettingsService: MerchantSettingsService,
		private merchantService: MerchantService,
		private dialogService: DialogService
	) { }

	ngOnInit() { 
  		this.user = this.route.snapshot.data['user'];
  		this.merchantService.getMerchant(this.user.id).subscribe((merchant) => {
  			this.merchant = merchant;
  		});
  		this.merchantSettingsService.getFrequencies().subscribe((frequencies) => this.allFrequencies = frequencies);
	}

	addPurpose() {
		this.dialogService.openInputDialog({
			label: 'Purpose of payment'
		})
		.filter(value => !!value)
		.subscribe(value => this.merchant.merchantSettings.purposeOfPayments.push(value));
	}

	fileSelected(file) {
		this.logo = file;
	}

	frequencySelected(frequency: DisplayEnum) {
		return this.merchant.merchantSettings.selectedFrequencies.filter(freq => freq.value === frequency.value).length > 0;
	}

	removePurpose(purpose: string) {
		let idx = this.merchant.merchantSettings.purposeOfPayments.indexOf(purpose);
		this.merchant.merchantSettings.purposeOfPayments.splice(idx, 1);
	}

	save() {
		this.showSuccess = false;
		this.errors = [];
		let formData: FormData = new FormData();
		if (this.logo) {
			formData.append('logo', this.logo, this.logo.name);
		}

		let merchantSettings = this.merchant.merchantSettings;
		merchantSettings.selectedFrequencies.forEach((value: DisplayEnum) => formData.append('frequency', value.value));
		merchantSettings.purposeOfPayments.forEach((value: string) => formData.append('purposeOfPayment', value));

		let headers = new Headers();
		headers.append('Accept', 'application/json');
		
		let options = new RequestOptions({ headers: headers });
		
		this.http.put("merchant/" + this.user.id + "/settings", formData, options)
			.subscribe(
				() => this.showSuccess = true,
				error => this.errors = new ErrorResponse().deserialize(error.json()).fieldErrors
			);
	}

	updateFrequencies(ev) {
		let selectedFrequencies = this.merchant.merchantSettings.selectedFrequencies;
		let frequencyClicked = this.allFrequencies.filter(freq => freq.value === ev.source.value)[0];

		var idx = selectedFrequencies.indexOf(frequencyClicked);
		if (idx > -1) {
			selectedFrequencies.splice(idx, 1);
		} else {
			selectedFrequencies.push(frequencyClicked);
		}
	}
}
