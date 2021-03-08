package org.gst.controllers;

import javax.servlet.http.HttpServletRequest;


import org.gst.Service.LigneCommandeFournisseurService;
import org.gst.model.LigneCommandeFournisseur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LigneCommandeFournisseurController {
	
	@Autowired
	LigneCommandeFournisseurService lignecommandefournisseurservice;
	
	@RequestMapping(value = "/lignecommandefournisseur")
	public String LigneCommFournisseurHome(HttpServletRequest request) {
	request.setAttribute("mode", "MODE_LIGNECOMMANDEFOURNISSEUR");
		return "lignecommandefournisseur";
	}

	@RequestMapping("/registerLigneCommandeFournisseur")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER_LIGNECOMMANDEFOURNISSEUR");
		return "lignecommandefournisseur";
	}
	
	@PostMapping("/save-lignecommandefournisseur")
	public String registerLigneCommandeFournisseur(@ModelAttribute LigneCommandeFournisseur lignecommandefournisseur, BindingResult bindingResult, HttpServletRequest request) {
		lignecommandefournisseurservice.saveLigneCommandeFournisseur(lignecommandefournisseur);
		request.setAttribute("mode", "MODE_LIGNECOMMANDEFOURNISSEUR");
		return "lignecommandefournisseur";
	}
	
	@GetMapping("/show-lignecommandefournisseurs")
	public String showAllLIGNECommandeFours(HttpServletRequest request) {
		request.setAttribute("lignecommandefournisseurs", lignecommandefournisseurservice.showAllLigneCommandeFournisseurs());
		request.setAttribute("mode", "ALL_LIGNECOMMANDEFOURNISSEURS");
		return "lignecommandefournisseur";
	}
	
	
	@RequestMapping("/delete-lignecommandefournisseur")
	public String deleteLigneCommandeFournisseur(@RequestParam int id, HttpServletRequest request) {
		lignecommandefournisseurservice.deleteLigneCommandeFournisseur(id);
		request.setAttribute("lignecommandefournisseurs", lignecommandefournisseurservice.showAllLigneCommandeFournisseurs());
		request.setAttribute("mode", "ALL_LIGNECOMMANDEFOURNISSEURS");
		return "lignecommandefournisseur";
	}
	
	@RequestMapping("/edit-lignecommandefournisseur")
	public String editLigneCommandefournisseur(@RequestParam int id,HttpServletRequest request) {
		request.setAttribute("lignecommandefournisseur", lignecommandefournisseurservice.editLigneCommandeFournisseur(id));
		request.setAttribute("mode", "MODE_UPDATE_LIGNECOMMANDEFOURNISSEUR");
		return "lignecommandefournisseur";
	}


}
