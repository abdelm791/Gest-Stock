package org.gst.Repository;


import org.gst.model.LigneCommandeFournisseur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LigneCommandeFournisseurRepository extends JpaRepository<LigneCommandeFournisseur,Integer> {
	
	
	@Query("select l from LigneCommandeFournisseur l where l.id=id")
	public LigneCommandeFournisseur findOne(int id);

}
