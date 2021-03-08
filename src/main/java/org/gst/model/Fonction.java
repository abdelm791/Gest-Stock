package org.gst.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;



@Entity
public class Fonction {
	@Id
	@GeneratedValue
	private Long idFonction;
	
	private String fonctionName;
	
	@ManyToOne
	@JoinColumn(name="idUtilisateur")
	private User utilisateur;
	
	
	
	public Fonction() {
	
	}

	public Long getIdFonction() {
		return idFonction;
	}

	public void setIdFonction(Long idFonction) {
		this.idFonction = idFonction;
	}

	public String getFonctionName() {
		return fonctionName;
	}

	public void setFonctionName(String fonctionName) {
		this.fonctionName = fonctionName;
	}

	public User getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(User utilisateur) {
		this.utilisateur = utilisateur;
	}

	
	

	

}
