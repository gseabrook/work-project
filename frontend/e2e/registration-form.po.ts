import { browser, element, by } from 'protractor';

export class RegistrationFormPage {
	navigateTo() {
		return browser.get('/registration-form');
	}

	getHeaderText() {
		return element(by.css('registration-form md-toolbar')).getText();
	}

	setValue(inputName, value) {
		element(by.css('input[name=' + inputName + ']')).sendKeys(value);
	}

	selectIdType(idx) {
		element(by.css('md-select[name=idType]')).click();
		element(by.css('.mat-select-panel md-option:nth-child(' + idx + ')')).click();
	}

	selectBank(idx) {
		element(by.css('md-select[name=bank]')).click();
		element(by.css('.mat-select-panel md-option:nth-child(' + idx + ')')).click();
	}

	selectRegistrationDate() {
		element(by.css('md2-datepicker[name=registrationDate]')).click();
		element(by.css('div.today')).click();
	}

	selectFrequency(idx) {
		element(by.css('md-select[name=frequency]')).click();
		element(by.css('.mat-select-panel md-option:nth-child(' + idx + ')')).click();
	}
}
