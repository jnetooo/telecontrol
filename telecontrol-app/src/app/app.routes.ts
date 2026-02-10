import { Routes } from '@angular/router';

export const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },

  {
    path: 'login',
    loadComponent: () =>
      import('./pages/login/login.page').then(m => m.LoginPage)
  },
  {
    path: 'ordens',
    loadComponent: () =>
      import('./pages/ordens/ordens.page').then(m => m.OrdensPage)
  },
  {
    path: 'ordem/:id',
    loadComponent: () =>
      import('./pages/ordem-detalhe/ordem-detalhe.page').then(m => m.OrdemDetalhePage)
  },
];