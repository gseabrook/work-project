import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../auth/auth-guard.service';

import { HomeComponent } from './home.component';
import { MandateListComponent } from '../registration/list/mandate-list.component';
import { MandateFormComponent } from '../registration/form/mandate-form.component';
import { MandateFormResolver } from '../registration/form/mandate-form-resolver.service';
import { UserResolverService } from '../auth/user-resolver.service';

const homeRoutes: Routes = [
  {
    path: 'home',
    component: HomeComponent,
    canActivate: [AuthGuard],
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
          mandate: MandateFormResolver
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
