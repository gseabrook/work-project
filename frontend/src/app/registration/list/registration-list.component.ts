import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { Mandate } from '../model/mandate';
import { RegistrationService } from '../registration.service';

@Component({
	selector: 'app-registration-list',
	templateUrl: './registration-list.component.html',
	styleUrls: ['./registration-list.component.css']
})
export class RegistrationListComponent implements OnInit {

	registrations: Mandate[] = [];

	constructor(private registrationService: RegistrationService, private router: Router) { }

	ngOnInit() {
		this.registrationService.get().then(registrations => this.registrations = registrations);
	}

}
