package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.repository.JogosRepository;
import org.springframework.ui.Model;

import application.model.Genero;
import application.model.Jogos;
import application.repository.GeneroRepository;

@Controller
@RequestMapping(value = {"/", "/jogos"})
public class JogosController {
    @Autowired
    private JogosRepository jogosRepo;
    @Autowired
    private GeneroRepository generoRepo;
    
    @RequestMapping(value = {"", "/list"})
    public String list(Model ui){
        ui.addAttribute("jogos", jogosRepo.findAll());
        return "/jogo/list";
    }

    @RequestMapping("/insert")
    public String insert(Model ui) {
        ui.addAttribute("generos", generoRepo.findAll());
        return "/jogo/insert";
    }
    
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam("titulo") String titulo, @RequestParam("genero") int generoId) {
        Optional<Genero> resultado = generoRepo.findById(generoId);
        if(resultado.isPresent()){
            Jogos jogos = new Jogos();
            jogos.setTitulo(titulo);
            jogos.setGenero(resultado.get());

            jogosRepo.save(jogos);
        }
        return "redirect:/jogos/list";
    }

        @RequestMapping("/update")
        public String update(@RequestParam("id") long id, Model ui) {
            Optional<Jogos> result = jogosRepo.findById(id);
            if(result.isPresent()) {
                ui.addAttribute("jogo", result.get());
                ui.addAttribute("generos", generoRepo.findAll());
                return "/jogo/update";
            }
            return "redirect:/jogos/list";
        }
        
        @RequestMapping(value = "/update", method = RequestMethod.POST)
        public String update(@RequestParam("id") long id, @RequestParam("titulo") String titulo, @RequestParam("genero") int generoId, Optional<Jogos> result) {
            Optional<Genero> resultGenero = generoRepo.findById(generoId);
            if(resultGenero.isPresent()) {
                result.get().setTitulo(titulo);
                result.get().setGenero(resultGenero.get());
                jogosRepo.save(result.get());
            }
        
        return "redirect:/jogos/list";
        } 
        @RequestMapping("/delete")
        public String delete(Model ui, @RequestParam("id") long id) {
            Optional<Jogos> resultado = jogosRepo.findById(id);
        
            if(resultado.isPresent()) {
                ui.addAttribute("jogo", resultado.get());
                return "/jogo/delete";
            }
        
            return "redirect:/jogos/list";
        }
        
        @RequestMapping(value = "/delete", method = RequestMethod.POST)
        public String delete(@RequestParam("id") long id) {
            jogosRepo.deleteById(id);
        
            return "redirect:/jogos/list";
        
    }
}
