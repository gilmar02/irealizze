// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze.modelo.perene;

import com.nanuvem.irealizze.modelo.perene.Item;
import com.nanuvem.irealizze.modelo.perene.Preco;
import com.nanuvem.irealizze.modelo.perene.TabelaPreco;

privileged aspect Preco_Roo_JavaBean {
    
    public double Preco.getValorUnitario() {
        return this.valorUnitario;
    }
    
    public void Preco.setValorUnitario(double valorUnitario) {
        this.valorUnitario = valorUnitario;
    }
    
    public Item Preco.getItem() {
        return this.item;
    }
    
    public void Preco.setItem(Item item) {
        this.item = item;
    }
    
    public TabelaPreco Preco.getTabela() {
        return this.tabela;
    }
    
    public void Preco.setTabela(TabelaPreco tabela) {
        this.tabela = tabela;
    }
    
}
