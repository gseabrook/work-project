import { Customer } from './customer';
import { BankAccount } from './bankAccount';
import { Serializable } from '../../model/serializable';

export class Mandate implements Serializable<Mandate> {
	
	public referenceNumber: string;
	public registrationDate: Date;
	public amount: string;
	public frequency: string;
	public customer: Customer;

	constructor() {
		this.customer = new Customer();
	}

    deserialize(input){
    	this.referenceNumber = input.referenceNumber;
    	this.registrationDate = input.registrationDate;
    	this.amount = input.amount;
    	this.frequency = input.frequency;
    	this.customer = new Customer().deserialize(input.customer);
    	return this;
	}
}