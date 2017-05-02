import { Serializable } from '../../model/serializable';

export class Bank implements Serializable<Bank> {
	public id: string;
	public code: string;
	public name: string;

	deserialize(input) {
		this.id = input.id;
		this.code = input.code;
		this.name = input.name;
		return this;
	}
}