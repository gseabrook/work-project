import { Serializable } from '../../model/serializable';

export class Merchant implements Serializable<Merchant> {

	public id: string;
	public companyName: string;
	public companyRegistrationNumber: string;

	deserialize(input) {
		this.id = input.id;
		this.companyName = input.companyName;
		this.companyRegistrationNumber = input.companyRegistrationNumber;
		return this;
	}
}