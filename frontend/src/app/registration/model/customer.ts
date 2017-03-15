import { BankAccount } from './bankAccount';

export class Customer {
	constructor(
		public name: string,
		public phoneNumber: string,
		public idType: string,
		public idValue: string,
		public bankAccounts: BankAccount[],

		public emailAddress?: string
	) { }

	static newCustomer() {
		return new Customer('', '', '', '', [<BankAccount>{}], '');
	}
}