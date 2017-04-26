import { BankAccount } from './bankAccount';
import { Serializable } from '../../model/serializable';

export class Customer implements Serializable<Customer> {
	public name: string;
	public phoneNumber: string;
	public idType: string;
	public idValue: string;
	public bankAccounts: BankAccount[];

	public emailAddress?: string;

	constructor() {
		this.bankAccounts = [new BankAccount()];
	}

	toJSON(): CustomerJSON {
		return Object.assign({}, this, {
			bankAccounts: null,
			bankAccount: this.bankAccounts.length > 0 ? this.bankAccounts[0].toJSON() : undefined
		});
	}

	deserialize(input) {
		this.name = input.name;
		this.phoneNumber = input.phoneNumber;
		this.idType = input.idType ? input.idType.displayValue : undefined;
		this.idValue = input.idValue;
		this.bankAccounts = input.bankAccounts.map(x => new BankAccount().deserialize(x));
		this.emailAddress = input.emailAddress;
		return this;
	}

}

interface CustomerJSON {
	name: string;
	phoneNumber: string;
	idType: string;
	idValue: string;
	bankAccount: Object;
}