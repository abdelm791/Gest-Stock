package org.gst.Repository;

import org.gst.model.Vente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface VenteRepository extends JpaRepository<Vente, Long> {

	@Query("Select v from Vente v where v.id=id ")
	public Vente findOne(Long id);

}
