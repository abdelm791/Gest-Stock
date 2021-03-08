package org.gst.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;



@Entity
public class Categorie implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long idCategorie;
	
	private String codeCategorie;
	
	private String designation;
	
	@OneToMany(mappedBy = "categorie")
	private List<Article> articles;
	
	

	public Categorie(String codeCategorie, String designation) {
		super();
		this.codeCategorie = codeCategorie;
		this.designation = designation;
	}

	public Categorie() {
		;
		
	}

	public Categorie(String codeCategorie, String designation, List<Article> articles) {
		super();
		this.codeCategorie = codeCategorie;
		this.designation = designation;
		this.articles = articles;
	}

	public Long getIdCategorie() {
		return idCategorie;
	}

	public void setIdCategorie(Long idCategorie) {
		this.idCategorie = idCategorie;
	}

	public String getCodeCategorie() {
		return codeCategorie;
	}

	public void setCodeCategorie(String codeCategorie) {
		this.codeCategorie = codeCategorie;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	
	
}
