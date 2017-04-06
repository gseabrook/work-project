import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';

import 'rxjs/add/operator/toPromise';

import { Mandate } from './model/mandate';

@Injectable()
export class MandateService {

	private headers = new Headers({ 'Content-Type': 'application/json' });

	constructor(private http: Http) { }

	save(mandate: Mandate) {
		return this.http
			.post('merchant/mandate', JSON.stringify(mandate), { headers: this.headers });
	}

	get() {
		return this.http
			.get('user/mandate', { headers: this.headers })
			.toPromise()
			.then(response => response.json().map(x => new Mandate().deserialize(x)));
	}

}
