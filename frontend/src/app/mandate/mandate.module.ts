import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FlexLayoutModule } from '@angular/flex-layout';
import { FormsModule } from '@angular/forms';
import { MaterialModule } from '@angular/material';
import { RouterModule } from '@angular/router';
import { Md2Module } from 'md2';
import { DialogModule } from '../dialog/dialog.module';

import { MandateFormComponent } from './form/mandate-form.component';
import { MandateListComponent } from './list/mandate-list.component';
import { MandateService } from './mandate.service';
import { FpxService } from './fpx.service';
import { MandateFormService } from './form/mandate-form.service';
import { MandateFormResolver } from './form/mandate-form-resolver.service';
import { MandateURLResolver } from './status/mandate-url-resolver.service'; 
import { CompleteComponent } from './complete/complete.component';
import { CustomerInformationComponent } from './form/customer-information/customer-information.component';
import { MerchantInformationComponent } from './form/merchant-information/merchant-information.component';
import { MandateStatusComponent } from './status/mandate-status.component';

@NgModule({
	imports: [
		CommonModule, FormsModule, MaterialModule, RouterModule, Md2Module.forRoot(), FlexLayoutModule, DialogModule
	],
	declarations: [
		MandateFormComponent, MandateListComponent, CompleteComponent, CustomerInformationComponent, MerchantInformationComponent, MandateStatusComponent
	],
	exports: [
		MandateFormComponent, MandateListComponent, CompleteComponent
	],
	providers: [
		MandateService, MandateFormService, MandateFormResolver, MandateURLResolver, FpxService
	]
})
export class MandateModule { }
