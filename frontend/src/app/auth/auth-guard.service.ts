import { Injectable } from '@angular/core';
import {
	CanActivate, Router,
	ActivatedRouteSnapshot,
	RouterStateSnapshot
} from '@angular/router';
import { AuthService } from './auth.service';

@Injectable()
export class AuthGuard implements CanActivate {
	constructor(
		private authService: AuthService,
		private router: Router) { }

	canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
		const url: string = state.url;

		return this.checkLogin(url);
	}

	checkLogin(url: string): Promise<boolean> {
		if (this.authService.isLoggedIn) {
			return Promise.resolve(true);
		}

		return this.authService.getUserDetails().then( 
			response => {
				return true
			}, 
			error => {
				this.authService.redirectUrl = url;
				this.router.navigate(['/login']);
				return false;
			}
		);
	}
}
