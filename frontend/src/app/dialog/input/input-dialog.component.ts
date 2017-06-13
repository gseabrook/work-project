import { Component, OnInit, Optional, Inject } from '@angular/core';
import { MdDialog, MdDialogRef } from '@angular/material';
import { FlexLayoutModule } from '@angular/flex-layout';
import { MD_DIALOG_DATA } from '@angular/material';

@Component({
	selector: 'app-input-dialog',
	templateUrl: './input-dialog.component.html',
	styleUrls: ['./input-dialog.component.css']
})
export class InputDialogComponent implements OnInit {

	public label: string;
	public value: string;

	constructor(
		@Inject(MD_DIALOG_DATA) private data: any,
		private dialogRef: MdDialogRef<InputDialogComponent>
	) { }

	ngOnInit() { 
		this.label = this.data.label || "Input value";
	}

	confirm() {
		this.dialogRef.close(this.value);
	}

	cancel() {
		this.dialogRef.close(false);
	}
}
