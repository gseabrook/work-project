import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { MandateFormComponent } from './registration/form/mandate-form.component';
import { MandateFormResolver } from './registration/form/mandate-form-resolver.service';
import { CompleteComponent } from './registration/complete/complete.component';
import { LoginComponent } from './login/login.component';
import { SignUpComponent } from './signup/signup.component';

const routes: Routes = [{
  path: 'mandate-form',
  component: MandateFormComponent,
  resolve: {
    mandate: MandateFormResolver
  }
},
{
  path: 'registration-complete',
  component: CompleteComponent
},
{
  path: 'home',
  loadChildren: 'app/home/home.module#HomeModule'
},
{ path: 'login', component: LoginComponent },
{ path: 'signup', component: SignUpComponent },
{
  path: '',
  redirectTo: '/login',
  pathMatch: 'full'
}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  providers: [MandateFormResolver]
})
export class AppRoutingModule { }