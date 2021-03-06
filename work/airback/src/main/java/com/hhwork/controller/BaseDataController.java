package com.hhwork.controller;

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
		int typeId=getInt("id",-1);
		if(typeId!=-1){
			BaseType baseType=baseDataService.getBaseTypeById(typeId);
			modelMap.put("baseType", baseType);
		}
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
		Pagination<BaseData> res=baseDataService.getBaseData(page, this.getParaMap());
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
		int typeId=getInt("basetype",-1);
		modelMap.put("typeId", typeId);
		int id=getInt("id",-1);
		if(id!=-1){
			BaseData baseData=baseDataService.getBaseDataById(id);
			modelMap.put("baseData", baseData);
			modelMap.put("typeId", baseData.getTypeId());
		}
		return "/base/saveBaseDataDialog";
	}
	
	
	@RequestMapping("getAllBaseTypes")
	public void getAllBaseTypes(HttpServletRequest request,
			HttpServletResponse response){
		int article=getInt("article",-1);
		Map<String,Object> params=new HashMap<String,Object>();
		if(article!=-1){
			params.put("article", article);
		}
		outPrint(response,JSONArray.toJSON(baseDataService.getAllBaseTypes(params)));
	}
	
	@RequestMapping("saveBaseData")
	public void saveBaseData(HttpServletResponse response){
		int id=getInt("id",-1);
		String name=getString("name");
		String name_en=getString("name_en");
		String number=getString("number");
		String icon = this.getString("icon");
		String url=getString("url","");
		int typeId=getInt("typeId",-1);
		int parentId = getInt("parentId",0);
		String desc = this.getString("desc");
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
		baseData.setNumber(number);
		baseData.setParentId(parentId);
		baseData.setDesc(desc);
		int ret=baseDataService.saveBaseData(baseData);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
	
	@RequestMapping("deleteBaseData")
	public void deleteBaseData(HttpServletResponse response){
		int id=getInt("id",-1);
		int ret=baseDataService.deleteBaseData(id);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
	
	@RequestMapping("baseDataList")
	public String baseDataList(ModelMap modelMap){
		String basetype = this.getString("basetype");
		BaseType b = 
		this.baseDataService.getBaseTypeById(Integer.parseInt(basetype));
		modelMap.put("basetype", b);
		return "/base/baseDataList";
	}
}
