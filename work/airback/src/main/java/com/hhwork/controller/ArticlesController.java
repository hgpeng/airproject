package com.hhwork.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.hhwork.model.BaseData;
import com.hhwork.model.BaseType;
import com.hhwork.service.ArticleService;
import com.hhwork.service.BaseDataService;

@Controller
@RequestMapping("/articles/*")
public class ArticlesController extends BaseController {

	@Resource
	protected ArticleService articleService;
	
	@Resource
	protected BaseDataService baseDataService;
	
	@RequestMapping("articleIndex")
	public String articleIndex(ModelMap modelMap){
		int typeId=getInt("basedata",-1);
		if(typeId!=-1){
			BaseType baseType=baseDataService.getBaseTypeById(typeId);
			modelMap.put("baseType", baseType);
		}
		return "article/articleIndex";
	}
	
	
	@RequestMapping("list")
	@ResponseBody
	public void list(HttpServletRequest request,
			HttpServletResponse response,Pagination<Articles> page){
		int baseTypeId=getInt("baseTypeId",-1);
		Map<String,Object> query=new HashMap<String,Object>();
		if(baseTypeId!=-1){
			query.put("baseTypeId", baseTypeId);
		}
		Pagination<Articles> result=articleService.getArticles(page,query);
		outPrint(response, JSONArray.toJSON(result));
	}
	
	@RequestMapping("saveArticlesDialog")
	public String saveArticlesDialog(ModelMap modelMap){
		int typeId=getInt("typeId",-1);
		List<BaseData> bdlist = 
				baseDataService.getBaseDataByBaseTypeId(typeId);
		modelMap.put("bdlist", bdlist);
		modelMap.put("typeId", typeId);
		int articleId=getInt("articleId",-1);
		if(articleId!=-1){
			Articles article=articleService.getArticleById(articleId);
			modelMap.put("article",article);
			modelMap.put("typeId", article.getType());
			String imgPaths=article.getImg();
			if(StringUtils.isNotBlank(imgPaths)){
				modelMap.put("imgList", imgPaths.split(","));
			}
		}
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
	
	@RequestMapping("deleteArticles")
	public void deleteArticles(HttpServletResponse response){
		int id=getInt("articleId",-1);
		if(id==-1){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return ;
		}
		int ret=articleService.deleteArticles(id);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
}
