package com.nanuvem.irealizze;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nanuvem.irealizze.modelo.Projeto;

@RooWebJson(jsonObject = Projeto.class)
@Controller
@RequestMapping("/projetos")
public class ProjetoController {
}
