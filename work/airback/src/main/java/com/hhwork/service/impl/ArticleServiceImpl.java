package com.hhwork.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.hhwork.common.Constants;
import com.hhwork.common.Pagination;
import com.hhwork.dao.ArticlesDao;
import com.hhwork.model.Articles;
import com.hhwork.service.ArticleService;
import com.hhwork.utils.HTMLHelpers;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

	@Resource
	protected ArticlesDao articlesDao;
	
	@Override
	public Pagination<Articles> getArticles(Pagination<Articles> page) {
		return articlesDao.getArticles(page);
	}

	@Override
	public int saveArticles(Articles article) {
		String preview=article.getContent();
		//去除html标签
		preview=HTMLHelpers.getTextFromHtml(preview);
		if(StringUtils.isNotEmpty(preview))
			preview = preview.length()>100?preview.substring(0, 100):preview;
		article.setPreview(preview);
		article.setCreateTime(new Date());
		article.setCreateMan(Constants.ADMIN);
		if(StringUtils.isBlank(article.getImg())){
			article.setImg("");
		}
		return articlesDao.saveArticles(article);
	}

	@Override
	public Articles getArticleById(int articleId) {
		return articlesDao.getArticleById(articleId);
	}

	@Override
	public int deleteArticles(int id) {
		return articlesDao.deleteArticles(id);
	}

}
