import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';

import 'rxjs/add/operator/toPromise';

import { Registration } from './model/registration';

@Injectable()
export class RegistrationService {

	private registrationUrl = 'api/mandate';
	private headers = new Headers({ 'Content-Type': 'application/json' });

	constructor(private http: Http) { }

	save(registration: Registration) {
		return this.http
			.post(this.registrationUrl, JSON.stringify(registration), { headers: this.headers })
			.toPromise()
			.catch(this.handleError);
	}

	get() {
		return this.http
			.get(this.registrationUrl, { headers: this.headers })
			.toPromise()
			.then(response => response.json() as Registration[])
			.catch(this.handleError);
	}

	private handleError(error: any): Promise<any> {
		console.error('An error occurred', error);
		return Promise.reject(error.message || error);
	}

}
