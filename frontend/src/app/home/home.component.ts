import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router, Params } from '@angular/router';

@Component({
	selector: 'app-home',
	templateUrl: './home.component.html',
	styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

	constructor(
		private router: Router,
		private route: ActivatedRoute,
	) { }

	ngOnInit() {
	}

	link() {
		this.router.navigate(['registration-list'], { relativeTo: this.route });
	}

}
