import { Serializable } from './serializable';

export class ValidationError implements Serializable<ValidationError> {
	public field: string;
	public value: string;
	public message: string;

	deserialize(input) {
		this.field = input.field;
		this.value = input.value;
		this.message = input.message;
		return this;
	}
}