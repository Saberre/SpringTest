package re.saber.springtest2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import re.saber.springtest2.models.Article;

public interface BoardMapper {

	List<Article> getArticleList(@Param("offset") int offset, @Param("count") int count);
	
	Article getArticle(@Param("id") int id);

}
