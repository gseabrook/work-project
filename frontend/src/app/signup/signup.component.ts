import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { SignUp } from './signup';
import { SignUpService } from './signup.service';

@Component({
	selector: 'app-signup',
	templateUrl: './signup.component.html',
	styleUrls: ['./signup.component.css']
})
export class SignUpComponent{

	model = new SignUp();

	constructor(private signUpService: SignUpService, private router: Router) { }

	signUp() {
		this.signUpService.signUp(this.model).subscribe(
			success => this.router.navigate(['/home'])
		);
	}

}
