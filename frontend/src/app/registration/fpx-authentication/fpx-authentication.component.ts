import { Component, OnInit } from '@angular/core';
import { MdDialog, MdDialogRef } from '@angular/material';
import { Registration } from '../model/registration';

@Component({
	selector: 'fpx-authentication',
	templateUrl: './fpx-authentication.component.html',
	styleUrls: ['./fpx-authentication.component.css']
})
export class FpxAuthenticationComponent implements OnInit {

	loggedIn = false;
	registration: Registration;
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
		this.registration = this.dialogRef.config.data.registration;
	}

}
