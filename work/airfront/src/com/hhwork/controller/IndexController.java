package com.hhwork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hhwork.model.Articles;
import com.hhwork.model.BaseData;

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
		param.put("typeid", "5");
		return "productcenter"; 
    }
	
	@RequestMapping({"solution"})
	public String solution(ModelMap model) { 
		int sid = this.getInt("sid");
		Articles art = null;
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("type", 4);
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
		return "about"; 
    }
	
	@RequestMapping({"contact"})
	public String contact(ModelMap model) { 
		return "contact"; 
    }
	
	@RequestMapping({"news"})
	public String news(ModelMap model) { 
		return "news"; 
    }
	
	@RequestMapping({"greenService"})
	public String greenService(ModelMap model) { 
		return "greenService"; 
    }
	
	@RequestMapping(value="caselist")
	public String caselist(ModelMap model) { 
		
		return "caselistnew";
    }
	
	@RequestMapping(value="caseshow")
	public String caseshow(ModelMap model) { 
		
		return "caseshow";
    }
	
	@RequestMapping(value="caseproduct")
	public String productshow(ModelMap model) { 
		
		return "caseproduct";
    }
}
