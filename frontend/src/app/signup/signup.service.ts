import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { SignUp } from './signup';

@Injectable()
export class SignUpService {

	private headers = new Headers({ 'Content-Type': 'application/json' });

	constructor(private http: Http) { }

	signUp(signUp: SignUp) {
		return this.http.post("user", JSON.stringify(signUp), { headers: this.headers });
	}

}
