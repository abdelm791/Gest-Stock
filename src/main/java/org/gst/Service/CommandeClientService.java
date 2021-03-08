package org.gst.Service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.gst.Repository.ClientRepository;
import org.gst.Repository.CommandeClientRepository;

import org.gst.model.CommandeClient;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class CommandeClientService {
	
private final CommandeClientRepository commandeclientRepository;
private final ClientRepository clientRepository;

	
	
	public CommandeClientService(CommandeClientRepository commandeclientRepository,ClientRepository clientRepository) {
		
		this.commandeclientRepository = commandeclientRepository;
		this.clientRepository = clientRepository;
	}


	public CommandeClient saveCommandeClient(CommandeClient commandeclient ) {
		commandeclient.setClient(clientRepository.findOne(commandeclient.getIdClient()));
		return commandeclientRepository.save(commandeclient);
	}
	
	public List<CommandeClient> showAllCommandeClients(){
		List<CommandeClient> commandeclients = new ArrayList<CommandeClient>();
		for(CommandeClient commandeclient : commandeclientRepository.findAll()) {
			commandeclients.add(commandeclient);
		}
		
		return commandeclients;
	}
	
	public void deleteCommandeClient(Integer id) {
		commandeclientRepository.deleteById(id);
	}
	
	public CommandeClient editCommandeClient(Integer id) {
		return  commandeclientRepository.findOne(id);
	}


	
		
	

}
