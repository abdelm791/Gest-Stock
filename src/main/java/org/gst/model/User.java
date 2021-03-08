package org.gst.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;




@Entity


public class User {
	
	@Id
	@GeneratedValue
	private int id;
	private String username;
	private String firstname;
	private String lastname;
	private int age;
	private String password;
	
	private transient Long idFonction;
	
	@OneToMany(cascade = {CascadeType.ALL},mappedBy = "utilisateur")
	List<Fonction> fonctions;
	
	public List<Fonction> getFonctions() {
		return fonctions;
	}



	public void setFonctions(List<Fonction> fonctions) {
		this.fonctions = fonctions;
	}



	public User() {
		
	}



	public User(int id, String username, String firstname, String lastname, int age, String password) {
		super();
		this.id = id;
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.age = age;
		this.password = password;
	}



	public User(String username, String firstname, String lastname, int age, String password) {
		super();
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.age = age;
		this.password = password;
	}
	



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", firstname=" + firstname + ", lastname=" + lastname
				+ ", age=" + age + ", password=" + password + "]";
	}



	public Long getIdFonction() {
		return idFonction;
	}



	public void setIdFonction(Long idFonction) {
		this.idFonction = idFonction;
	}
	
	
	
	

}
