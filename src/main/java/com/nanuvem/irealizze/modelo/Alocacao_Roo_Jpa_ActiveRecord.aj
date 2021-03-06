// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze.modelo;

import com.nanuvem.irealizze.modelo.Alocacao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Alocacao_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Alocacao.entityManager;
    
    public static final EntityManager Alocacao.entityManager() {
        EntityManager em = new Alocacao().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Alocacao.countAlocacaos() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Alocacao o", Long.class).getSingleResult();
    }
    
    public static List<Alocacao> Alocacao.findAllAlocacaos() {
        return entityManager().createQuery("SELECT o FROM Alocacao o", Alocacao.class).getResultList();
    }
    
    public static Alocacao Alocacao.findAlocacao(Long id) {
        if (id == null) return null;
        return entityManager().find(Alocacao.class, id);
    }
    
    public static List<Alocacao> Alocacao.findAlocacaoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Alocacao o", Alocacao.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Alocacao.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Alocacao.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Alocacao attached = Alocacao.findAlocacao(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Alocacao.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Alocacao.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Alocacao Alocacao.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Alocacao merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
