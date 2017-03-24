import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../auth-guard.service';

import { HomeComponent } from './home.component';
import { RegistrationListComponent } from '../registration/list/registration-list.component';
import { RegistrationFormComponent } from '../registration/form/registration-form.component';

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
        path: 'registration-form',
        component: RegistrationFormComponent
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
