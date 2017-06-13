import { Injectable } from '@angular/core';
import { MdDialog } from '@angular/material';
import { ConfirmationDialogComponent } from './confirmation-dialog.component';

@Injectable()
export class ConfirmationDialogService {

	constructor(
		private dialog: MdDialog,
	) { }

	openConfirmationDialog(options) {
		let dialogRef = this.dialog.open(ConfirmationDialogComponent);
		dialogRef.componentInstance.message = options.message;
		return dialogRef.afterClosed();
	}
}
