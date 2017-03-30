import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { Mandate } from '../model/mandate';
import { RegistrationService } from '../registration.service';

@Component({
	selector: 'app-mandate-list',
	templateUrl: './mandate-list.component.html',
	styleUrls: ['./mandate-list.component.css']
})
export class MandateListComponent implements OnInit {

	mandates: Mandate[] = [];

	constructor(private registrationService: RegistrationService, private router: Router) { }

	ngOnInit() {
		this.registrationService.get().then(mandates => this.mandates = mandates);
	}

}
