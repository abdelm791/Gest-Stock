package org.gst.Service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.gst.Repository.CommandeFournisseurRepository;
import org.gst.Repository.FournisseurRepository;
import org.gst.model.CommandeFournisseur;

import org.springframework.stereotype.Service;


@Service
@Transactional
public class CommandeFournisseurService {
	
private final CommandeFournisseurRepository commandefournisseurRepository;
private final FournisseurRepository fournisseurRepository;
	
	public CommandeFournisseurService(CommandeFournisseurRepository commandefournisseurRepository,FournisseurRepository fournisseurRepository) {
		this.commandefournisseurRepository=commandefournisseurRepository;
		this.fournisseurRepository=fournisseurRepository;}
	

	public CommandeFournisseur saveCommandeFournisseur(CommandeFournisseur commandefournisseur) {
		commandefournisseur.setFournisseur(fournisseurRepository.findOne(commandefournisseur.getIdFournisseur()));
		return commandefournisseurRepository.save(commandefournisseur);	
		
	}

	public List<CommandeFournisseur> showAllCommandeFournisseurs() {
		
		List<CommandeFournisseur> commandefournisseurs = new ArrayList<CommandeFournisseur>();
		for(CommandeFournisseur commandefournisseur : commandefournisseurRepository.findAll()) {
			commandefournisseurs.add(commandefournisseur);
		}
		return commandefournisseurs;
	}

	public void deleteCommandeFournisseur(int id) {
		commandefournisseurRepository.deleteById(id);
		
	}

	public CommandeFournisseur editCommandeFournisseur(int id) {
		
		return  commandefournisseurRepository.findOne(id);
	}


}
