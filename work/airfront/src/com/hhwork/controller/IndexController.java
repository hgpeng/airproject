package com.hhwork.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hhwork.model.AppCase;
import com.hhwork.model.Articles;
import com.hhwork.model.BaseData;
import com.hhwork.model.CasePhoto;
import com.hhwork.model.Presentation;
import com.hhwork.util.BaseConstants;

@Controller
public class IndexController extends BaseController {
	@RequestMapping({"index"})
	public String index(ModelMap model) { 
		return "mainnew"; 
    }
	
	@RequestMapping({"product"})
	public String product(ModelMap model) { 
		return "product"; 
    }
	
	@RequestMapping({"productcenter"})
	public String productcenter(ModelMap model) { 
		Map<String,Object> param = new HashMap<String,Object>();
		//查产品系列
		param.put("type", BaseConstants.PRODUCTSERIS);
		List<BaseData> bdlist 
				= this.queryExecutor.execQuery("com.hhwork.dao.BaseDataDao.select", param, BaseData.class);
		model.put("bdlist", bdlist);
		return "productcenter"; 
    }
	
	@RequestMapping({"solution"})
	public String solution(ModelMap model) { 
		int sid = this.getInt("sid");
		BaseData bd = null;
		Articles art = null;
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("type", BaseConstants.SOLUTION);
		List<BaseData> bdlist = 
		this.queryExecutor.execQuery("com.hhwork.dao.BaseDataDao.select", param, BaseData.class);
		model.put("bdlist", bdlist);
		if(sid==0&&bdlist.size()>0){
			sid = bdlist.get(0).getId();		
		}
		param.put("type", sid);
		List<Articles> adlist = 
				this.queryExecutor.execQuery("com.hhwork.dao.BaseDataDao.selectArticle", param, Articles.class);
		if(adlist.size()>0) art = adlist.get(0);
		model.put("art", art);
		return "solution"; 
    }
	
	@RequestMapping({"download"})
	public String download(ModelMap model) { 
		
		return "download"; 
    }
	
	@RequestMapping({"online"})
	public String online(ModelMap model) {
		
		return "online"; 
    }
	
	@RequestMapping({"about"})
	public String about(ModelMap model) { 
		model.put("page", "other");
		model.put("pagename", "about");
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("basetype", BaseConstants.ABOUT);
		List<Articles> adlist = 
				this.queryExecutor.execQuery("com.hhwork.dao.BaseDataDao.selectArticle", param, Articles.class);
		model.put("adlist", adlist);
		return "about"; 
    }
	
	@RequestMapping({"contact"})
	public String contact(ModelMap model) { 
		model.put("page", "other");
		model.put("pagename", "contact");
		return "contact"; 
    }
	
	@RequestMapping({"news"})
	public String news(ModelMap model) {
		String type = this.getString("type");
		model.put("page", "other");
		model.put("pagename", "news");
		model.put("type", type);
		return "news"; 
    }
	
	@RequestMapping({"video"})
	public String video(ModelMap model) {
		model.put("page", "other");
		model.put("pagename", "video");
		model.put("type", 2);
		return "news"; 
    }
	
	@RequestMapping({"greenService"})
	public String greenService(ModelMap model) { 
		Map<String,Object> param = new HashMap<String,Object>();
		//查产品系列
		param.put("type", BaseConstants.GREENSERVICE);
		List<BaseData> bdlist 
				= this.queryExecutor.execQuery("com.hhwork.dao.BaseDataDao.select", param, BaseData.class);
		model.put("bdlist", bdlist);
		
		//查工程系列
		param.put("type", BaseConstants.CASEENVIRONMENT);
		List<BaseData> celist 
				= this.queryExecutor.execQuery("com.hhwork.dao.BaseDataDao.select", param, BaseData.class);
		model.put("celist", celist);
		model.put("page", "green");		
		return "greenService"; 
    }
	
	@RequestMapping(value="caselist")
	public String caselist(ModelMap model) { 
		Map<String,Object> param = new HashMap<String,Object>();
		//查工程系列
		param.put("type", BaseConstants.CASEENVIRONMENT);
		List<BaseData> celist 
				= this.queryExecutor.execQuery("com.hhwork.dao.BaseDataDao.select", param, BaseData.class);
		model.put("celist", celist);
		model.put("page", "case");
		List<AppCase> aclist 
			= this.queryExecutor.execQuery("com.hhwork.dao.CaseDao.select", null, AppCase.class);
		model.put("aclist", aclist);
		return "caselistnew";
    }
	
	@RequestMapping(value="caseshow")
	public String caseshow(ModelMap model) { 
		int id = this.getInt("id");
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("id", id);
		List<AppCase> bdlist = 
		this.queryExecutor.execQuery("com.hhwork.dao.CaseDao.select", param, AppCase.class);
		
		if(bdlist.size()>0){
			List<CasePhoto> cplist = 
					this.queryExecutor.execQuery("com.hhwork.dao.CaseDao.select", param, CasePhoto.class);
			model.put("data", bdlist.get(0));
			model.put("cplist", cplist);		
		}else{
			
		}
		return "caseshow";
    }
	
	@RequestMapping(value="caseproduct")
	public String productshow(ModelMap model) { 
		
		return "caseproduct";
    }
	
	@RequestMapping(value="viewarticle")
	public String viewarticle(ModelMap model) { 
		String type = this.getString("type");
		String id = this.getString("id");
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("id", id);
		param.put("type", type);
		List<Articles> adlist = 
				this.queryExecutor.execQuery("com.hhwork.dao.BaseDataDao.selectArticle", param, Articles.class);
		if(adlist.size()>0)
			model.put("data", adlist.get(0));		
			
		return "viewarticle";
    }
	
	@RequestMapping(value="productDetail")
	public String productDetail(ModelMap model) { 
		String pid = this.getString("pid");
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("productId", pid);
		List<Presentation> plist = 
		this.queryExecutor.execQuery("com.hhwork.dao.ProductDao.selectPresention", param, Presentation.class);
		model.put("prelist", plist);
		model.put("prelength", plist.size());
		return "productDetail";
    }
}
