import { Injectable } from '@angular/core';
import { Headers, Http, URLSearchParams } from '@angular/http';

// TODO - Clean up imports
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/observable/of';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/delay';

@Injectable()
export class AuthService {

	loginUrl = "login";
	isLoggedIn: boolean = false;
	redirectUrl: string;

	constructor(private http: Http) {}

	// TODO - Create module for auth service and auth guard
	login(username: string, password: string) {
		let body = new URLSearchParams();
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
		return this.http.get('/logout');
	}

	private handleError(error: any): Promise<any> {
		console.error('An error occurred', error);
		return Promise.reject(error.message || error);
	}

}