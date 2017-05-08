import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { MdDialog } from '@angular/material';

import { Mandate } from '../model/mandate';
import { User } from '../../model/user';
import { MandateService } from '../mandate.service';
import { MandateFormComponent } from '../form/mandate-form.component';

@Component({
	selector: 'app-mandate-list',
	templateUrl: './mandate-list.component.html',
	styleUrls: ['./mandate-list.component.css']
})
export class MandateListComponent implements OnInit {

	mandates: Mandate[] = [];
	user: User;

	constructor(
		private mandateService: MandateService,
		private router: Router,
		private route: ActivatedRoute,
		private dialog: MdDialog
	) { }

	ngOnInit() {
		this.route.data.subscribe((data: { user: User }) => {
			this.user = data.user;
		});

		this.mandateService.get().then(mandates => this.mandates = mandates);
	}

	selectMandate(mandate: Mandate) {
		this.dialog.open(MandateFormComponent, {
			data: {
				mandate: mandate
			}
		});
	}

}
