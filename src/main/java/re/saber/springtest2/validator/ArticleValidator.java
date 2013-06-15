package re.saber.springtest2.validator;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;

import re.saber.springtest2.model.Article;

public class ArticleValidator {

	public void validate(Article article, Errors errors) {
		if (!StringUtils.hasLength(article.getAuthor()))
			errors.rejectValue("author", "required", "required");
		else if (!StringUtils.hasLength(article.getSubject()))
			errors.rejectValue("subject", "required", "required");
	}

}
