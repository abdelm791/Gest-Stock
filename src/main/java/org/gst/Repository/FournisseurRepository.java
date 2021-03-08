package org.gst.Repository;

import org.gst.model.Fournisseur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface FournisseurRepository extends JpaRepository<Fournisseur, Integer> {

	

	@Query("select f from Fournisseur f where f.id=id")
	public Fournisseur findOne(int id);

}
