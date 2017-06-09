import { fakeAsync, async, ComponentFixture, TestBed, inject, tick } from '@angular/core/testing';
import { MockBackend, MockConnection } from '@angular/http/testing';
import { Response, ResponseOptions, RequestMethod } from '@angular/http';
import { RouterTestingModule } from '@angular/router/testing';
import { MerchantSettingsComponent } from './merchant-settings.component';
import { MerchantModule } from '../merchant.module';
import { TestModule } from '../../../test/test.module';
import { TestHelpers } from '../../../test/test-helpers';
import { By } from '@angular/platform-browser';
import { ActivatedRoute } from '@angular/router';
import * as frequencies from '../../../../fixtures/frequencies.json';
import * as merchant from '../../../../fixtures/merchant.json';
import * as merchantSettingsInvalidResponse from '../../../../fixtures/merchantSettingsInvalidResponse.json';

describe('MerchantSettingsComponent', () => {
	let component: MerchantSettingsComponent;
	let fixture: ComponentFixture<MerchantSettingsComponent>;

	beforeEach(async(() => {
		TestBed.configureTestingModule({
			imports: [MerchantModule, TestModule],
			providers: [{
				provide: ActivatedRoute,
				useValue: {
					data: {},
					snapshot: {
						data: {
							user: {
								id: '1'
							}
						}
					}
				}
			}]
		})
			.compileComponents();
	}));

	function createComponent() {
		fixture = TestBed.createComponent(MerchantSettingsComponent);
		component = fixture.componentInstance;
		fixture.detectChanges();
	};

	let connections: MockConnection[] = [];
	let connection: MockConnection;

	it('should check the selected frequencies', fakeAsync(inject([MockBackend], (mockBackend) => {
		mockBackend.connections.subscribe((c: MockConnection) => connections.push(c));
		createComponent();
		
		connections.pop().mockRespond(new Response(new ResponseOptions({ body: frequencies, status: 200 })));
		connections.pop().mockRespond(new Response(new ResponseOptions({ body: merchant, status: 200})));
		fixture.detectChanges();

		expect(component.selectedFrequencies).toContain("WEEKLY");
		expect(fixture.debugElement.query(By.css("md-checkbox[ng-reflect-value='WEEKLY'] input")).nativeElement.checked).toBeTruthy();

		expect(component.selectedFrequencies).toContain("YEARLY");
		expect(fixture.debugElement.query(By.css("md-checkbox[ng-reflect-value='YEARLY'] input")).nativeElement.checked).toBeTruthy();
	})));

	it('should save the selected frequencies', fakeAsync(inject([MockBackend], (mockBackend) => {
		mockBackend.connections.subscribe((c: MockConnection) => connections.push(c));
		createComponent();

		connection = connections.pop();
		connection.mockRespond(new Response(new ResponseOptions({ body: frequencies, status: 200 })));
		fixture.detectChanges();
		tick();

		expect(fixture.debugElement.queryAll(By.css("md-checkbox")).length).toEqual(5);
		TestHelpers.clickMdCheckbox("md-checkbox:nth-child(3)", fixture);
		fixture.detectChanges();

		fixture.debugElement.query(By.css("button")).triggerEventHandler('click', {});
		fixture.detectChanges();

		connection = connections.pop();
		
		let formData: FormData = connection.request.getBody();
		expect(formData.getAll("frequency")).toEqual(["WEEKLY"]);

		tick(1000);
	})));

	it('should display an error message when error returned', fakeAsync(inject([MockBackend], (mockBackend) => {
		mockBackend.connections.subscribe((c: MockConnection) => connections.push(c));
		createComponent();

		fixture.debugElement.query(By.css("button")).triggerEventHandler('click', {});

		let response: Response = new Response(new ResponseOptions({body: merchantSettingsInvalidResponse, status: 422}));
		connections.pop().mockError(response as any as Error);
		fixture.detectChanges();

		expect(component.errors.length).toEqual(1);
		expect(fixture.debugElement.query(By.css("div.alert-danger")).nativeElement.textContent).toContain("Logo must be smaller than 320px x 320px");
	})));
});
