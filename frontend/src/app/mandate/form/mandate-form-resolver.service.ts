import { Injectable } from '@angular/core';
import { Resolve, RouterStateSnapshot, ActivatedRouteSnapshot } from '@angular/router';
import { Observable } from 'rxjs/Observable';

import { Mandate } from '../model/mandate';
import { User } from '../../model/user';
import { MandateFormService } from './mandate-form.service';
import { AuthService } from '../../auth/auth.service';
import { MerchantService } from '../../merchant/merchant.service';
import { Merchant } from '../../merchant/model/merchant';

import 'rxjs/add/operator/mergeMap';

@Injectable()
export class MandateFormResolver implements Resolve<Mandate> {

	constructor(
		private mandateFormService: MandateFormService,
		private authService: AuthService,
		private merchantService: MerchantService
	) { }

	resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<Mandate> {
		const id = route.queryParams['id'];

		if (id) {
			return this.mandateFormService.getMandate(id);
		} else {
			return this.authService
				.getUserDetailsObservable()
				.flatMap(user => this.merchantService.getMerchant(user.id))
				.flatMap(merchant => Observable.of(new Mandate(merchant)));
		}
	}

}

