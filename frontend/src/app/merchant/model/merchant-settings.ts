import { Serializable } from '../../model/serializable';
import { DisplayEnum } from '../../model/displayEnum';

export class MerchantSettings implements Serializable<MerchantSettings> {

	public logoFileLocation: string;
	public selectedFrequencies: DisplayEnum[]
	public purposeOfPayments: string[];

	deserialize(input) {
		this.logoFileLocation = input.logoFileLocation;
		this.selectedFrequencies = input.selectedFrequencies.map(x => new DisplayEnum().deserialize(x));
		this.purposeOfPayments = input.purposeOfPayments;
		return this;
	}
}