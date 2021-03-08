package org.gst.model;

import java.io.Serializable;
import java.util.Collection;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
public class Vente implements Serializable {


	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long idVente;
	
	private String code;
	
	
	private Date dateVente;
	
	@Temporal(TemporalType.DATE)
	public Date getDateVente() {
		return dateVente;
	}

	public void setDateVente(Date dateVente) {
		this.dateVente = dateVente;
	}

	
	@OneToMany(mappedBy = "vente")
	private Collection<LigneVente> ligneVentes;

	public Long getIdVente() {
		return idVente;
	}

	public void setIdVente(Long id) {
		this.idVente = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Collection<LigneVente> getLigneVentes() {
		return ligneVentes;
	}

	public void setLigneVentes(Collection<LigneVente> ligneVentes) {
		this.ligneVentes = ligneVentes;
	}

	
	
	
}
