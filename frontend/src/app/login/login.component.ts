import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Login } from './login';
import { AuthService } from '../auth/auth.service';

@Component({
	selector: 'app-login',
	templateUrl: './login.component.html',
	styleUrls: ['./login.component.css']
})
export class LoginComponent {

	model = new Login('', '');
	showError = false;

	constructor(private authService: AuthService, private router: Router) {
		authService.getUserDetails().then(() => router.navigate(['home'])).catch(() => {});
	}

	login() {
		this.showError = false;
		this.authService.login(this.model.username, this.model.password).then(() => {
			let redirect = this.authService.redirectUrl ? this.authService.redirectUrl : '/home';
			this.router.navigate([redirect]);
		}, () => this.showError = true);
	}
}
