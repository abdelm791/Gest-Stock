package org.gst.Service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.gst.Repository.LigneCommandeFournisseurRepository;
import org.gst.model.LigneCommandeFournisseur;
import org.springframework.stereotype.Service;
@Service
@Transactional
public class LigneCommandeFournisseurService {

private final LigneCommandeFournisseurRepository lignecommandefournisseurRepository;

	
	public LigneCommandeFournisseurService(LigneCommandeFournisseurRepository lignecommandefournisseurRepository) {
		this.lignecommandefournisseurRepository=lignecommandefournisseurRepository;}
	

	public void saveLigneCommandeFournisseur(LigneCommandeFournisseur lignecommandefournisseur) {
		lignecommandefournisseurRepository.save(lignecommandefournisseur);	
		
	}

	public List<LigneCommandeFournisseur> showAllLigneCommandeFournisseurs() {
		
		List<LigneCommandeFournisseur> lignecommandefournisseurs = new ArrayList<LigneCommandeFournisseur>();
		for(LigneCommandeFournisseur lignecommandefournisseur : lignecommandefournisseurRepository.findAll()) {
			lignecommandefournisseurs.add(lignecommandefournisseur);
		}
		return lignecommandefournisseurs;
	}

	public void deleteLigneCommandeFournisseur(int id) {
		lignecommandefournisseurRepository.deleteById(id);
		
	}

	public LigneCommandeFournisseur editLigneCommandeFournisseur(int id) {
		
		return  lignecommandefournisseurRepository.findOne(id);
	}
}
