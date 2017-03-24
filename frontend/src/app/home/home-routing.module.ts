import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../auth-guard.service';

import { HomeComponent } from './home.component';
import { RegistrationListComponent } from '../registration/list/registration-list.component';
import { MandateFormComponent } from '../registration/form/mandate-form.component';

const homeRoutes: Routes = [
  {
    path: 'home',
    component: HomeComponent,
    canActivate: [AuthGuard],
    children: [
      {
        path: 'registration-list',
        component: RegistrationListComponent
      },
      {
        path: 'mandate-form',
        component: MandateFormComponent
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
  ]
})
export class HomeRoutingModule { }
