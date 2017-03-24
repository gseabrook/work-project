import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { Bank } from '../model/bank';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

@Injectable()
export class MandateFormService {

	private headers = new Headers({ 'Content-Type': 'application/json' });

	constructor(private http: Http) { }

	getBanks(): Observable<Bank[]> {
		return this.http
			.get("bank", { headers: this.headers})
			.map(this.extractData);
	}

	private extractData(res: Response) {
		let body = res.json();
		return body.map(bank => new Bank().deserialize(bank));
	}

}
