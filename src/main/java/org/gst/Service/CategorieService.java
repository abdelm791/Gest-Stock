package org.gst.Service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.gst.Repository.CategorieRepository;
import org.gst.model.Categorie;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class CategorieService {
private final CategorieRepository categorieRepository;
  	
  	public CategorieService(CategorieRepository categorieRepository) {
  		this.categorieRepository=categorieRepository;
  	}
  	
  	public void saveCategorie(Categorie categorie ) {
  		categorieRepository.save(categorie);
  	}
  	
  	public List<Categorie> showAllCategories(){
  		List<Categorie> categories = new ArrayList<Categorie>();
  		for(Categorie categorie : categorieRepository.findAll()) {
  			categories.add(categorie);
  		}
  		
  		return categories;
  	}
  	
  	public void deleteMyCategorie(Long id) {
  		categorieRepository.deleteById(id);
  	}
  	
  	public Categorie editCategorie(Long id) {
  		return  categorieRepository.findOne(id);
  	}
  	

}
