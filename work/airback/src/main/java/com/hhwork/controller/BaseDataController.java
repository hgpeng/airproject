package com.hhwork.controller;

import java.util.List;

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
import com.hhwork.model.BaseData;
import com.hhwork.model.BaseType;
import com.hhwork.service.BaseDataService;

@Controller
@RequestMapping("/baseData/*")
public class BaseDataController extends BaseController {

	@Resource
	protected BaseDataService baseDataService;
	
	
	@RequestMapping("baseTypeIndex")
	public String baseTypeIndex(ModelMap modelMap){
		return "/base/baseTypeIndex";
	}
	
	@RequestMapping("getBaseTypeData")
	public void getBaseTypeData(HttpServletRequest request,
			HttpServletResponse response,Pagination<BaseType> page){
		Pagination<BaseType> res=baseDataService.getBaseType(page, null);
		outPrint(response,JSONArray.toJSON(res) );
	}
	
	@RequestMapping("saveBaseTypeDialog")
	public String saveBaseTypeDialog(ModelMap modelMap){
		return "/base/saveBaseTypeDialog";
	}

	@ResponseBody
	@RequestMapping("saveBaseType")
	public void saveBaseType(@ModelAttribute BaseType baseType,HttpServletResponse response){
		if(StringUtils.isBlank(baseType.getName())){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return ;
		}
		int ret=baseDataService.saveBaseType(baseType);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
	
	
	@RequestMapping("deleteBaseType")
	public void deleteBaseType(HttpServletResponse response){
		int id=getInt("id",-1);
		if(id==-1){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return ;
		}
		int ret=baseDataService.deleteBaseType(id);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
	
	@RequestMapping("baseDataIndex")
	public String baseDataIndex(ModelMap modelMap){
		return "/base/baseDataIndex";
	}
	
	
	/**
	 * 获取基础数据
	 * @param request
	 * @param response
	 * @param page
	 */
	@RequestMapping("getBaseData")
	public void getBaseData(HttpServletRequest request,
			HttpServletResponse response,Pagination<BaseData> page){
		Pagination<BaseData> res=baseDataService.getBaseData(page, null);
		outPrint(response, JSONArray.toJSON(res));
	}
	
	/**
	 * 获取基础数据
	 * @param request
	 * @param response
	 * @param page
	 */
	@RequestMapping("getAllBaseData")
	public void getAllBaseData(HttpServletRequest request,
			HttpServletResponse response){
		List<BaseData> res=baseDataService.getAllBaseData(this.getParaMap());
		outPrint(response, JSONArray.toJSON(res));
	}
	
	@RequestMapping("saveBaseDataDialog")
	public String saveBaseDataDialog(ModelMap modelMap){
		return "/base/saveBaseDataDialog";
	}
	
	
	@RequestMapping("getAllBaseTypes")
	public void getAllBaseTypes(HttpServletRequest request,
			HttpServletResponse response){
		outPrint(response,JSONArray.toJSON(baseDataService.getAllBaseTypes()));
	}
	
	@RequestMapping("saveBaseData")
	public void saveBaseData(HttpServletResponse response){
		int id=getInt("id",-1);
		String name=getString("name");
		String name_en=getString("name_en");
		String icon = this.getString("icon");
		String url=getString("url","");
		int typeId=getInt("typeId",-1);
		/**
		 * 名称不能为空
		 */
		if(StringUtils.isBlank(name)){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return ;
		}
		if(typeId==-1){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}
		BaseData baseData=new BaseData();
		baseData.setId(id);
		baseData.setName(name);
		baseData.setUrl(url);
		baseData.setTypeId(typeId);
		baseData.setIcon(icon);
		baseData.setName_en(name_en);
		int ret=baseDataService.saveBaseData(baseData);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
}
