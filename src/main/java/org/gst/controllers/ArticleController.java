package org.gst.controllers;

import javax.servlet.http.HttpServletRequest;

import org.gst.Service.ArticleService;

import org.gst.model.Article;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ArticleController {
	
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping(value = "/article")
	public String ArticleHome(HttpServletRequest request) {
	request.setAttribute("mode", "MODE_ARTICLE");
		return "article";
	}

	@RequestMapping("/registerArticle")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER_ARTICLE");
		return "article";
	}
	
	@PostMapping("/save-article")
	public String registerClient(@ModelAttribute Article article, BindingResult bindingResult, HttpServletRequest request) {
		articleService.saveArticle(article);
		request.setAttribute("mode", "MODE_ARTICLE");
		return "article";
	}
	
	@GetMapping("/show-articles")
	public String showAllArticles(HttpServletRequest request) {
		request.setAttribute("articles", articleService.showAllArticles());
		request.setAttribute("mode", "ALL_ARTICLES");
		return "article";
	}
	
	
	@RequestMapping("/delete-article")
	public String deleteArticle(@RequestParam Long id, HttpServletRequest request) {
		articleService.deleteArticle(id);
		request.setAttribute("articles", articleService.showAllArticles());
		request.setAttribute("mode", "ALL_ARTICLES");
		return "article";
	}
	
	@RequestMapping("/edit-article")
	public String editArticle(@RequestParam Long id,HttpServletRequest request) {
		request.setAttribute("article", articleService.editArticle(id));
		request.setAttribute("mode", "MODE_UPDATE_ARTICLE");
		return "article";
	}

}
