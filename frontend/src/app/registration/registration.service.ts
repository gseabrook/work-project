import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';

import 'rxjs/add/operator/toPromise';

import { Registration } from './model/registration';

@Injectable()
export class RegistrationService {

	private registrationUrl = 'mandate';
	private headers = new Headers({ 'Content-Type': 'application/json' });

	constructor(private http: Http) { }

	save(registration: Registration) {
		return this.http
			.post(this.registrationUrl, JSON.stringify(registration), { headers: this.headers });
	}

	get() {
		return this.http
			.get("merchant/c22816ad803c47ed83400bc787d06ed4-cac5e82e2312435a9bc943028f22133a/mandate", { headers: this.headers })
			.toPromise()
			.then(response => response.json() as Registration[]);
	}

}
