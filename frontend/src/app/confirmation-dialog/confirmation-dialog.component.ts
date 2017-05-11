import { Component, OnInit, Optional } from '@angular/core';
import { MdDialog, MdDialogRef } from '@angular/material';
import { FlexLayoutModule } from '@angular/flex-layout';

@Component({
	selector: 'app-confirmation-dialog',
	templateUrl: './confirmation-dialog.component.html',
	styleUrls: ['./confirmation-dialog.component.css']
})
export class ConfirmationDialogComponent implements OnInit {

	public message: string;

	constructor(		
		@Optional() private dialogRef: MdDialogRef<ConfirmationDialogComponent>
	) { }

	ngOnInit() { }

	confirm() {
		this.dialogRef.close(true);
	}

	cancel() {
		this.dialogRef.close(false);
	}
}
