import { Injectable } from '@angular/core';
import { MdDialog } from '@angular/material';
import { ConfirmationDialogComponent } from './confirmation/confirmation-dialog.component';
import { InputDialogComponent } from './input/input-dialog.component';

@Injectable()
export class DialogService {

	constructor(
		private dialog: MdDialog,
	) { }

	openConfirmationDialog(options) {
		let dialogRef = this.dialog.open(ConfirmationDialogComponent);
		dialogRef.componentInstance.message = options.message;
		return dialogRef.afterClosed();
	}

	openInputDialog(options: {label: string}) {
		let dialogRef = this.dialog.open(InputDialogComponent, {
			data: {
				label: options.label
			}
		});
		return dialogRef.afterClosed();
	}
}
