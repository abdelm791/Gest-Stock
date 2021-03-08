package org.gst;

import java.math.BigDecimal;
import java.util.Date;

import org.gst.Repository.ArticleRepository;
import org.gst.Repository.CategorieRepository;
import org.gst.Repository.ClientRepository;
import org.gst.Repository.CommandeClientRepository;
import org.gst.model.Article;
import org.gst.model.Categorie;
import org.gst.model.Client;
import org.gst.model.CommandeClient;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class GestStock5Application {

	public static void main(String[] args) {
		ApplicationContext ctx=	SpringApplication.run(GestStock5Application.class, args);
		ClientRepository ClientDao=ctx.getBean(ClientRepository.class);
		CommandeClientRepository commcltDao=ctx.getBean(CommandeClientRepository.class);
		ArticleRepository produitDao=ctx.getBean(ArticleRepository.class);
		CategorieRepository categorieDao=ctx.getBean(CategorieRepository.class);
		Categorie Smartphone=new Categorie("SM","Smartphones");
		
		
		Client client=new Client("Abdou","Abdelm","23350K.Tadla","a.chajia79@yahoo.fr");
		Article A=new Article("ART28","Galaxy A50",new BigDecimal(2300),new BigDecimal(20),new BigDecimal(3000),Smartphone);
		ClientDao.save(client);
	//	categorieDao.save(Smartphone);
		//produitDao.save(A);
		//CommandeClient cm11=new CommandeClient("comm11",new Date(25-01-2019),client);
		//commcltDao.save(cm11);
	}

}
