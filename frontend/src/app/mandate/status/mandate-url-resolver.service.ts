import { Injectable } from '@angular/core';
import { Router, Resolve, RouterStateSnapshot, ActivatedRouteSnapshot } from '@angular/router';
import { Observable } from 'rxjs/Observable';
import { Subject }    from 'rxjs/Subject';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';

import { Mandate } from '../model/mandate';
import { MandateService } from '../mandate.service';

@Injectable()
export class MandateURLResolver implements Resolve<Mandate> {

	constructor(
		private mandateService: MandateService
	) { }

	resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<Mandate> {
		const id = route.params['id'];
		return this.mandateService.getMandate(id);
	}

}
