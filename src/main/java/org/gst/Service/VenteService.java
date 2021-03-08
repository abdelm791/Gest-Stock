package org.gst.Service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;


import org.gst.Repository.VenteRepository;

import org.gst.model.Vente;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class VenteService {

private final VenteRepository venteRepository;
	
	public VenteService(VenteRepository venteRepository) {
		this.venteRepository=venteRepository;
	}
	
	public void saveVente(Vente vente ) {
		venteRepository.save(vente);
	}
	
	public List<Vente> showAllVentes(){
		List<Vente> ventes = new ArrayList<Vente>();
		for(Vente vente : venteRepository.findAll()) {
			ventes.add(vente);
		}
		
		return ventes;
	}
	
	public void deleteVente(Long id) {
		venteRepository.deleteById(id);
	}
	
	public Vente editVente(Long id) {
		return  venteRepository.findOne(id);
	}
	

}
