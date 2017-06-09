import { DebugElement } from '@angular/core';
import { ComponentFixture } from '@angular/core/testing';
import { By } from '@angular/platform-browser';

export class TestHelpers {

	static inputValue(cssSelector: string, value: string, fixture: ComponentFixture<any>) {
		let el = fixture.debugElement.query(By.css(cssSelector)).nativeElement;
		el.value = value;
		el.dispatchEvent(new Event('input'));
	}

	static pickFromMdSelect(cssSelector: string, itemIdx: string, fixture: ComponentFixture<any>, selectIdx?: string) {
		let el = fixture.debugElement.query(By.css(cssSelector + ' .mat-select-trigger'));
		if (el == null) {
			console.log("MdSelect Element does not exist - " + cssSelector + ' .mat-select-trigger');
			console.log(fixture.debugElement.queryAll(By.css('md-select')));
		}
		el.nativeElement.click();

	  	fixture.detectChanges();

	  	let selector = 'md-option:nth-child(' + itemIdx + ')';
	  	if (selectIdx) {
	  		selector = 'div.cdk-overlay-pane:nth-child(' + selectIdx + ') ' + selector;
	  	}

	    el = fixture.debugElement.query(By.css(selector));
		if (el == null) {
			console.log("MdOption element does not exist - " + selector + ' .mat-select-trigger');
		}
		el.nativeElement.click();
	  	fixture.detectChanges();
	}

	static pickFromMdSelectByValue(cssSelector: string, value: string, fixture: ComponentFixture<any>) {
		fixture.debugElement.query(By.css(cssSelector + ' .mat-select-trigger')).nativeElement.click();
	  	fixture.detectChanges();

	    fixture.debugElement.query(By.css('md-option[ng-reflect-value="' + value + '"]')).nativeElement.click();
	  	fixture.detectChanges();
	}

	static clickMdCheckbox(cssSelector: string, fixture: ComponentFixture<any>) {
		fixture.debugElement.query(By.css(cssSelector + ' div.mat-checkbox-inner-container')).nativeElement.click();
		fixture.detectChanges();
	}
}