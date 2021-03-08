package org.gst.model;




import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
public class CommandeClient {

	@Id
	@GeneratedValue
	private Long idCommandeClient;
	
	private String code;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="date_commande")
	private Date dateCommande;
	
	private transient Integer idClient;
	
	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name = "idClient")
	private Client client;
	
	@OneToMany(mappedBy = "commandeClient")
	private List<LigneCommandeClient> ligneCommandeClients;

	

	

	public CommandeClient(String code, Date dateCommande, Client client) {
		super();
		this.code = code;
		this.dateCommande = dateCommande;
		this.client = client;
	}

	public Long getIdCommandeClient() {
		return idCommandeClient;
	}

	public void setIdCommandeClient(Long idCommandeClient) {
		this.idCommandeClient = idCommandeClient;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getDateCommande() {
		return dateCommande;
	}

	public void setDateCommande(Date dateCommande) {
		this.dateCommande = dateCommande;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public List<LigneCommandeClient> getLigneCommandeClients() {
		return ligneCommandeClients;
	}

	public LigneCommandeClient setLigneCommandeClients(List<LigneCommandeClient> ligneCdeClt) {
		return  (LigneCommandeClient) ligneCdeClt;
	}

	public CommandeClient(String code, Date dateCommande, Client client,
			List<LigneCommandeClient> ligneCommandeClients) {
		super();
		this.code = code;
		this.dateCommande = dateCommande;
		this.client = client;
		this.ligneCommandeClients = ligneCommandeClients;
	}

	public CommandeClient() {
		super();
		
	}

	public Integer getIdClient() {
		return idClient;
	}

	public void setIdClient(Integer idClient) {
		this.idClient = idClient;
	}



	}


