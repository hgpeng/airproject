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

	/**
	 * 根据id获取文章
	 * @param articleId
	 * @return
	 */
	public Articles getArticleById(int articleId);
	
	/**
	 * 删除文章
	 * @param id
	 * @return
	 */
	public int deleteArticles(int id);
}
