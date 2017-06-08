import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MerchantSettingsComponent } from './merchant-settings/merchant-settings.component';
import { MerchantSettingsService } from './merchant-settings/merchant-settings.service';

import { FlexLayoutModule } from '@angular/flex-layout';
import { FormsModule } from '@angular/forms';
import { MaterialModule } from '@angular/material';
import { RouterModule } from '@angular/router';
import { MerchantService } from './merchant.service';

@NgModule({
	imports: [
		CommonModule, FormsModule, MaterialModule, RouterModule, FlexLayoutModule
	],
	declarations: [
		MerchantSettingsComponent
	],
	providers: [
		MerchantSettingsService,
		MerchantService
	]
})
export class MerchantModule { }
