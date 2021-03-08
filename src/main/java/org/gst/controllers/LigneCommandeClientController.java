package org.gst.controllers;

import javax.servlet.http.HttpServletRequest;

import org.gst.Service.LigneCommandeClientService;
import org.gst.model.LigneCommandeClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LigneCommandeClientController {
	
	@Autowired
	LigneCommandeClientService ligneCommandeClientService;
	
	@RequestMapping(value = "/lignecommandeclient")
	public String LigneCmdHome(HttpServletRequest request) {
	request.setAttribute("mode", "MODE_LIGNECOMMANDECLIENT");
		return "lignecommandeclient";
	}

	@RequestMapping("/registerLigneCommandeClient")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER_LIGNECOMMANDECLIENT");
		return "lignecommandeclient";
	}
	
	@PostMapping("/save-lignecommandeclient")
	public String registerLigneCommandeClient(@ModelAttribute LigneCommandeClient ligneCommandeClient, BindingResult bindingResult, HttpServletRequest request) {
		ligneCommandeClientService.saveLigneCommandeClient(ligneCommandeClient);
		request.setAttribute("mode", "MODE_LIGNECOMMANDECLIENT");
		return "lignecommandeclient";
	}
	
	@GetMapping("/show-lignecommandeclients")
	public String showAllLigneCommandeClients(HttpServletRequest request) {
		request.setAttribute("ligneCommandeClients", ligneCommandeClientService.showAllLigneCommandeClients());
		request.setAttribute("mode", "ALL_LIGNECOMMANDECLIENTS");
		return "lignecommandeclient";
	}
	
	
	@RequestMapping("/delete-lignecommandeclient")
	public String deleteLigneCommandeClient(@RequestParam Long id, HttpServletRequest request) {
		ligneCommandeClientService.deleteMyLigneCommandeClient(id);
		request.setAttribute("ligneCommandeClients", ligneCommandeClientService.showAllLigneCommandeClients());
		request.setAttribute("mode", "ALL_LIGNECOMMANDECLIENTS");
		return "lignecommandeclient";
	}
	
	@RequestMapping("/edit-lignecommandeclient")
	public String editLigneCommandeClient(@RequestParam Long id,HttpServletRequest request) {
		request.setAttribute("ligneCommandeClient", ligneCommandeClientService.editLigneCommandeClient(id));
		request.setAttribute("mode", "MODE_UPDATE_LIGNECOMMANDECLIENT");
		return "lignecommandeclient";
  	
	}


}
