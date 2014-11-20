package com.hhwork.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.d3.d396333.common.util.ResponseUtils;
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
	
	@RequestMapping("saveVideo")
	public void saveVideo(HttpServletRequest request,
			HttpServletResponse response){
		String imgPath=getString("imgPath");
		String videoPath=getString("videoPath");
		if(StringUtils.isBlank(imgPath)|| StringUtils.isBlank(videoPath)){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}
		BaseData baseData=new BaseData();
		baseData.setName("");
		baseData.setTypeId(Constants.BaseType.VIDEO);
		baseData.setIcon(imgPath);
		baseData.setUrl(videoPath);
		int ret=baseDataService.saveBaseData(baseData);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
			
}
