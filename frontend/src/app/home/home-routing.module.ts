import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../auth/auth-guard.service';

import { HomeComponent } from './home.component';
import { MandateListComponent } from '../mandate/list/mandate-list.component';
import { MandateFormComponent } from '../mandate/form/mandate-form.component';
import { MandateStatusComponent } from '../mandate/status/mandate-status.component';
import { MandateFormResolver } from '../mandate/form/mandate-form-resolver.service';
import { UserResolverService } from '../auth/user-resolver.service';
import { MandateURLResolver } from '../mandate/status/mandate-url-resolver.service';

const homeRoutes: Routes = [
	{
		path: 'home',
		component: HomeComponent,
		canActivate: [AuthGuard],
		resolve: {
			user: UserResolverService
		},
		children: [
			{
				path: 'mandate-list',
				component: MandateListComponent,
				resolve: {
					user: UserResolverService
				}
			}, {
				path: 'mandate-form',
				component: MandateFormComponent,
				resolve: {
					mandate: MandateFormResolver,
					user: UserResolverService
				}
			}, {
				path: 'mandate-status/:id',
				component: MandateStatusComponent,
				resolve: {
					mandate: MandateURLResolver,
					user: UserResolverService
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
