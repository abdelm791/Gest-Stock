package org.gst.Repository;

import org.gst.model.CommandeFournisseur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CommandeFournisseurRepository extends JpaRepository<CommandeFournisseur,Integer>{
	
	@Query("select cf from CommandeFournisseur cf where cf.id=id")
	public CommandeFournisseur findOne(int id);
	
}
