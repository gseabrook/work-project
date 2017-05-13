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
	public frequency: DisplayEnum;
	public customer: Customer;
	public merchant: Merchant;
	public customerBankAccount: BankAccount;
	public status: DisplayEnum;

	constructor() {
		this.customer = new Customer();
		this.customerBankAccount = new BankAccount();
		this.status = DisplayEnum.of("PENDING_AUTHORISATION", "Pending Authorisation");
	}

	authorise() {
		this.status = DisplayEnum.of('AUTHORISED', 'Authorised');
	}

	clone(): Mandate {
		let clone = Object.assign(new Mandate(), this);
		clone.customer = Object.assign(new Customer(), this.customer);

		return clone;
	}

    deserialize(input){
    	this.id = input.id;
    	this.referenceNumber = input.referenceNumber;
    	this.registrationDate = new Date(input.registrationDate);
    	this.amount = input.amount;
    	this.frequency = new DisplayEnum().deserialize(input.frequency);
    	this.customer = new Customer().deserialize(input.customer);
    	this.merchant = new Merchant().deserialize(input.merchant);
    	this.status = new DisplayEnum().deserialize(input.status);
    	if (input.customerBankAccount) {
    		this.customerBankAccount = new BankAccount().deserialize(input.customerBankAccount);
    	}
    	return this;
	}

	hasBankInformation() {
		return this.customerBankAccount && 
			this.customerBankAccount.accountNumber &&
			this.customerBankAccount.accountNumber.length > 0 &&
			this.customerBankAccount.bank &&
			this.customerBankAccount.bank.id &&
			this.customerBankAccount.bank.id.toString().length > 0;
	}

	isTerminated() {
		return this.status.value === "TERMINATED";
	}

	terminate() {
		this.status = DisplayEnum.of("TERMINATED", "Terminated");
	}
}