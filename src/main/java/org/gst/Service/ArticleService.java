package org.gst.Service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.gst.Repository.ArticleRepository;
import org.gst.model.Article;

import org.springframework.stereotype.Service;

@Service
@Transactional
public class ArticleService {
	
private final ArticleRepository articleRepository;
	
	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository=articleRepository;
	}
	
	public void saveArticle(Article article ) {
		articleRepository.save(article);
	}
	
	public List<Article> showAllArticles(){
		List<Article> articles = new ArrayList<Article>();
		for(Article article : articleRepository.findAll()) {
			articles.add(article);
		}
		
		return articles;
	}
	
	public void deleteArticle(Long id) {
		articleRepository.deleteById(id);
	}
	
	public Article editArticle(Long id) {
		return  articleRepository.findOne(id);
	}
	
	

}
