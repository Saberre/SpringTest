package re.saber.springtest2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import re.saber.springtest2.model.Article;
import re.saber.springtest2.model.Comment;

public interface BoardMapper {

	List<Article> getArticleList(@Param("offset") int offset, @Param("count") int count);
	
	int getArticleCount();
	
	Article getArticle(@Param("id") int id);
	
	void insertArticle(Article article);
	
	void updateArticle(Article article);
	
	void deleteArticle(@Param("id") int id);
	
	List<Comment> getCommentsForArticle(@Param("id") int id);
	
	Comment getCommentOfArticle(@Param("id") int id, @Param("article_id") int articleId);
	
	void insertComment(Comment comment);
	
	void deleteComment(@Param("id") int id);

}
