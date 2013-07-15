// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze.modelo;

import com.nanuvem.irealizze.modelo.Projeto;
import com.nanuvem.irealizze.modelo.ProjetoDataOnDemand;
import com.nanuvem.irealizze.modelo.ProjetoIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProjetoIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ProjetoIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ProjetoIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ProjetoIntegrationTest: @Transactional;
    
    @Autowired
    ProjetoDataOnDemand ProjetoIntegrationTest.dod;
    
    @Test
    public void ProjetoIntegrationTest.testCountProjetoes() {
        Assert.assertNotNull("Data on demand for 'Projeto' failed to initialize correctly", dod.getRandomProjeto());
        long count = Projeto.countProjetoes();
        Assert.assertTrue("Counter for 'Projeto' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ProjetoIntegrationTest.testFindProjeto() {
        Projeto obj = dod.getRandomProjeto();
        Assert.assertNotNull("Data on demand for 'Projeto' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Projeto' failed to provide an identifier", id);
        obj = Projeto.findProjeto(id);
        Assert.assertNotNull("Find method for 'Projeto' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Projeto' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ProjetoIntegrationTest.testFindAllProjetoes() {
        Assert.assertNotNull("Data on demand for 'Projeto' failed to initialize correctly", dod.getRandomProjeto());
        long count = Projeto.countProjetoes();
        Assert.assertTrue("Too expensive to perform a find all test for 'Projeto', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Projeto> result = Projeto.findAllProjetoes();
        Assert.assertNotNull("Find all method for 'Projeto' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Projeto' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ProjetoIntegrationTest.testFindProjetoEntries() {
        Assert.assertNotNull("Data on demand for 'Projeto' failed to initialize correctly", dod.getRandomProjeto());
        long count = Projeto.countProjetoes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Projeto> result = Projeto.findProjetoEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Projeto' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Projeto' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ProjetoIntegrationTest.testFlush() {
        Projeto obj = dod.getRandomProjeto();
        Assert.assertNotNull("Data on demand for 'Projeto' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Projeto' failed to provide an identifier", id);
        obj = Projeto.findProjeto(id);
        Assert.assertNotNull("Find method for 'Projeto' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyProjeto(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Projeto' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProjetoIntegrationTest.testMergeUpdate() {
        Projeto obj = dod.getRandomProjeto();
        Assert.assertNotNull("Data on demand for 'Projeto' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Projeto' failed to provide an identifier", id);
        obj = Projeto.findProjeto(id);
        boolean modified =  dod.modifyProjeto(obj);
        Integer currentVersion = obj.getVersion();
        Projeto merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Projeto' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProjetoIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Projeto' failed to initialize correctly", dod.getRandomProjeto());
        Projeto obj = dod.getNewTransientProjeto(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Projeto' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Projeto' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Projeto' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ProjetoIntegrationTest.testRemove() {
        Projeto obj = dod.getRandomProjeto();
        Assert.assertNotNull("Data on demand for 'Projeto' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Projeto' failed to provide an identifier", id);
        obj = Projeto.findProjeto(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Projeto' with identifier '" + id + "'", Projeto.findProjeto(id));
    }
    
}
