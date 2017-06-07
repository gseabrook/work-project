import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../auth/auth-guard.service';

import { HomeComponent } from './home.component';
import { MandateListComponent } from '../mandate/list/mandate-list.component';
import { MandateFormComponent } from '../mandate/form/mandate-form.component';
import { MandateStatusComponent } from '../mandate/status/mandate-status.component';
import { MandateFormResolver } from '../mandate/form/mandate-form-resolver.service';
import { UserResolver } from '../auth/user-resolver.service';
import { MandateURLResolver } from '../mandate/status/mandate-url-resolver.service';
import { MerchantSettingsComponent } from '../merchant/merchant-settings/merchant-settings.component';

const homeRoutes: Routes = [
	{
		path: 'home',
		component: HomeComponent,
		canActivate: [AuthGuard],
		resolve: {
			user: UserResolver
		},
		children: [
			{
				path: 'mandate-list',
				component: MandateListComponent,
				resolve: {
					user: UserResolver
				}
			}, {
				path: 'mandate-form',
				component: MandateFormComponent,
				resolve: {
					mandate: MandateFormResolver,
					user: UserResolver
				}
			}, {
				path: 'mandate-status/:id',
				component: MandateStatusComponent,
				resolve: {
					mandate: MandateURLResolver,
					user: UserResolver
				}
			}, {
				path: 'merchant-settings',
				component: MerchantSettingsComponent,
				resolve: {
					user: UserResolver
				}
			}, {
				path: '',
				redirectTo: 'mandate-list',
				pathMatch: 'full'
			}
		]
	}
];

@NgModule({
	imports: [
		RouterModule.forChild(homeRoutes)
	],
	exports: [
		RouterModule
	],
	providers: [
		MandateFormResolver
	]
})
export class HomeRoutingModule { }
