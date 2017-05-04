import { Customer } from './customer';
import { BankAccount } from './bankAccount';
import { Merchant } from './merchant';
import { Serializable } from '../../model/serializable';
import { DisplayEnum } from './displayEnum';

export class Mandate implements Serializable<Mandate> {

	public id: number;
	public referenceNumber: string;
	public registrationDate: Date;
	public amount: string;
	public frequency: string;
	public customer: Customer;
	public merchant: Merchant;
	public customerBankAccount: BankAccount;
	public status: DisplayEnum;

	constructor() {
		this.customer = new Customer();
		this.customerBankAccount = new BankAccount();
	}

    deserialize(input){
    	this.id = input.id;
    	this.referenceNumber = input.referenceNumber;
    	this.registrationDate = new Date(input.registrationDate);
    	this.amount = input.amount;
    	this.frequency = input.frequency.value;
    	this.customer = new Customer().deserialize(input.customer);
    	this.merchant = new Merchant().deserialize(input.merchant);
    	this.status = new DisplayEnum().deserialize(input.status);
    	if (input.customerBankAccount) {
    		this.customerBankAccount = new BankAccount().deserialize(input.customerBankAccount);
    	}
    	return this;
	}
}