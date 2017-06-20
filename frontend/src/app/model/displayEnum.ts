import { Serializable } from './serializable';
import { Response } from '@angular/http';

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

	static extract(res: Response) {
		const body = res.json();
		return body.map(displayEnum => new DisplayEnum().deserialize(displayEnum));		
	}

	static matchByValue(target: DisplayEnum) {
		return function(element: DisplayEnum) {
			return element.value === target.value;
		};
	}

	static of(value: string, displayValue: string): DisplayEnum {
		let displayEnum = new DisplayEnum();
		displayEnum.value = value;
		displayEnum.displayValue = displayValue;
		return displayEnum;
	}
}