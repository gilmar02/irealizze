// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze.modelo;

import com.nanuvem.irealizze.modelo.Projeto;
import com.nanuvem.irealizze.modelo.ProjetoDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ProjetoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProjetoDataOnDemand: @Component;
    
    private Random ProjetoDataOnDemand.rnd = new SecureRandom();
    
    private List<Projeto> ProjetoDataOnDemand.data;
    
    public Projeto ProjetoDataOnDemand.getNewTransientProjeto(int index) {
        Projeto obj = new Projeto();
        setCliente(obj, index);
        setNome(obj, index);
        return obj;
    }
    
    public void ProjetoDataOnDemand.setCliente(Projeto obj, int index) {
        String cliente = "cliente_" + index;
        obj.setCliente(cliente);
    }
    
    public void ProjetoDataOnDemand.setNome(Projeto obj, int index) {
        String nome = "nome_" + index;
        obj.setNome(nome);
    }
    
    public Projeto ProjetoDataOnDemand.getSpecificProjeto(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Projeto obj = data.get(index);
        Long id = obj.getId();
        return Projeto.findProjeto(id);
    }
    
    public Projeto ProjetoDataOnDemand.getRandomProjeto() {
        init();
        Projeto obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Projeto.findProjeto(id);
    }
    
    public boolean ProjetoDataOnDemand.modifyProjeto(Projeto obj) {
        return false;
    }
    
    public void ProjetoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Projeto.findProjetoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Projeto' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Projeto>();
        for (int i = 0; i < 10; i++) {
            Projeto obj = getNewTransientProjeto(i);
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
