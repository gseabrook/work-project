import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { Bank } from '../model/bank';
import { Mandate } from '../model/mandate';
import { DisplayEnum } from '../model/displayEnum';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

@Injectable()
export class MandateFormService {

	private headers = new Headers({ 'Content-Type': 'application/json' });

	constructor(private http: Http) { }

	getBanks(): Observable<Bank[]> {
		return this.http
			.get('bank', { headers: this.headers})
			.map(this.extractData);
	}

	getFrequencies(): Observable<DisplayEnum[]> {
		return this.http
			.get('mandate/frequency', { headers: this.headers })
			.map(this.extractDisplayEnum);
	}

	getIdTypes(): Observable<DisplayEnum[]> {
		return this.http
			.get('mandate/idType', { headers: this.headers })
			.map(this.extractDisplayEnum);
	}

	getMandate(id: string): Observable<Mandate> {
		return this.http
			.get('mandate/' + id, { headers: this.headers })
			.map(x => new Mandate().deserialize(x.json()));
	}

	email(mandate: Mandate) {
		return this.http
			.post('merchant/mandate?email=true', JSON.stringify(mandate), { headers: this.headers });
	}

	private extractDisplayEnum(res: Response) {
		const body = res.json();
		return body.map(displayEnum => new DisplayEnum().deserialize(displayEnum));		
	}

	private extractData(res: Response) {
		const body = res.json();
		return body.map(bank => new Bank().deserialize(bank));
	}

}
