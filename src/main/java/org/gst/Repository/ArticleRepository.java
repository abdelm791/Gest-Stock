package org.gst.Repository;

import org.gst.model.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ArticleRepository extends JpaRepository<Article, Long> {
	@Query("select a from Article a where a.id=id")
	public Article findOne(Long id);

}
