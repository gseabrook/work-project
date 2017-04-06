import { Serializable } from './serializable';

export class User implements Serializable<User> {

	public id: string;
	public name: string;
	public type: string;

	deserialize(input) {
		this.id = input.id;
		this.name = input.name;
		this.type = input.type;
		return this;
	}
}