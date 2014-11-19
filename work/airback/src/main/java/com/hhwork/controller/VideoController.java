package com.hhwork.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hhwork.common.Pagination;
import com.hhwork.model.Video;

@Controller
@RequestMapping("/video/*")
public class VideoController extends BaseController {

	
	@RequestMapping("videoIndex")
	public String videoIndex(ModelMap modelMap){
		return "/video/videoIndex";
	}
	
	
	@RequestMapping("getVideoList")
	public void getVideoList(HttpServletRequest request,
			HttpServletResponse response,Pagination<Video> page){
		
	}
			
}
