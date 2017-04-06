import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthService } from './auth.service';
import { AuthGuard } from './auth-guard.service';
import { UserResolverService } from './user-resolver.service';

@NgModule({
  imports: [
    CommonModule
  ],
   providers: [
    AuthGuard,
    AuthService,
    UserResolverService
  ],
  declarations: []
})
export class AuthModule { }
