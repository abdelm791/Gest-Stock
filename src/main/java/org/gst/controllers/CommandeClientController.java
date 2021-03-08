package org.gst.controllers;

import java.util.ArrayList;



import javax.servlet.http.HttpServletRequest;


import org.gst.Service.ClientService;
import org.gst.Service.CommandeClientService;

import org.gst.model.Client;
import org.gst.model.CommandeClient;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class CommandeClientController {
	
	@Autowired
	CommandeClientService commandeclientService;
	

	
	@Autowired
	ClientService clientService;
	
	
	
	@RequestMapping(value = "/commandeclient")
	public String ClientHome(HttpServletRequest request) {
	request.setAttribute("mode", "MODE_COMMANDECLIENT");
		return "commandeclient";
	}

	@RequestMapping("/registerCommandeClient")
	public String registration(HttpServletRequest request) {
		request.setAttribute("clients", clientService.showAllClients());
		request.setAttribute("mode", "MODE_REGISTER_COMMANDECLIENT");
		return "commandeclient";
	}
	
	@PostMapping("/save-commandeclient")
	public String registerCommandeClient(@ModelAttribute CommandeClient commandeclient, BindingResult bindingResult, HttpServletRequest request, ArrayList<Client> clients, Client client) {
				
		commandeclientService.saveCommandeClient(commandeclient);
		request.setAttribute("mode", "MODE_COMMANDECLIENT");
		return "commandeclient";
	}
	
	

	@GetMapping("/show-commandeclients")
	public String showAllcommandesclients(HttpServletRequest request) {
		
		
		request.setAttribute("commandeclients", commandeclientService.showAllCommandeClients());
		
		request.setAttribute("mode", "ALL_COMMANDECLIENTS");
		return "commandeclient";
	}
	
	
	@RequestMapping("/delete-commandeclient")
	public String deleteUser(@RequestParam Integer id, HttpServletRequest request) {
		commandeclientService.deleteCommandeClient(id);
		request.setAttribute("commandeclients", commandeclientService.showAllCommandeClients());
		request.setAttribute("mode", "ALL_COMMANDECLIENTS");
		return "commandeclient";
	}
	
	@RequestMapping("/edit-commandeclient")
	public String editUser(@RequestParam Integer id,HttpServletRequest request) {
		request.setAttribute("commandeclient", commandeclientService.editCommandeClient(id));
		request.setAttribute("clients", clientService.showAllClients());
		request.setAttribute("mode", "MODE_UPDATE_COMMANDECLIENT");
		return "commandeclient";
	}
	

}
