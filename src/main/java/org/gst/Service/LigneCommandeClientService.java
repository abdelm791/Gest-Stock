package org.gst.Service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.gst.Repository.LigneCommandeClientRepository;
import org.gst.model.LigneCommandeClient;
import org.springframework.stereotype.Service;
@Service
@Transactional
public class LigneCommandeClientService {
	
	
	
		
		private final LigneCommandeClientRepository ligneCommandeClientRepository;
		
		public LigneCommandeClientService(LigneCommandeClientRepository ligneCommandeClientRepository) {
			this.ligneCommandeClientRepository=ligneCommandeClientRepository;
		}
		
		public void saveLigneCommandeClient(LigneCommandeClient ligneCommandeClient ) {
			ligneCommandeClientRepository.save(ligneCommandeClient);
		}
		
		public List<LigneCommandeClient> showAllLigneCommandeClients(){
			List<LigneCommandeClient> ligneCommandeClients = new ArrayList<LigneCommandeClient>();
			for(LigneCommandeClient ligneCommandeClient : ligneCommandeClientRepository.findAll()) {
				ligneCommandeClients.add(ligneCommandeClient);
			}
			
			return ligneCommandeClients;
		}
		
		public void deleteMyLigneCommandeClient(Long id) {
			ligneCommandeClientRepository.deleteById(id);
		}
		
		public List<LigneCommandeClient> editLigneCommandeClient(Long id) {
			return  ligneCommandeClientRepository.findOne(id);
		}

		
		

		
		
}
