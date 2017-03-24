import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router, Params } from '@angular/router';
import { FlexLayoutModule } from '@angular/flex-layout';
import { AuthService } from '../auth.service';

@Component({
	selector: 'app-home',
	templateUrl: './home.component.html',
	styleUrls: ['./home.component.css']
})
export class HomeComponent {

	constructor(
		private router: Router,
		private route: ActivatedRoute,
		private authService: AuthService
	) { }

	logout() {
		this.authService.logout().subscribe(() => this.router.navigate(['login']));
	}
}
