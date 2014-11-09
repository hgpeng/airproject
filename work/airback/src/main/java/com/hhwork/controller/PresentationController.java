package com.hhwork.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.hhwork.common.Pagination;
import com.hhwork.model.Presentation;
import com.hhwork.service.PresentationService;

@Controller
@RequestMapping("/presentation/*")
public class PresentationController extends BaseController {

	@Resource
	protected PresentationService presentationService;
	
	@RequestMapping("presentationIndex")
	public String presentationIndex(ModelMap modelMap){
		return "/presentation/presentationIndex";
	}
	
	@RequestMapping("getPresentationList")
	public void getPresentationList(HttpServletRequest request,
			HttpServletResponse response,Pagination<Presentation> page){
		Map<String,Object> query=new HashMap<String,Object>();
		Pagination<Presentation> res=presentationService.getPresentation(page, query);
		outPrint(response,JSONArray.toJSON(res) );
	}
	
	
	@RequestMapping("savePresentation")
	public void savePresentation(HttpServletRequest request,
			HttpServletResponse response){
		
	}
}
