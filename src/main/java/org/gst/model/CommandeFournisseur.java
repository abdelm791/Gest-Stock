package org.gst.model;



import java.io.Serializable;
import java.sql.Date;
import java.util.Collection;


import javax.persistence.CascadeType;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
public class CommandeFournisseur implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Id
	@GeneratedValue
	private int idCommandeFournisseur;
	
	
	private Date dateCommande;
	
	@Temporal(TemporalType.DATE)
	public Date getDateCommande() {
		return dateCommande;
	}

	public void setDateCommande(Date dateCommande) {
		this.dateCommande = dateCommande;
	}
	
	private transient int idFournisseur;
	

	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name = "idFournisseur")
	private Fournisseur fournisseur;
	
	@OneToMany(mappedBy = "commandeFournisseur")
	private Collection<LigneCommandeFournisseur> ligneCommandeFournisseurs;

	public int getIdCommandeFournisseur() {
		return idCommandeFournisseur;
	}

	public void setIdCommandeFournisseur(int idCommandeFournisseur) {
		this.idCommandeFournisseur = idCommandeFournisseur;
	}
	
	

	public Fournisseur getFournisseur() {
		return fournisseur;
	}

	public void setFournisseur(Fournisseur fournisseur) {
		this.fournisseur = fournisseur;
	}

	public Collection<LigneCommandeFournisseur> getLigneCommandeFournisseurs() {
		return ligneCommandeFournisseurs;
	}

	public void setLigneCommandeFournisseurs(Collection<LigneCommandeFournisseur> ligneCommandeFournisseurs) {
		this.ligneCommandeFournisseurs = ligneCommandeFournisseurs;
	}

	public CommandeFournisseur(Date dateCommande, Fournisseur fournisseur,
			Collection<LigneCommandeFournisseur> ligneCommandeFournisseurs) {
		super();
		this.dateCommande = dateCommande;
		this.fournisseur = fournisseur;
		this.ligneCommandeFournisseurs = ligneCommandeFournisseurs;
	}

	public CommandeFournisseur() {
		super();
		
	}

	public int getIdFournisseur() {
		return idFournisseur;
	}

	public void setIdFournisseur(int idFournisseur) {
		this.idFournisseur = idFournisseur;
	}


	

}
