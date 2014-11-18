package com.hhwork.service;

import com.hhwork.common.Pagination;
import com.hhwork.model.Articles;

public interface ArticleService {

	public Pagination<Articles> getArticles(Pagination<Articles> page);
	
	/**
	 * 保存文章
	 * @param article
	 * @return
	 */
	public int saveArticles(Articles article);
}
