package re.saber.springtest2.validator;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;

import re.saber.springtest2.model.Comment;

public class CommentValidator {

	public void validate(Comment comment, Errors errors) {
		if (!StringUtils.hasLength(comment.getAuthor()))
			errors.rejectValue("author", "required", "required");
	}

}
