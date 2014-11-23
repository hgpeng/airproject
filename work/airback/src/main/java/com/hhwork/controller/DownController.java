package com.hhwork.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hhwork.model.BaseData;
import com.hhwork.service.BaseDataService;

@Controller
@RequestMapping("/down/*")
public class DownController extends BaseController {
	@Resource
	protected BaseDataService baseDataService;
	
	@RequestMapping("list")
	public String list(ModelMap modelMap){
		
		
		return "/down/list";
	}
	
	@RequestMapping("add")
	public String add(ModelMap modelMap){
		int id=getInt("id",-1);
		if(id!=-1){
			BaseData baseData=baseDataService.getBaseDataById(id);
			modelMap.put("baseData", baseData);
		}
		modelMap.put("typeId", "15");
		return "/down/add";
	}
}
