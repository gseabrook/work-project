import { Component, OnInit } from '@angular/core';
import { Response } from '@angular/http';
import { Router, ActivatedRoute } from '@angular/router';
import { MdDialog } from '@angular/material';
import { Observable } from 'rxjs';
import 'rxjs/add/operator/mergeMap';

import { Mandate } from '../model/mandate';
import { User } from '../../model/user';
import { MandateService } from '../mandate.service';
import { FpxService } from '../fpx.service';
import { MandateFormComponent } from '../form/mandate-form.component';
import { DisplayEnum } from '../model/displayEnum';
import { ConfirmationDialogService } from '../../confirmation-dialog/confirmation-dialog.service';

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
		private dialog: MdDialog,
		private confirmationDialogService: ConfirmationDialogService,
		private fpxService: FpxService
	) { }

	ngOnInit() {
		this.route.data.subscribe((data: { user: User }) => {
			this.user = data.user;
		});

		this.mandateService.get()
			.then(mandates => this.mandates = mandates.sort(this.sortMandates));
	}

	sortMandates(a: Mandate, b: Mandate) {
		return a.dateCreated.getTime() > b.dateCreated.getTime() ? -1 : 1;
	}

	selectMandate(mandate: Mandate) {
		this.dialog.open(MandateFormComponent, {
			data: {
				mandate: mandate,
				user: this.user
			}
		}).afterClosed().subscribe(updatedMandate => {
			if (updatedMandate) {
				let idx = this.mandates.findIndex(m => m.id === updatedMandate.id);
				this.mandates.splice(idx, 1, updatedMandate);
			}
		});
	}

	terminateMandate(mandate: Mandate) {
		this.confirmationDialogService.openConfirmationDialog({
			message: 'Are you sure you wish to terminate this mandate?'
		})
		.filter(mandate => !!mandate)
		.flatMap(mandate => this.mandateService.terminate(mandate))
		.subscribe(this.fpxService.processFpxRedirect);
	}

}
