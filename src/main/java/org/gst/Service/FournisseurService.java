package org.gst.Service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.gst.Repository.FournisseurRepository;

import org.gst.model.Fournisseur;
import org.springframework.stereotype.Service;

@Service
@Transactional

public class FournisseurService {
	
private final FournisseurRepository fournisseurRepository;
	
	public FournisseurService(FournisseurRepository fournisseurRepository) {
		this.fournisseurRepository=fournisseurRepository;}

	public void saveFournisseur(Fournisseur fournisseur) {
		fournisseurRepository.save(fournisseur);	
		
	}

	public List<Fournisseur> showAllFournisseurs() {
		
		List<Fournisseur> fournisseurs = new ArrayList<Fournisseur>();
		for(Fournisseur fournisseur : fournisseurRepository.findAll()) {
			fournisseurs.add(fournisseur);
		}
		return fournisseurs;
	}

	public void deleteFournisseur(int id) {
		fournisseurRepository.deleteById(id);
		
	}

	public Fournisseur editFournisseur(int id) {
		
		return  fournisseurRepository.findOne(id);
	}

}
