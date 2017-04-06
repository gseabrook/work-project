export class TestHelpers {

	static inputValue(inputElement, value) {
		const el = inputElement.nativeElement;
		el.value = value;
		el.dispatchEvent(new Event('input'));
	}
}