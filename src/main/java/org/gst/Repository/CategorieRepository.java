package org.gst.Repository;

import org.gst.model.Categorie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CategorieRepository extends JpaRepository<Categorie, Long> {

	@Query("select c from Categorie c where c.id=id")
	public Categorie findOne(Long id);

}
