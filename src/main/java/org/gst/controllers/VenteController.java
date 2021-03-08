package org.gst.controllers;

import javax.servlet.http.HttpServletRequest;


import org.gst.Service.VenteService;

import org.gst.model.Vente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class VenteController {
	
	@Autowired
	private VenteService venteService;
	
	@RequestMapping(value = "/vente")
	public String VenteHome(HttpServletRequest request) {
	request.setAttribute("mode", "MODE_VENTE");
		return "vente";
	}

	@RequestMapping("/registerVente")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER_VENTE");
		return "vente";
	}
	
	@PostMapping("/save-vente")
	public String registerVente(@ModelAttribute Vente vente, BindingResult bindingResult, HttpServletRequest request) {
		venteService.saveVente(vente);
		request.setAttribute("mode", "MODE_VENTE");
		return "vente";
	}
	
	@GetMapping("/show-ventes")
	public String showAllArticles(HttpServletRequest request) {
		request.setAttribute("ventes", venteService.showAllVentes());
		request.setAttribute("mode", "ALL_VENTES");
		return "vente";
	}
	
	
	@RequestMapping("/delete-vente")
	public String deleteArticle(@RequestParam Long id, HttpServletRequest request) {
		venteService.deleteVente(id);
		request.setAttribute("ventes", venteService.showAllVentes());
		request.setAttribute("mode", "ALL_VENTES");
		return "vente";
	}
	
	@RequestMapping("/edit-vente")
	public String editArticle(@RequestParam Long id,HttpServletRequest request) {
		request.setAttribute("vente", venteService.editVente(id));
		request.setAttribute("mode", "MODE_UPDATE_VENTE");
		return "vente";
	}
}
