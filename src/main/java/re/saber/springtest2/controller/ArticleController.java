package re.saber.springtest2.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import re.saber.springtest2.mapper.BoardMapper;
import re.saber.springtest2.model.Article;
import re.saber.springtest2.validator.ArticleValidator;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("article")
public class ArticleController {

	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	@Autowired
	private BoardMapper boardMapper;

	@ResponseStatus(value = HttpStatus.NOT_FOUND)
	public final class ResourceNotFoundException extends RuntimeException {

	}

	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id", "created");
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(@RequestParam(value = "count", required = false, defaultValue = "30") int count, Model model) {
		if (count < 30)
			count = 30;
		else if (count > 100)
			count = 100;
		List<Article> articles = boardMapper.getArticleList(0, count);

		model.addAttribute("articles", articles);
		model.addAttribute("count", count);

		return "list";
	}

	@RequestMapping(value = "/{articleId:\\d+}", method = RequestMethod.GET)
	public String view(@PathVariable int articleId, Model model) {
		Article article = boardMapper.getArticle(articleId);

		if (article == null)
			throw new ResourceNotFoundException();

		model.addAttribute("article", article);

		return "view";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String initWriteForm(Model model) {
		model.addAttribute("article", new Article());
		return "write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String processWriteForm(Article article, BindingResult result, SessionStatus status) {
		new ArticleValidator().validate(article, result);
		if (result.hasErrors())
			return "write";

		boardMapper.insertArticle(article);
		status.setComplete();

		return "redirect:/" + article.getId();
	}
	
	@RequestMapping(value = "/{articleId:\\d+}/edit", method = RequestMethod.GET)
	public String initEditForm(@PathVariable int articleId, Model model) {
		Article article = boardMapper.getArticle(articleId);

		if (article == null)
			throw new ResourceNotFoundException();

		model.addAttribute("article", article);
		
		return "write";
	}
	
	@RequestMapping(value = "/{articleId:\\d+}/edit", method = RequestMethod.POST)
	public String processEditForm(Article article, BindingResult result, SessionStatus status) {
		new ArticleValidator().validate(article, result);
		if (result.hasErrors())
			return "write";

		boardMapper.updateArticle(article);
		status.setComplete();

		return "redirect:/" + article.getId();
	}
	
	@RequestMapping(value = "/{articleId:\\d+}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable int articleId) {
		Article article = boardMapper.getArticle(articleId);

		if (article == null)
			throw new ResourceNotFoundException();
		
		boardMapper.deleteArticle(articleId);
		
		return "redirect:/";
	}

}