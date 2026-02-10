import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { IonicModule } from '@ionic/angular';
import { ApiService } from '../../services/api';
import { CommonModule } from '@angular/common';

@Component({
  standalone: true,
  selector: 'app-login',
  templateUrl: './login.page.html',
  imports: [IonicModule, FormsModule, CommonModule],
})
export class LoginPage {
  email = 'teste@teste.com';
  password = '123456';
  loading = false;
  error: string | null = null;

  constructor(
    private api: ApiService,
    private router: Router
  ) {}

  entrar() {
  console.log('clicou em entrar', this.email);

  this.loading = true;
  this.error = null;

  this.api.login(this.email, this.password).subscribe({
    next: (res: { token: string }) => {
      console.log('login OK', res);
      this.api.token = res.token;
      this.loading = false;
      this.router.navigateByUrl('/ordens');
    },
    error: (e: any) => {
      console.log('login ERRO', e);
      this.loading = false;
      this.error = 'Falha no login (veja o console)';
    }
  });
}
}