import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { SignUp } from './signup';
import { SignUpService } from './signup.service';
import { ValidationError } from '../model/validationError';
import { ErrorResponse } from '../model/errorResponse';

@Component({
	selector: 'app-signup',
	templateUrl: './signup.component.html',
	styleUrls: ['./signup.component.css']
})
export class SignUpComponent implements OnInit {

	model = new SignUp();
	errors : ValidationError[] = [];

	constructor(
		private signUpService: SignUpService, 
		private router: Router, 
		private route: ActivatedRoute
	) { }

	ngOnInit() {
		this.route.queryParams.subscribe((params: Params) => {
			if (params["token"]) {
				this.model.token = params["token"];
			}
		});
	}

	signUp() {
		this.signUpService.signUp(this.model).subscribe(
			success => this.router.navigate(['/home']),
			error => Array.prototype.push.apply(this.errors, new ErrorResponse().deserialize(error.json()).fieldErrors)
		);
	}

}
