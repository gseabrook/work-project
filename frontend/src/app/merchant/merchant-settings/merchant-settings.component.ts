import { Component, OnInit } from '@angular/core';
import { RequestOptions, Request, RequestMethod, Headers, Http } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { Router, ActivatedRoute } from '@angular/router';
import { User } from '../../model/user';
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
	frequencies: string[];
	daily: string = 'Daily';
	monthly: string = 'Monthly';

	constructor(
		private http: Http, 		
		private route: ActivatedRoute
	) { }

	ngOnInit() { 
  		this.user = this.route.snapshot.data['user'];
	}

	fileSelected(file) {
		this.logo = file;
	}

	save() {
		let formData: FormData = new FormData();
		formData.append('logo', this.logo, this.logo.name);
		
		let headers = new Headers();
		headers.append('Accept', 'application/json');
		
		let options = new RequestOptions({ headers: headers });
		
		this.http.put("merchant/" + this.user.id + "/settings", formData, options)
			.map(res => res.json())
			.catch(error => Observable.throw(error))
			.subscribe(
				data => console.log('success'),
				error => console.log(error)
			);
	}

	updateFrequencies(ev) {
		console.log(ev);
	}
}
