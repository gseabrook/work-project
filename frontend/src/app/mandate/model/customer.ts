import { BankAccount } from './bankAccount';
import { Serializable } from '../../model/serializable';
import { DisplayEnum } from './displayEnum';

export class Customer implements Serializable<Customer> {
	public name: string;
	public phoneNumber: string;
	public idType: DisplayEnum;
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
		this.idType = new DisplayEnum().deserialize(input.idType);
		this.idValue = input.idValue;
		if (input.bankAccounts) {
			this.bankAccounts = input.bankAccounts.map(x => new BankAccount().deserialize(x));
		}
		this.emailAddress = input.emailAddress;
		return this;
	}

}

interface CustomerJSON {
	name: string;
	phoneNumber: string;
	idType: Object;
	idValue: string;
	bankAccount: Object;
}