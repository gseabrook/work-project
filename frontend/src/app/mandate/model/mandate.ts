import { Customer } from './customer';
import { BankAccount } from './bankAccount';
import { Merchant } from './merchant';
import { Serializable } from '../../model/serializable';

export class Mandate implements Serializable<Mandate> {

	public referenceNumber: string;
	public registrationDate: Date;
	public amount: string;
	public frequency: string;
	public customer: Customer;
	public merchant: Merchant;

	constructor() {
		this.customer = new Customer();
	}

    deserialize(input){
    	this.referenceNumber = input.referenceNumber;
    	this.registrationDate = new Date(input.registrationDate);
    	this.amount = input.amount;
    	this.frequency = input.frequency.displayValue;
    	this.customer = new Customer().deserialize(input.customer);
    	this.merchant = new Merchant().deserialize(input.merchant);
    	return this;
	}
}