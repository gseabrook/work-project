import { ValidationError } from './validationError';
import { Serializable } from './serializable';

export class ErrorResponse implements Serializable<ErrorResponse> {
	fieldErrors: ValidationError[];

	deserialize(input) {
		this.fieldErrors = input.errors.map(i => {
			return new ValidationError().deserialize(i);
		});
		return this;
	}
}