import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { IonicModule } from '@ionic/angular';
import { CommonModule } from '@angular/common';
import { ApiService } from '../../services/api';

@Component({
  standalone: true,
  selector: 'app-ordens',
  templateUrl: './ordens.page.html',
  imports: [IonicModule, CommonModule],
})
export class OrdensPage {
  ordens: any[] = [];
  loading = true;
  error: string | null = null;

  constructor(private api: ApiService, private router: Router) {}

  ionViewWillEnter() {
    if (!this.api.token) {
      this.router.navigateByUrl('/login');
      return;
    }

    this.loading = true;
    this.error = null;

    this.api.ordensAbertas().subscribe({
      next: (res: any[]) => {
        this.ordens = res;
        this.loading = false;
      },
      error: (e: any) => {
        this.loading = false;

        if (e?.status === 401) {
          this.api.token = null;
          this.router.navigateByUrl('/login');
          return;
        }

        this.error = 'Falha ao carregar ordens abertas.';
      },
    });
  }

  abrir(o: any) {
    this.router.navigate(['/ordem', o.id]);
  }

  sair() {
    this.api.token = null;
    this.router.navigateByUrl('/login');
  }
}