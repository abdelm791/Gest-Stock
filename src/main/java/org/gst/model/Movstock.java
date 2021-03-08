package org.gst.model;

import java.io.Serializable;
import java.math.BigDecimal;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity


public class Movstock implements Serializable {

	private static final long serialVersionUID = 1L;

public static final int ENTREE = 1;
	
	public static final int SORTIE = 2;

	@Id
	@GeneratedValue
	private Long idMvtStk;
	
	
	private Date dateMvt;
	@Temporal(TemporalType.DATE)
	public Date getDateMvt() {
		return dateMvt;
	}

	public void setDateMvt(Date dateMvt) {
		this.dateMvt = dateMvt;
	}
	
	private BigDecimal quantite;
	
	private int typeMvt;
	
	private transient Long idArticle;
	
	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name = "idArticle")
	private Article article;

	public Long getIdMvtStk() {
		return idMvtStk;
	}

	public void setIdMvtStk(Long id) {
		this.idMvtStk = id;
	}
	

	public BigDecimal getQuantite() {
		return quantite;
	}

	public void setQuantite(BigDecimal quantite) {
		this.quantite = quantite;
	}

	public int getTypeMvt() {
		return typeMvt;
	}

	public void setTypeMvt(int typeMvt) {
		this.typeMvt = typeMvt;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Long getIdArticle() {
		return idArticle;
	}

	public void setIdArticle(Long idArticle) {
		this.idArticle = idArticle;
	}
	

}
