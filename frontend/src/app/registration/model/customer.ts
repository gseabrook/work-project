import { BankAccount } from './bankAccount';
import { Serializable } from '../../model/serializable';

export class Customer implements Serializable<Customer> {
	public name: string;
	public phoneNumber: string;
	public idType: string;
	public idValue: string;
	public bankAccounts: BankAccount[];

	public emailAddress?: string

	constructor() {
		this.bankAccounts = [new BankAccount()];
	}

	toJSON(): CustomerJSON {
		return Object.assign({}, this, {
			bankAccounts: null,
			bankAccount: this.bankAccounts[0].toJSON()
		});
	}

	deserialize(input) {
		this.name = input.name;
		this.phoneNumber = input.phoneNumber;
		this.idType = input.idType;
		this.idValue = input.idValue;
		this.bankAccounts = input.bankAccounts.map(x => new BankAccount().deserialize(x));
		this.emailAddress = input.emailAddress;
		return this;
	}

}

interface CustomerJSON {
	name: string,
	phoneNumber: string,
	idType: string,
	idValue: string,
	bankAccount: Object
}