import { Injectable } from '@angular/core';
import { Headers, Http, URLSearchParams } from '@angular/http';

import { User } from '../model/user';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/observable/of';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/delay';
import 'rxjs/add/operator/toPromise';

@Injectable()
export class AuthService {

	loginUrl = 'login';
	isLoggedIn = false;
	redirectUrl: string;

	constructor(private http: Http) {}

	login(username: string, password: string): Promise<any> {
		const body = new URLSearchParams();
		body.set('username', username);
		body.set('password', password);

		return this.http
			.post(this.loginUrl, body, {
				withCredentials: true
			})
			.toPromise()
			.then(() => this.isLoggedIn = true)
			.catch(this.handleError);
	}

	logout() {
		this.isLoggedIn = false;
		return this.http.get('logout');
	}

	getUserDetails(): Promise<User> {
		return this.http
			.get('user')
			.toPromise()
			.then(response => new User().deserialize(response.json()));
	}

	getUserDetailsObservable(): Observable<User> {
		return this.http
			.get('user')
			.map(response => new User().deserialize(response.json()));
	}

	private handleError(error: any): Promise<any> {
		return Promise.reject(error.message || error);
	}

}