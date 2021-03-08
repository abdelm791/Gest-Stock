package org.gst.controllers;

import javax.servlet.http.HttpServletRequest;

import org.gst.Service.CategorieService;
import org.gst.model.Categorie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategorieControlleur {
	@Autowired
	CategorieService categorieService;
	
	@RequestMapping(value = "/categorie")
	public String blankHome(HttpServletRequest request) {
	request.setAttribute("mode", "MODE_CATEGORIE");
		return "categorie";
	}

	@RequestMapping("/registerCategorie")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER_CATEGORIE");
		return "categorie";
	}
	
	@PostMapping("/save-categorie")
	public String registerCategorie(@ModelAttribute Categorie categorie, BindingResult bindingResult, HttpServletRequest request) {
		categorieService.saveCategorie(categorie);
		request.setAttribute("mode", "MODE_CATEGORIE");
		return "categorie";
	}
	
	@GetMapping("/show-categories")
	public String showAllCategories(HttpServletRequest request) {
		request.setAttribute("categories", categorieService.showAllCategories());
		request.setAttribute("mode", "ALL_CATEGORIES");
		return "categorie";
	}
	
	
	@RequestMapping("/delete-categorie")
	public String deleteCategorie(@RequestParam Long id, HttpServletRequest request) {
		categorieService.deleteMyCategorie(id);
		request.setAttribute("categories", categorieService.showAllCategories());
		request.setAttribute("mode", "ALL_CATEGORIES");
		return "categorie";
	}
	
	@RequestMapping("/edit-categorie")
	public String editCategorie(@RequestParam Long id,HttpServletRequest request) {
		request.setAttribute("categorie", categorieService.editCategorie(id));
		request.setAttribute("mode", "MODE_UPDATE_CATEGORIE");
		return "categorie";
  	

	}
	
}
