import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './auth-guard.service';

import { RegistrationFormComponent } from './registration/form/registration-form.component';
import { RegistrationListComponent } from './registration/list/registration-list.component';
import { CompleteComponent } from './registration/complete/complete.component';
import { LoginComponent } from './login/login.component';

const routes: Routes = [
  {
    path: 'registrations',
    component: RegistrationListComponent
    // canActivate: [AuthGuard]  Uncomment to enable login security
  },
  {
    path: 'registration-form',
    component: RegistrationFormComponent
  },
  {
    path: 'registration-complete',
    component: CompleteComponent
  },
  { path: 'login', component: LoginComponent },
  {
    path: '',
    redirectTo: '/login',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}