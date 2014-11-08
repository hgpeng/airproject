package com.hhwork.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.d3.d396333.common.util.ResponseUtils;
import com.hhwork.common.Pagination;
import com.hhwork.model.AppCase;
import com.hhwork.model.Articles;
import com.hhwork.model.BaseData;
import com.hhwork.service.AppCaseService;

@Controller
@RequestMapping("/case/*")
public class CaseController  extends BaseController {
	
	@Autowired
	private AppCaseService appCaseService;
	
	@RequestMapping("list")
	public String menuIndex(){
		return "/case/list";
	}
	
	/**
	 * 获取基础数据
	 * @param request
	 * @param response
	 * @param page
	 */
	@RequestMapping("getCaseData")
	public void getAppCaseData(HttpServletRequest request,
			HttpServletResponse response,Pagination<AppCase> page){
		Pagination<AppCase> res=appCaseService.getAppCase(page);
		outPrint(response, JSONArray.toJSON(res));
	}
	
	@RequestMapping("saveCaseDialog")
	public String saveCaseDialog(ModelMap modelMap){
		return "/case/saveCaseDialog";
	}
	
	@ResponseBody
	@RequestMapping("saves")
	public void saveAppCase(HttpServletResponse response){
		 String name = this.getString("name");
		 String area = this.getString("area");
		 String addr = this.getString("addr");
		 String buildtime = this.getString("buildtime");
		 int basedataId = Integer.parseInt(this.getString("basedataId"));
		 String content = this.getString("content");
		 String name_en = this.getString("name_en");
		 AppCase app = new AppCase();	 
		if(StringUtils.isBlank(name)){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return ;
		}
		app.setAddr(addr);
		app.setArea(area);
		app.setName(name);
		app.setBuildtime(buildtime);
		app.setContent(content);
		app.setBasedataId(basedataId);
		app.setName_en(name_en);
		int ret=appCaseService.saveAppCase(app);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
	
	@RequestMapping("uploadphoto")
	public String uploadphoto(ModelMap modelMap){
		String caseid = this.getString("id");
		modelMap.put("caseid", caseid);
		return "/case/uploadphoto";
	}
	
}
