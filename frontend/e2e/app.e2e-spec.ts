import { browser, element, by } from 'protractor';
import { RegistrationFormPage } from './registration-form.po';

describe('registration form', function() {
	let page: RegistrationFormPage;

	beforeEach(() => {
		page = new RegistrationFormPage();
	});

	it('should save form', () => {
		page.navigateTo();
		expect(page.getHeaderText()).toEqual('Registration Form');

		page.setValue('referenceNumber', 'ABC 123');
		page.setValue('accountHolderName', 'Joe');
		page.setValue('email', 'joe@bloggs.com');
		page.setValue('phoneNumber', '123456');

		page.selectIdType(3);
		browser.sleep(300);
		page.setValue('idValue', '456');

		page.selectBank(1);
		browser.sleep(300);
		page.setValue('accountNumber', '3333');

		page.selectRegistrationDate();
		page.setValue('amount', '100');
		page.selectFrequency(2);

		element(by.css('button[color=primary]')).click();
	});
});
