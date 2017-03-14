import { CustomerID } from './customerId';
import { BankAccount } from './bankAccount';

export class Customer {
	constructor(
		public name: string,
		public phoneNumber: string,
		public id: CustomerID,
		public bankAccount: BankAccount,

		public emailAddress?: string
	) { }

	static newCustomer() {
		return new Customer('', '', <CustomerID>{}, <BankAccount>{}, '');
	}
}