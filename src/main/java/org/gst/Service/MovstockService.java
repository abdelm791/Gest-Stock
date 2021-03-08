package org.gst.Service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.gst.Repository.ArticleRepository;

import org.gst.Repository.MovstockRepository;

import org.gst.model.Movstock;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class MovstockService {
	
private final MovstockRepository movstockRepository;
private final ArticleRepository articleRepository;

	
	public MovstockService(MovstockRepository movstockRepository,ArticleRepository articleRepository) {
		this.movstockRepository=movstockRepository;
		this.articleRepository=articleRepository;
	}
	
public Movstock saveMovStock(Movstock mvt) {
	mvt.setArticle(articleRepository.findOne(mvt.getIdArticle()));
	return movstockRepository.save(mvt);	
		
	}

	

	public List<Movstock> showAllMovStocks() {
		
		List<Movstock> movstocks = new ArrayList<Movstock>();
		for(Movstock movstock : movstockRepository.findAll()) {
			movstocks.add(movstock);
		}
		return movstocks;
	}

	public void deleteMovStock(Long id) {
		movstockRepository.deleteById(id);
		
	}

public Movstock editMovStock(Long id) {
		
		return  movstockRepository.findOne(id);
	}
	
	

}
