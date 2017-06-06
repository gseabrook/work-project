import { Customer } from './customer';
import { BankAccount } from './bankAccount';
import { Merchant } from './merchant';
import { Serializable } from '../../model/serializable';
import { DisplayEnum } from './displayEnum';

export class Mandate implements Serializable<Mandate> {

	public id: number;
	public nodeId: string;
	public fpxTransactionId: string;
	public referenceNumber: string;
	public registrationDate: Date;
	public dateCreated: Date;
	public amount: string;
	public frequency: DisplayEnum;
	public maximumFrequency: number;
	public customer: Customer;
	public merchant: Merchant;
	public customerBankAccount: BankAccount;
	public status: DisplayEnum;
	public purposeOfPayment: string;

	constructor() {
		this.customer = new Customer();
		this.customerBankAccount = new BankAccount();
		this.status = DisplayEnum.of("NEW", "New");
	}

	clone(): Mandate {
		let clone = Object.assign(new Mandate(), this);
		clone.customer = Object.assign(new Customer(), this.customer);

		return clone;
	}

    deserialize(input){
    	this.id = input.id;
    	this.nodeId = input.nodeId;
    	this.fpxTransactionId = input.fpxTransactionId;
    	this.referenceNumber = input.referenceNumber;
    	if (input.registrationDate) {
    		this.registrationDate = new Date(input.registrationDate);
    	}
    	this.amount = input.amount;
    	this.frequency = new DisplayEnum().deserialize(input.frequency);
    	this.maximumFrequency = input.maximumFrequency;
    	this.customer = new Customer().deserialize(input.customer);
    	this.merchant = new Merchant().deserialize(input.merchant);
    	this.status = new DisplayEnum().deserialize(input.status);
    	if (input.customerBankAccount) {
    		this.customerBankAccount = new BankAccount().deserialize(input.customerBankAccount);
    	}
    	this.purposeOfPayment = input.purposeOfPayment;
    	this.dateCreated = new Date(input.dateCreated);
    	return this;
	}

	hasBankInformation() {
		return this.customerBankAccount && 
			this.customerBankAccount.bank &&
			this.customerBankAccount.bank.id &&
			this.customerBankAccount.bank.id.toString().length > 0;
	}

	isTerminated() {
		return this.status.value === "TRANSACTION_CANCELLED_BY_CUSTOMER";
	}

	requestAuthorisation() {
		this.status = DisplayEnum.of("AWAITING_FPX_AUTHORISATION", "Awaiting FPX authorisation");
	}

}