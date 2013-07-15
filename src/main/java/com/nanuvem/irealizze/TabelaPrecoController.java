package com.nanuvem.irealizze;

import com.nanuvem.irealizze.modelo.perene.TabelaPreco;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RooWebJson(jsonObject = TabelaPreco.class)
@Controller
@RequestMapping("/tabelasprecos")
public class TabelaPrecoController {
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json) {
        TabelaPreco tabelaPreco = TabelaPreco.fromJsonToTabelaPreco(json);
        tabelaPreco.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    

}
