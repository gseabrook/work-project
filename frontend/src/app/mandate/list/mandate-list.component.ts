import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { MdDialog, MdSnackBar } from '@angular/material';

import { Mandate } from '../model/mandate';
import { User } from '../../model/user';
import { MandateService } from '../mandate.service';
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
		private snackBar: MdSnackBar,
		private confirmationDialogService: ConfirmationDialogService 
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
				mandate: mandate,
				user: this.user
			}
		});
	}

	terminateMandate(mandate: Mandate) {
		this.confirmationDialogService.openConfirmationDialog({
			message: 'Are you sure you wish to terminate this mandate?'
		}).subscribe((success) => {
			if (success) {
				mandate.status = DisplayEnum.of("TERMINATED", "Terminated");
				this.mandateService.update(mandate).subscribe(() => { });
				this.snackBar.open("Mandate terminated", "", {
					duration: 2000
				});
			}
		});
	}

}
