import { DebugElement } from '@angular/core';
import { ComponentFixture } from '@angular/core/testing';
import { By } from '@angular/platform-browser';

export class TestHelpers {

	static inputValue(cssSelector: string, value: string, fixture: ComponentFixture<any>) {
		let el = fixture.debugElement.query(By.css(cssSelector)).nativeElement;
		el.value = value;
		el.dispatchEvent(new Event('input'));
	}

	static pickFromMdSelect(cssSelector: string, itemIdx: string, fixture: ComponentFixture<any>) {
		fixture.debugElement.query(By.css(cssSelector + ' .mat-select-trigger')).nativeElement.click();
	  	fixture.detectChanges();

	    fixture.debugElement.query(By.css('md-option:nth-child(' + itemIdx + ')')).nativeElement.click();
	  	fixture.detectChanges();
	}

	static pickFromMdSelectByValue(cssSelector: string, value: string, fixture: ComponentFixture<any>) {
		fixture.debugElement.query(By.css(cssSelector + ' .mat-select-trigger')).nativeElement.click();
	  	fixture.detectChanges();

	    fixture.debugElement.query(By.css('md-option[ng-reflect-value="' + value + '"]')).nativeElement.click();
	  	fixture.detectChanges();
	}

}