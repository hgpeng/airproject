package com.hhwork.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hhwork.common.Constants;
import com.hhwork.model.BgUser;
import com.hhwork.service.BgUserService;
import com.hhwork.utils.LoginCookieUtil;

@Controller
@RequestMapping("/index/*")
public class IndexController extends BaseController {

	@Resource
	protected BgUserService bgUserService;
	
	@RequestMapping("index")
	public String index(ModelMap modelMap){
		return "index";
	}
	
	
	/**
	 * 用户登录
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("login")
	public String login(@ModelAttribute BgUser user,ModelMap modelMap,HttpServletRequest request,
			HttpServletResponse response){
		if(user==null ||
				StringUtils.isBlank(user.getUserName()) ||
				StringUtils.isBlank(user.getPassword())){
			return "index";
		}
		int status=bgUserService.login(user,response);
		if(status==Constants.Status.SUCCESS){
			try {
				response.sendRedirect("/menus/menu.html");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "index";
	}
	
	
	
	
}
