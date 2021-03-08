package org.gst.controllers;

import javax.servlet.http.HttpServletRequest;

import org.gst.Service.FournisseurService;

import org.gst.model.Fournisseur;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class FournisseurController {
	
	@Autowired
	FournisseurService fournisseurService;
	
	@RequestMapping(value = "/fournisseur")
	public String Fournisseurhome(HttpServletRequest request) {
	request.setAttribute("mode", "MODE_FOURNISSEUR");
		return "fournisseur";
	}

	@RequestMapping("/registerFournisseur")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER_FOURNISSEUR");
		return "fournisseur";
	}
	
	@PostMapping("/save-fournisseur")
	public String registerFournisseur(@ModelAttribute Fournisseur fournisseur, BindingResult bindingResult, HttpServletRequest request) {
		fournisseurService.saveFournisseur(fournisseur);
		request.setAttribute("mode", "MODE_FOURNISSEUR");
		return "fournisseur";
	}
	
	@GetMapping("/show-fournisseurs")
	public String showAllFournisseurs(HttpServletRequest request) {
		request.setAttribute("fournisseurs", fournisseurService.showAllFournisseurs());
		request.setAttribute("mode", "MODE_ALL_FOURNISSEURS");
		return "fournisseur";
	}
	
	
	@RequestMapping("/delete-fournisseur")
	public String deleteFournisseur(@RequestParam int id, HttpServletRequest request) {
		fournisseurService.deleteFournisseur(id);
		request.setAttribute("fournisseurs", fournisseurService.showAllFournisseurs());
		request.setAttribute("mode", "MODE_ALL_FOURNISSEURS");
		return "fournisseur";
	}
	
	@RequestMapping("/edit-fournisseur")
	public String editFournisseur(@RequestParam int id,HttpServletRequest request) {
		request.setAttribute("fournisseur", fournisseurService.editFournisseur(id));
		request.setAttribute("mode", "MODE_UPDATE_FOURNISSEUR");
		return "fournisseur";
  	
	}
	
	

}
