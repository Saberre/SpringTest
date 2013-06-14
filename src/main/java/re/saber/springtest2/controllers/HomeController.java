package re.saber.springtest2.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import re.saber.springtest2.models.Article;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model) {
		List<Article> articles = new ArrayList<Article>();
		
		Article article = new Article();
		article.setId(3);
		article.setSubject("test subject");
		article.setAuthor("test");
		article.setCreated(new Date());
		articles.add(article);
		
		model.addAttribute("articles", articles);
		return "list";
	}
	
	@RequestMapping(value = "/{articleId:\\d+}", method = RequestMethod.GET)
	public String view(@PathVariable("articleId") Integer articleId, Model model) {
		return "view";
	}
	
	@RequestMapping(value = "/write")
	public String write(Model model) {
		return "write";
	}
	
}
