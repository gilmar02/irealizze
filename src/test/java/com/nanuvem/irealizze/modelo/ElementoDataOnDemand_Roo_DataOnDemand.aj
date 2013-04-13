// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze.modelo;

import com.nanuvem.irealizze.modelo.Elemento;
import com.nanuvem.irealizze.modelo.ElementoDataOnDemand;
import com.nanuvem.irealizze.modelo.Projeto;
import com.nanuvem.irealizze.modelo.ProjetoDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ElementoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ElementoDataOnDemand: @Component;
    
    private Random ElementoDataOnDemand.rnd = new SecureRandom();
    
    private List<Elemento> ElementoDataOnDemand.data;
    
    @Autowired
    private ProjetoDataOnDemand ElementoDataOnDemand.projetoDataOnDemand;
    
    public Elemento ElementoDataOnDemand.getNewTransientElemento(int index) {
        Elemento obj = new Elemento();
        setNome(obj, index);
        setPai(obj, index);
        setProjeto(obj, index);
        return obj;
    }
    
    public void ElementoDataOnDemand.setNome(Elemento obj, int index) {
        String nome = "nome_" + index;
        obj.setNome(nome);
    }
    
    public void ElementoDataOnDemand.setPai(Elemento obj, int index) {
        Elemento pai = obj;
        obj.setPai(pai);
    }
    
    public void ElementoDataOnDemand.setProjeto(Elemento obj, int index) {
        Projeto projeto = projetoDataOnDemand.getRandomProjeto();
        obj.setProjeto(projeto);
    }
    
    public Elemento ElementoDataOnDemand.getSpecificElemento(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Elemento obj = data.get(index);
        Long id = obj.getId();
        return Elemento.findElemento(id);
    }
    
    public Elemento ElementoDataOnDemand.getRandomElemento() {
        init();
        Elemento obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Elemento.findElemento(id);
    }
    
    public boolean ElementoDataOnDemand.modifyElemento(Elemento obj) {
        return false;
    }
    
    public void ElementoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Elemento.findElementoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Elemento' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Elemento>();
        for (int i = 0; i < 10; i++) {
            Elemento obj = getNewTransientElemento(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
