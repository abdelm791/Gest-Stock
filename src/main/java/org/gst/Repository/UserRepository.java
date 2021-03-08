package org.gst.Repository;


import org.gst.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;




public interface UserRepository extends CrudRepository<User, Integer> {	
	
	public User findByUsernameAndPassword(String username, String password);
	
	@Query("select p from User p where p.id=id")
	
	public User findOne(int id);

	
}
