package org.gst.controllers;

import javax.servlet.http.HttpServletRequest;

import org.gst.Service.ClientService;

import org.gst.model.Client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ClientController {
	
	@Autowired
	ClientService clientService;
	
	@RequestMapping(value = "/client")
	public String ClientHome(HttpServletRequest request) {
	request.setAttribute("mode", "MODE_CLIENT");
		return "client";
	}

	@RequestMapping("/registerClient")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER_CLIENT");
		return "client";
	}
	
	@PostMapping("/save-client")
	public String registerClient(@ModelAttribute Client client, BindingResult bindingResult, HttpServletRequest request) {
		clientService.saveClient(client);
		request.setAttribute("mode", "MODE_CLIENT");
		return "client";
	}
	
	@GetMapping("/show-clients")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("clients", clientService.showAllClients());
		request.setAttribute("mode", "ALL_CLIENTS");
		return "client";
	}
	
	
	@RequestMapping("/delete-client")
	public String deleteUser(@RequestParam int id, HttpServletRequest request) {
		clientService.deleteClient(id);
		request.setAttribute("clients", clientService.showAllClients());
		request.setAttribute("mode", "ALL_CLIENTS");
		return "client";
	}
	
	@RequestMapping("/edit-client")
	public String editUser(@RequestParam int id,HttpServletRequest request) {
		request.setAttribute("client", clientService.editClient(id));
		request.setAttribute("mode", "MODE_UPDATE_CLIENT");
		return "client";
	}
	
}


