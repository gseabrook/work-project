import { Injectable } from '@angular/core';
import { Router, Resolve, RouterStateSnapshot, ActivatedRouteSnapshot } from '@angular/router';
import { Observable } from 'rxjs/Observable';
import { Subject }    from 'rxjs/Subject';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';

import { Mandate } from '../model/mandate';
import { MandateFormService } from './mandate-form.service';

@Injectable()
export class MandateFormResolver implements Resolve<Mandate> {

	constructor(
		private mandateFormService: MandateFormService
	) { }

	resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<Mandate> {
		let id = route.queryParams['id'];

		if (id) {
			return this.mandateFormService.getMandate(id);
		} else {
			return Observable.of(new Mandate());
		}
	}

}
