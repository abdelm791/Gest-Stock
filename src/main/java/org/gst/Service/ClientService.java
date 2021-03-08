package org.gst.Service;





import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.gst.Repository.ClientRepository;
import org.gst.model.Client;

import org.springframework.stereotype.Service;



@Service
@Transactional
public class ClientService {
	
	private final ClientRepository clientRepository;
	
	
	public ClientService(ClientRepository clientRepository) {
		
		this.clientRepository = clientRepository;
	}


	public void saveClient(Client client ) {
		clientRepository.save(client);
	}
	
	public List<Client> showAllClients(){
		List<Client> clients = new ArrayList<Client>();
		for(Client client : clientRepository.findAll()) {
			clients.add(client);
		}
		
		return clients;
	}
	

	
	
	public void deleteClient(Integer id) {
		clientRepository.deleteById(id);
	}
	
	public Client editClient(Integer id) {
		return  clientRepository.findOne(id);
	}
		
	
	}
	
	



