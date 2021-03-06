// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze.modelo.perene;

import com.nanuvem.irealizze.modelo.perene.Preco;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Preco_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Preco.entityManager;
    
    public static final EntityManager Preco.entityManager() {
        EntityManager em = new Preco().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Preco.countPrecoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Preco o", Long.class).getSingleResult();
    }
    
    public static List<Preco> Preco.findAllPrecoes() {
        return entityManager().createQuery("SELECT o FROM Preco o", Preco.class).getResultList();
    }
    
    public static Preco Preco.findPreco(Long id) {
        if (id == null) return null;
        return entityManager().find(Preco.class, id);
    }
    
    public static List<Preco> Preco.findPrecoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Preco o", Preco.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Preco.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Preco.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Preco attached = Preco.findPreco(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Preco.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Preco.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Preco Preco.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Preco merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
