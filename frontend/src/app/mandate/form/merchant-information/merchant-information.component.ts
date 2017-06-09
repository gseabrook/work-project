import { Component, OnInit, Input } from '@angular/core';
import { Merchant } from '../../../merchant/model/merchant';
import { MandateFormService } from '../mandate-form.service';

@Component({
  selector: 'merchant-information',
  templateUrl: './merchant-information.component.html',
  styleUrls: ['./merchant-information.component.css']
})
export class MerchantInformationComponent implements OnInit {

  @Input() merchant: Merchant;

	constructor(
		private mandateFormService: MandateFormService
	) { }

  ngOnInit() {}

}
