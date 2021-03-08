package org.gst.controllers;

import javax.servlet.http.HttpServletRequest;

import org.gst.Service.ArticleService;
import org.gst.Service.MovstockService;

import org.gst.model.Movstock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MovstockController {
	
	@Autowired
	MovstockService movstockService;
	
	@Autowired
	ArticleService articleService;
	
	
	@RequestMapping(value = "/movstock")
	public String blankHome(HttpServletRequest request) {
	request.setAttribute("mode", "MODE_MOVSTOCK");
		return "movstock";
	}

	@RequestMapping("/registerMovstock")
	public String registration(HttpServletRequest request) {
		request.setAttribute("articles", articleService.showAllArticles());
		request.setAttribute("mode", "MODE_REGISTER_MOVSTOCK");
		return "movstock";
	}
	
	@PostMapping("/save-movstock")
	public String registerMovStock(@ModelAttribute Movstock movstock, BindingResult bindingResult, HttpServletRequest request) {
		movstockService.saveMovStock(movstock);
		request.setAttribute("mode", "MODE_MOVSTOCK");
		return "movstock";
	}
	
	@GetMapping("/show-movstocks")
	public String showAllMovStocks(HttpServletRequest request) {
		request.setAttribute("movstocks", movstockService.showAllMovStocks());
		request.setAttribute("mode", "MODE_ALL_MOVSTOCKS");
		return "movstock";
	}
	
	
	@RequestMapping("/delete-movstock")
	public String deletMovStock(@RequestParam Long id, HttpServletRequest request) {
		movstockService.deleteMovStock(id);
		request.setAttribute("mvts", movstockService.showAllMovStocks());
		request.setAttribute("mode", "MODE_ALL_MOVSTOCKS");
		return "movstock";
	}
	
	@RequestMapping("/edit-movstock")
	public String editMovStock(@RequestParam Long id,HttpServletRequest request) {
		request.setAttribute("movstock", movstockService.editMovStock(id));
		request.setAttribute("articles", articleService.showAllArticles());
		request.setAttribute("mode", "MODE_UPDATE_MOVSTOCK");
		return "movstock";
  	
	}
	
	

}
