import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Login } from './login';
import { AuthService } from '../auth.service';

@Component({
	selector: 'app-login',
	templateUrl: './login.component.html',
	styleUrls: ['./login.component.css']
})
export class LoginComponent {

	model = new Login('', '');

	constructor(private authService: AuthService, private router: Router) { }

	login() {
		this.authService.login(this.model.username, this.model.password).then(() => {
			let redirect = this.authService.redirectUrl ? this.authService.redirectUrl : '/home';

			this.router.navigate([redirect]);
		});
	}
}
