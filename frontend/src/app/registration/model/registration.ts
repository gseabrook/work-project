import { Customer } from './customer';

export class Registration {
	constructor(
		public referenceNumber: string,
		public registrationDate: Date,
		public amount: string,
		public frequency: string,

		public customer: Customer	
	) { }

	static newRegistration() {
		return new Registration(null, null, null, null, Customer.newCustomer());
	}
}