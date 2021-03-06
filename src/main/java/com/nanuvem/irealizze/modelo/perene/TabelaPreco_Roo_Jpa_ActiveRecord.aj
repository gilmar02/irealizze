// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze.modelo.perene;

import com.nanuvem.irealizze.modelo.perene.TabelaPreco;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TabelaPreco_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager TabelaPreco.entityManager;
    
    public static final EntityManager TabelaPreco.entityManager() {
        EntityManager em = new TabelaPreco().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long TabelaPreco.countTabelaPrecoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TabelaPreco o", Long.class).getSingleResult();
    }
    
    public static List<TabelaPreco> TabelaPreco.findAllTabelaPrecoes() {
        return entityManager().createQuery("SELECT o FROM TabelaPreco o", TabelaPreco.class).getResultList();
    }
    
    public static TabelaPreco TabelaPreco.findTabelaPreco(Long id) {
        if (id == null) return null;
        return entityManager().find(TabelaPreco.class, id);
    }
    
    public static List<TabelaPreco> TabelaPreco.findTabelaPrecoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TabelaPreco o", TabelaPreco.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void TabelaPreco.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void TabelaPreco.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            TabelaPreco attached = TabelaPreco.findTabelaPreco(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void TabelaPreco.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void TabelaPreco.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public TabelaPreco TabelaPreco.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TabelaPreco merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
