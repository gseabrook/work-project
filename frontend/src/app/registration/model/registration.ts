import { Customer } from './customer';
import { BankAccount } from './bankAccount';

export class Registration {
	constructor(
		public referenceNumber: string,
		public registrationDate: Date,
		public amount: string,
		public frequency: string,
		public customer: Customer,
		public customerBankAccount: BankAccount
	) { }

	static newRegistration() {
		return new Registration(null, null, null, null, Customer.newCustomer(), <BankAccount>{});
	}
}