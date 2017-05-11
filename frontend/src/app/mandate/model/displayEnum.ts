import { Serializable } from '../../model/serializable';

export class DisplayEnum implements Serializable<DisplayEnum> {

	public value: string;
	public displayValue: string;

	deserialize(input) {
		this.value = input.value;
		this.displayValue = input.displayValue;
		return this;
	}

	toJSON(): string {
		return this.value;
	}

	static of(value: string, displayValue: string): DisplayEnum {
		let displayEnum = new DisplayEnum();
		displayEnum.value = value;
		displayEnum.displayValue = displayValue;
		return displayEnum;
	}
}