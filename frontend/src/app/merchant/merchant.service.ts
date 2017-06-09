import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { Merchant } from './model/merchant';

@Injectable()
export class MerchantService {

	constructor(private http: Http) { }

	getMerchant(id: string): Observable<Merchant> {
		return this.http.get("merchant/" + id)
			.map(response => new Merchant().deserialize(response.json()))
	}
}
