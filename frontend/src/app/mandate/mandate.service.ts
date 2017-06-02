import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';

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

	update(mandate: Mandate) {
		return this.http
			.put('mandate/' + mandate.id, JSON.stringify(mandate), { headers: this.headers});
	}

	get() {
		return this.http
			.get('user/mandate', { headers: this.headers })
			.toPromise()
			.then(response => response.json().map(x => new Mandate().deserialize(x)));
	}

	getMandate(id: string): Observable<Mandate> {
		return this.http
			.get('mandate/' + id, { headers: this.headers })
			.map(x => new Mandate().deserialize(x.json()));
	}

	terminate(mandate: Mandate): Observable<Response> {
		return this.http.delete('mandate/' + mandate.id);
	}
}
