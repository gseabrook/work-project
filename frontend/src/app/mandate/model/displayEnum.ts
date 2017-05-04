import { Serializable } from '../../model/serializable';

export class DisplayEnum implements Serializable<DisplayEnum> {

	public value: string;
	public displayValue: string;

	deserialize(input) {
		this.value = input.value;
		this.displayValue = input.displayValue;
		return this;
	}
}