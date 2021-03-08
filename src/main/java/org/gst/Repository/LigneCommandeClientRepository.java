package org.gst.Repository;



import java.util.List;

import org.gst.model.LigneCommandeClient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LigneCommandeClientRepository extends JpaRepository<LigneCommandeClient, Long> {
	
	@Query("select p from LigneCommandeClient p where p.id=id")
	public List<LigneCommandeClient> findOne(Long id);
	


	
	
}
