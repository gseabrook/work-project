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
			.post("merchant/mandate", JSON.stringify(registration), { headers: this.headers });
	}

	get() {
		return this.http
			.get("merchant/mandate", { headers: this.headers })
			.toPromise()
			.then(response => response.json() as Registration[]);
	}

}
