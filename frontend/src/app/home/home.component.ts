import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router, Params } from '@angular/router';
import { FlexLayoutModule } from '@angular/flex-layout';
import { AuthService } from '../auth/auth.service';
import { User } from '../model/user';

@Component({
	selector: 'app-home',
	templateUrl: './home.component.html',
	styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{

	user: User;

	constructor(
		private router: Router,
		private route: ActivatedRoute,
		private authService: AuthService
	) { }

	ngOnInit() {
		this.route.data.subscribe((data: { user: User }) => {
			this.user = data.user;
		});
	}

	logout() {
		this.authService.logout().subscribe(() => this.router.navigate(['login']));
	}
}
