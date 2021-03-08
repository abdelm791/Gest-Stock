package org.gst.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity

public class LigneCommandeFournisseur {
	@Id
	@GeneratedValue
	private int idLigneCdeFrs;
	
	@ManyToOne
	@JoinColumn(name = "idArticle")
	private Article article;
	
	@ManyToOne
	@JoinColumn(name = "idCommandeFournisseur")
	private CommandeFournisseur commandeFournisseur;

	public int getIdLigneCdeFrs() {
		return idLigneCdeFrs;
	}

	public void setIdLigneCdeFrs(int idLigneCdeFrs) {
		this.idLigneCdeFrs = idLigneCdeFrs;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public CommandeFournisseur getCommandeFournisseur() {
		return commandeFournisseur;
	}

	public void setCommandeFournisseur(CommandeFournisseur commandeFournisseur) {
		this.commandeFournisseur = commandeFournisseur;
	}

	public LigneCommandeFournisseur() {
		super();
		
	}

	
	
}
