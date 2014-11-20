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
import com.hhwork.common.Constants;
import com.hhwork.common.Pagination;
import com.hhwork.model.BaseData;
import com.hhwork.service.BaseDataService;

@Controller
@RequestMapping("/video/*")
public class VideoController extends BaseController {

	
	@Resource
	protected BaseDataService baseDataService;
	
	@RequestMapping("videoIndex")
	public String videoIndex(ModelMap modelMap){
		return "/video/videoIndex";
	}
	
	
	@RequestMapping("getVideoList")
	public void getVideoList(HttpServletRequest request,
			HttpServletResponse response,Pagination<BaseData> page){
		Map<String,Object> query=new HashMap<String,Object>();
		query.put("type", Constants.BaseType.VIDEO);
		Pagination<BaseData> videoList=baseDataService.getBaseData(page, query);
		outPrint(response, JSONArray.toJSON(videoList));
	}
	
	@RequestMapping("saveVideoDialog")
	public String saveVideoDialog(ModelMap modelMap){
		return "/video/saveVideoDialog";
	}
			
}
