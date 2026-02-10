import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IonicModule } from '@ionic/angular';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../../services/api';

@Component({
  standalone: true,
  selector: 'app-ordem-detalhe',
  templateUrl: './ordem-detalhe.page.html',
  imports: [IonicModule, CommonModule, FormsModule],
})
export class OrdemDetalhePage {
  id = 0;
  ordem: any = null;

  defeito = '';
  solucao = '';

  loading = true;
  saving = false;
  error: string | null = null;

  constructor(
    private route: ActivatedRoute,
    private api: ApiService,
    private router: Router
  ) {}

  ionViewWillEnter() {
    if (!this.api.token) {
      this.router.navigateByUrl('/login');
      return;
    }

    this.id = Number(this.route.snapshot.paramMap.get('id'));
    this.loading = true;
    this.error = null;

    this.api.detalheOrdem(this.id).subscribe({
      next: (o: any) => {
        this.ordem = o;
        this.defeito = o.defeito ?? '';
        this.solucao = o.solucao ?? '';
        this.loading = false;
      },
      error: (e: any) => {
        this.loading = false;

        if (e?.status === 401) {
          this.api.token = null;
          this.router.navigateByUrl('/login');
          return;
        }

        this.error = 'Falha ao carregar a ordem.';
      }
    });
  }

  salvar() {
    (document.activeElement as HTMLElement | null)?.blur();
    
    if (!this.ordem) return;

    this.saving = true;
    this.error = null;

    this.api.atualizarOrdem(this.id, this.defeito, this.solucao).subscribe({
      next: (o: any) => {
        this.ordem = o;
        this.saving = false;
      },
      error: (e: any) => {
        this.saving = false;

        if (e?.status === 401) {
          this.api.token = null;
          this.router.navigateByUrl('/login');
          return;
        }

        this.error = 'Falha ao salvar.';
      }
    });
  }
}