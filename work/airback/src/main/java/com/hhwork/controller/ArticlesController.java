package com.hhwork.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.d3.d396333.common.util.ResponseUtils;
import com.hhwork.common.Pagination;
import com.hhwork.model.Articles;
import com.hhwork.service.ArticleService;

@Controller
@RequestMapping("/articles/*")
public class ArticlesController extends BaseController {

	@Resource
	protected ArticleService articleService;
	
	@RequestMapping("articleIndex")
	public String articleIndex(ModelMap modelMap){
		return "article/articleIndex";
	}
	
	
	@RequestMapping("list")
	@ResponseBody
	public void list(HttpServletRequest request,
			HttpServletResponse response,Pagination<Articles> page){
		Pagination<Articles> result=articleService.getArticles(page);
		outPrint(response, JSONArray.toJSON(result));
	}
	
	@RequestMapping("saveArticlesDialog")
	public String saveArticlesDialog(ModelMap modelMap){
		return "article/saveArticlesDialog";
	}
	
	@ResponseBody
	@RequestMapping("saves")
	public void saveArticles(@ModelAttribute Articles articles,HttpServletResponse response){
		String content=getString("content");
		if(StringUtils.isBlank(content)){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return ;
		}
		int ret=articleService.saveArticles(articles);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
}
