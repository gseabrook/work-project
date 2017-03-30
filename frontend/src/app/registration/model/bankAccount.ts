import { Bank } from './bank'
import { Serializable } from '../../model/serializable';

export class BankAccount implements Serializable<BankAccount> {
	public bank: Bank;
	public accountNumber: string;

	constructor() {}

	deserialize(input) {
		this.bank = new Bank().deserialize(input.bank);
		this.accountNumber = input.accountNumber;
		return this;
	}

	toJSON(): BankAccountJSON {
		return {
			bankId: this.bank.id,
			accountNumber: this.accountNumber
		};
	}
}

interface BankAccountJSON {
	bankId: string,
	accountNumber: string
}