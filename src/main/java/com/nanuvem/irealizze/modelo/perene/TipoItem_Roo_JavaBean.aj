// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze.modelo.perene;

import com.nanuvem.irealizze.modelo.perene.Item;
import com.nanuvem.irealizze.modelo.perene.TipoItem;
import java.util.Set;

privileged aspect TipoItem_Roo_JavaBean {
    
    public String TipoItem.getNome() {
        return this.nome;
    }
    
    public void TipoItem.setNome(String nome) {
        this.nome = nome;
    }
    
    public TipoItem TipoItem.getPai() {
        return this.pai;
    }
    
    public void TipoItem.setPai(TipoItem pai) {
        this.pai = pai;
    }
    
    public Set<TipoItem> TipoItem.getFilhos() {
        return this.filhos;
    }
    
    public void TipoItem.setFilhos(Set<TipoItem> filhos) {
        this.filhos = filhos;
    }
    
    public Set<Item> TipoItem.getItens() {
        return this.itens;
    }
    
    public void TipoItem.setItens(Set<Item> itens) {
        this.itens = itens;
    }
    
}
