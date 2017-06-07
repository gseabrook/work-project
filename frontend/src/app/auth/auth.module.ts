import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthService } from './auth.service';
import { AuthGuard } from './auth-guard.service';
import { UserResolver } from './user-resolver.service';

@NgModule({
  imports: [
    CommonModule
  ],
   providers: [
    AuthGuard,
    AuthService,
    UserResolver
  ],
  declarations: []
})
export class AuthModule { }
