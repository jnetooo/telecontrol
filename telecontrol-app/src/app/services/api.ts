import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({ providedIn: 'root' })
export class ApiService {
  baseUrl = 'http://127.0.0.1:8000/api';
  tokenKey = 'telecontrol_token';

  constructor(private http: HttpClient) {}

  get token(): string | null {
    return localStorage.getItem(this.tokenKey);
  }

  set token(value: string | null) {
    if (value) localStorage.setItem(this.tokenKey, value);
    else localStorage.removeItem(this.tokenKey);
  }

  headers() {
    return new HttpHeaders({
      'Content-Type': 'application/json',
      ...(this.token ? { Authorization: `Bearer ${this.token}` } : {})
    });
  }

  login(email: string, password: string) {
    return this.http.post<{ token: string }>(`${this.baseUrl}/login`, { email, password });
  }

  ordensAbertas() {
    return this.http.get<any[]>(
      `${this.baseUrl}/ordens-servico?status=ABERTA`,
      { headers: this.headers() }
    );
  }

  detalheOrdem(id: number) {
    return this.http.get<any>(
      `${this.baseUrl}/ordens-servico/${id}`,
      { headers: this.headers() }
    );
  }

  atualizarOrdem(id: number, defeito: string, solucao: string) {
    return this.http.put<any>(
      `${this.baseUrl}/ordens-servico/${id}`,
      { defeito, solucao },
      { headers: this.headers() }
    );
  }
}