import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { User } from '../../model/user'; 
import { Mandate } from '../model/mandate';

@Component({
	selector: 'app-mandate-status',
	templateUrl: './mandate-status.component.html',
	styleUrls: ['./mandate-status.component.css']
})
export class MandateStatusComponent implements OnInit {

	mandate: Mandate;
	user: User;

	constructor(private router: Router,
		private route: ActivatedRoute
	) { }

	ngOnInit() {
		this.route.data.subscribe((data: { user: User, mandate: Mandate }) => {
			this.mandate = data.mandate;
			this.user = data.user;
		});
	}

}
