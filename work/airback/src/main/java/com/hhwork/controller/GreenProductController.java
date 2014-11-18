package com.hhwork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.hhwork.common.Pagination;
import com.hhwork.model.BaseData;
import com.hhwork.service.BaseDataService;

@Controller
@RequestMapping("/greenproduct/*")
public class GreenProductController extends BaseController{
	
	@Resource
	protected BaseDataService baseDataService;
	
	@RequestMapping("list")
	public String list(ModelMap modelMap){
		
		
		return "/greenproduct/list";
	}
	
	@RequestMapping("add")
	public String add(ModelMap modelMap){
		
		int id=getInt("id",-1);
		if(id!=-1){
			BaseData baseData=baseDataService.getBaseDataById(id);
			modelMap.put("baseData", baseData);
		}
		modelMap.put("typeId", 12);
		return "/greenproduct/add";
	}
	/**
	 * 获取基础数据
	 * @param request
	 * @param response
	 * @param page
	 */
	@RequestMapping("getGreenProduct")
	public void getGreenProduct(HttpServletRequest request,
			HttpServletResponse response,Pagination<BaseData> page){
		Map<String,Object> param = this.getParaMap();
		param.put("type", 12);
		param.put("leaf", "yes");
		Pagination<BaseData> res=baseDataService.getGreenProduct(page, param);
		outPrint(response, JSONArray.toJSON(res));
	}
	
	@RequestMapping("getAllProductSerial")
	public void getAllProductSerial(HttpServletRequest request,
			HttpServletResponse response){		
		List<BaseData> bdlist 
		 =	baseDataService.getGreenSerial(12);
		outPrint(response,JSONArray.toJSON(bdlist));
	}
}
