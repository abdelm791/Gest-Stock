package org.gst.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class LigneVente {
	
	@Id
	@GeneratedValue
	private Long idLigneVente;
	
	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name = "idArticle")
	private Article article;
	
	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name = "vente")
	private Vente vente;

	public Long getIdLigneVente() {
		return idLigneVente;
	}

	public void setIdLigneVente(Long id) {
		this.idLigneVente = id;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}
}
