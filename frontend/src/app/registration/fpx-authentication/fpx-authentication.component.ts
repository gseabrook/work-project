import { Component, OnInit } from '@angular/core';
import { MdDialog, MdDialogRef } from '@angular/material';
import { Mandate } from '../model/mandate';

@Component({
	selector: 'fpx-authentication',
	templateUrl: './fpx-authentication.component.html',
	styleUrls: ['./fpx-authentication.component.css']
})
export class FpxAuthenticationComponent implements OnInit {

	loggedIn = false;
	mandate: Mandate;
	model = {
		username: '',
		password: ''
	}

	constructor(private dialogRef: MdDialogRef<FpxAuthenticationComponent>) { }

	login() {
		this.loggedIn = true;
	}

	confirmPassword() {
		this.dialogRef.close(true);
	}

	ngOnInit() {
		this.mandate = this.dialogRef.config.data.mandate;
	}

}
