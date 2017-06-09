import { Serializable } from '../../model/serializable';
import { MerchantSettings } from '../../merchant/model/merchant-settings';

export class Merchant implements Serializable<Merchant> {

	public id: string;
	public companyName: string;
	public companyRegistrationNumber: string;
	public merchantSettings: MerchantSettings;

	deserialize(input) {
		this.id = input.id;
		this.companyName = input.companyName;
		this.companyRegistrationNumber = input.companyRegistrationNumber;
		if (input.merchantSettings) {
			this.merchantSettings = new MerchantSettings().deserialize(input.merchantSettings);
		}
		return this;
	}
}