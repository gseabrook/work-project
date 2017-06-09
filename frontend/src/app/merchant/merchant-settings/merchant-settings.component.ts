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
	selectedFrequencies: string[] = [];
	allFrequencies: DisplayEnum[];
	showSuccess: boolean = false;
	merchant: Merchant;
	errors: any = [];

	constructor(
		private http: Http, 		
		private route: ActivatedRoute,
		private merchantSettingsService: MerchantSettingsService,
		private merchantService: MerchantService
	) { }

	ngOnInit() { 
  		this.user = this.route.snapshot.data['user'];
  		this.merchantService.getMerchant(this.user.id).subscribe((merchant) => {
  			this.merchant = merchant;
  			this.selectedFrequencies = merchant.merchantSettings.selectedFrequencies.map((de) => de.value);
  		});
  		this.merchantSettingsService.getFrequencies().subscribe((frequencies) => this.allFrequencies = frequencies);
	}

	fileSelected(file) {
		this.logo = file;
	}

	save() {
		this.showSuccess = false;
		this.errors = [];
		let formData: FormData = new FormData();
		if (this.logo) {
			formData.append('logo', this.logo, this.logo.name);
		}

		this.selectedFrequencies.forEach((value) => formData.append('frequency', value));

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
		var idx = this.selectedFrequencies.indexOf(ev.source.value);
		if (idx > -1) {
			this.selectedFrequencies.splice(idx, 1);
		} else {
			this.selectedFrequencies.push(ev.source.value);
		}
	}
}
