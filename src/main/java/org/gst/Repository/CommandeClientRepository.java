package org.gst.Repository;






import org.gst.model.CommandeClient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CommandeClientRepository extends JpaRepository<CommandeClient, Integer> {
	@Query("select cc from CommandeClient cc where cc.id=id")
	public CommandeClient findOne(Integer id);
	

}
