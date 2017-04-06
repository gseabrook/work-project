export class TestHelpers {

	static inputValue(inputElement, value) {
		let el = inputElement.nativeElement;
		el.value = value;
		el.dispatchEvent(new Event('input'));
	}
}