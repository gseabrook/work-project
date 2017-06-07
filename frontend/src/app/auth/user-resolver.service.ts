import { Injectable } from '@angular/core';
import { Router, Resolve, RouterStateSnapshot, ActivatedRouteSnapshot } from '@angular/router';
import { User } from '../model/user';
import { AuthService } from './auth.service';
import { Observable } from 'rxjs/Observable';

@Injectable()
export class UserResolver implements Resolve<User> {

  constructor(private authService: AuthService) { }

  	resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Promise<User> {
  		return this.authService.getUserDetails();
  	}

}
