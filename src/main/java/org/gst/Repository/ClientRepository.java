package org.gst.Repository;

import org.gst.model.Client;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface ClientRepository extends JpaRepository<Client, Integer> {

	@Query("select c from Client c where c.id=id")
	public Client findOne(Integer id);

}
