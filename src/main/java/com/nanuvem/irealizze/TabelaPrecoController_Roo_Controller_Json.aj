// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze;

import com.nanuvem.irealizze.TabelaPrecoController;
import com.nanuvem.irealizze.modelo.perene.TabelaPreco;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect TabelaPrecoController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TabelaPrecoController.showJson(@PathVariable("id") Long id) {
        TabelaPreco tabelaPreco = TabelaPreco.findTabelaPreco(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (tabelaPreco == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(tabelaPreco.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TabelaPrecoController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<TabelaPreco> result = TabelaPreco.findAllTabelaPrecoes();
        return new ResponseEntity<String>(TabelaPreco.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> TabelaPrecoController.createFromJsonArray(@RequestBody String json) {
        for (TabelaPreco tabelaPreco: TabelaPreco.fromJsonArrayToTabelaPrecoes(json)) {
            tabelaPreco.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> TabelaPrecoController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        TabelaPreco tabelaPreco = TabelaPreco.fromJsonToTabelaPreco(json);
        if (tabelaPreco.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> TabelaPrecoController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (TabelaPreco tabelaPreco: TabelaPreco.fromJsonArrayToTabelaPrecoes(json)) {
            if (tabelaPreco.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> TabelaPrecoController.deleteFromJson(@PathVariable("id") Long id) {
        TabelaPreco tabelaPreco = TabelaPreco.findTabelaPreco(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (tabelaPreco == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        tabelaPreco.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
