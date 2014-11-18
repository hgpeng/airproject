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
import com.hhwork.common.Pagination;
import com.hhwork.model.Leaves;
import com.hhwork.service.LeavesService;

@Controller
@RequestMapping("/leaves/*")
public class LeavesController extends BaseController{

	@Resource
	protected LeavesService leavesService;
	
	@RequestMapping("leavesIndex")
	public String leavesIndex(ModelMap modelMap){
		return "/leaves/leavesIndex";
	}
	
	@RequestMapping("getLeavesData")
	public void getLeavesData(HttpServletRequest request,
			HttpServletResponse response,Pagination<Leaves> page){
		Map<String,Object> params=new HashMap<String,Object>();
		Pagination<Leaves> res=leavesService.getLeaves(page, params);
		outPrint(response,JSONArray.toJSON(res) );
	}
	
	@RequestMapping("replyLeaves")
	public void replyLeaves(HttpServletRequest request,
			HttpServletResponse response){
		String content=getString("content");
		int id=getInt("id",-1);
		if(StringUtils.isBlank(content) || id==-1){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}
		Leaves leaves=new Leaves();
		leaves.setId(id);
		leaves.setReplyContent(content);
		int ret=leavesService.replyLeaves(leaves);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
	
	
	
}
