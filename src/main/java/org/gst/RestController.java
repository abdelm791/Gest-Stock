package org.gst;

import org.gst.Service.ClientService;
import org.gst.Service.UserService;
import org.gst.model.Client;
import org.gst.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@org.springframework.web.bind.annotation.RestController

public class RestController {
	
	@Autowired
	private ClientService clientService;
	@Autowired
	private UserService userService;
	
    @GetMapping("/")
	public String homepage() {
		return "Welcome to Homepage";}
    
    @GetMapping("/saveuser")
	public String saveUser(@RequestParam String username, @RequestParam String firstname, @RequestParam String lastname, @RequestParam int age, @RequestParam String password) {
		User user = new User(username, firstname, lastname, age, password);
		userService.saveMyUser(user);
		return "User Saved";
	}
	
    
    
    
    @GetMapping("/saveclient")
	public String saveClient(@RequestParam String Nom,@RequestParam String Prenom,
				@RequestParam String Adresse,@RequestParam String Email) 
		 {
			Client client=new Client(Nom,Prenom,Adresse,Email);
			
			clientService.saveClient(client);
			
			return "Client saved";
}
}