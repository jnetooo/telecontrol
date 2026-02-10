import { ComponentFixture, TestBed } from '@angular/core/testing';
import { OrdemDetalhePage } from './ordem-detalhe.page';

describe('OrdemDetalhePage', () => {
  let component: OrdemDetalhePage;
  let fixture: ComponentFixture<OrdemDetalhePage>;

  beforeEach(() => {
    fixture = TestBed.createComponent(OrdemDetalhePage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
