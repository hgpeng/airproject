package com.hhwork.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.hhwork.model.BaseData;
import com.hhwork.service.BaseDataService;

@Controller
@RequestMapping("/menus/*")
public class MenusController extends BaseController {

	@Resource
	protected BaseDataService baseDataService;
	
	@RequestMapping("menu")
	public String menuIndex(){
		return "/menus/index";
	}
	
	@RequestMapping("getMenus")
	public void getMenus(HttpServletRequest request,
			HttpServletResponse response){
		List<BaseData> list=baseDataService.getMenus();
		outPrint(response, JSONArray.toJSON(list));
	}
}
