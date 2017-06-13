import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ConfirmationDialogComponent } from './confirmation/confirmation-dialog.component';
import { InputDialogComponent } from './input/input-dialog.component';
import { DialogService } from './dialog.service';
import { FlexLayoutModule } from '@angular/flex-layout';
import { MaterialModule } from '@angular/material';

@NgModule({
	imports: [
		CommonModule, FlexLayoutModule, MaterialModule, FormsModule
	],
	declarations: [
		ConfirmationDialogComponent,
		InputDialogComponent
	],
	entryComponents: [
		ConfirmationDialogComponent,
		InputDialogComponent
	],
	providers: [
		DialogService
	]
})
export class DialogModule { }
