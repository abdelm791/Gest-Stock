package org.gst.Repository;

import org.gst.model.Movstock;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MovstockRepository extends JpaRepository<Movstock, Long> {

	@Query("select mv from Movstock mv where mv.id=id")
	public Movstock findOne(Long id);

}
