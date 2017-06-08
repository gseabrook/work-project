import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { DisplayEnum } from '../../model/displayEnum';

import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

@Injectable()
export class MerchantSettingsService {

	private headers = new Headers({ 'Content-Type': 'application/json' });

	constructor(
		private http: Http
	) { }

	getFrequencies(): Observable<DisplayEnum[]> {
		return this.http
			.get('mandate/frequency', { headers: this.headers })
			.map(DisplayEnum.extract);
	}
}
