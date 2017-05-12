import { Component, OnInit, Input } from '@angular/core';
import { Customer } from '../../model/customer';
import { MandateFormService } from '../mandate-form.service';
import { DisplayEnum } from '../../model/displayEnum';
import { NgForm } from '@angular/forms';

@Component({
	selector: 'customer-information',
	templateUrl: './customer-information.component.html',
	styleUrls: ['./customer-information.component.css']
})
export class CustomerInformationComponent implements OnInit {

	@Input() customer: Customer;
	idTypes: DisplayEnum[];

	constructor(
		private mandateFormService: MandateFormService
	) { }

	ngOnInit() {
		this.mandateFormService.getIdTypes().subscribe(idTypes => {
			this.idTypes = idTypes;

			if (this.customer.idType) {
				this.customer.idType = idTypes.filter(idType => idType.value === this.customer.idType.value)[0];
			}
		});
	}

}
