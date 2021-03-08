package org.gst.controllers;

import javax.servlet.http.HttpServletRequest;

import org.gst.Service.CommandeFournisseurService;
import org.gst.Service.FournisseurService;
import org.gst.model.CommandeFournisseur;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommandeFournisseurController {
	
	@Autowired
	CommandeFournisseurService commandefournisseurservice;
	
	@Autowired
	FournisseurService fournisseurservice;
	
	@RequestMapping(value = "/commandefournisseur")
	public String CommFournisseurHome(HttpServletRequest request) {
	request.setAttribute("mode", "MODE_COMMANDEFOURNISSEUR");
		return "commandefournisseur";
	}

	@RequestMapping("/registerCommandeFournisseur")
	public String registration(HttpServletRequest request) {
		request.setAttribute("fournisseurs", fournisseurservice.showAllFournisseurs());
		request.setAttribute("mode", "MODE_REGISTER_COMMANDEFOURNISSEUR");
		return "commandefournisseur";
	}
	
	@PostMapping("/save-commandefournisseur")
	public String registerLigneCommandeFournisseur(@ModelAttribute CommandeFournisseur commandefournisseur, BindingResult bindingResult, HttpServletRequest request) {
		commandefournisseurservice.saveCommandeFournisseur(commandefournisseur);
		request.setAttribute("mode", "MODE_COMMANDEFOURNISSEUR");
		return "commandefournisseur";
	}  
	
	@GetMapping("/show-commandefournisseurs")
	public String showAllCommandeFours(HttpServletRequest request) {
		request.setAttribute("commandefournisseurs", commandefournisseurservice.showAllCommandeFournisseurs());
		request.setAttribute("mode", "ALL_COMMANDEFOURNISSEURS");
		return "commandefournisseur";
	}
	
	
	@RequestMapping("/delete-commandefournisseur")
	public String deleteLigneCommandeFournisseur(@RequestParam int id, HttpServletRequest request) {
		commandefournisseurservice.deleteCommandeFournisseur(id);
		request.setAttribute("commandefournisseurs", commandefournisseurservice.showAllCommandeFournisseurs());
		request.setAttribute("mode", "ALL_COMMANDEFOURNISSEURS");
		return "commandefournisseur";
	}
	
	@RequestMapping("/edit-commandefournisseur")
	public String editCommandefournisseur(@RequestParam int id,HttpServletRequest request) {
		request.setAttribute("commandefournisseur", commandefournisseurservice.editCommandeFournisseur(id));
		request.setAttribute("fournisseurs", fournisseurservice.showAllFournisseurs());
		request.setAttribute("mode", "MODE_UPDATE_COMMANDEFOURNISSEUR");
		return "commandefournisseur";
	}

}
