package com.hhwork.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.d3.d396333.common.util.KeyFactory;
import com.ezhenai.commons.utils.CookieUtils;
import com.hhwork.model.BgUser;

/**
 * 用户cookie工具类
 */
public final class LoginCookieUtil {

	public final static String COOKIE_NAME = "enuin";
	public final static String AGE = "age";
	public final static String USERID = "user";
	public final static String NAME = "name";
	public final static String SEX = "sex";
	public final static String GUID = "enguid";
	public final static String DELIMITER = "##";
	public final static String EQ = "=";
	
	public final static String LOGINUSERNAME="loginUser";
	public static final String USER_TYP = "uin_fork_s";

	
	
	/**
	 * 注意，这样会覆盖原有的login cookie
	 * @param response
	 * @param info
	 * @param isAutoLogin
	 */
	public final static void setLoginCookie(HttpServletResponse response,
			BgUser info, boolean isAutoLogin) {
		StringBuilder value = new StringBuilder();
		try {
			value.append(USERID).append(EQ).append(info.getId())
					.append(DELIMITER).append(NAME).append(EQ)
					.append(URLEncoder.encode(info.getNickName(),"utf-8")).append(DELIMITER).append(SEX)
					.append(DELIMITER);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int maxAge = isAutoLogin ? (int) TimeUnit.DAYS.toSeconds(30) : -1;
		addCookie(response, COOKIE_NAME, value.toString(), maxAge);
		String guid = KeyFactory.createKey(info.getId() + "");
		if (isAutoLogin) {
			addCookie(response, GUID, guid, maxAge);
		}
	}

	
	/**
	 * 设置cookie
	 * @param response
	 * @param name  cookie名字
	 * @param value cookie值
	 * @param maxAge cookie生命周期  以秒为单位
	 */
	public static void addCookie(HttpServletResponse response,String name,String value,int maxAge){
	    Cookie cookie = new Cookie(name,value);
	    cookie.setPath("/");
	    if(maxAge>0)  cookie.setMaxAge(maxAge);
	    response.addCookie(cookie);
	}
	
	/*
	 * 获取登录用户的cookie
	 */
	public final static Map<String, String> getLoginCookie(
			HttpServletRequest request) {
		String cookie = CookieUtils.getCookie(request, COOKIE_NAME);
		if (StringUtils.isBlank(cookie)) {
			return null;
		}
		Map<String, String> map = new HashMap<String, String>();
		for (String sub : cookie.split(DELIMITER)) {
			String[] kv = sub.split(EQ);
			if (kv.length == 2) {
				map.put(kv[0], kv[1]);
			}
		}
		String guid = getGuidCookie(request);
		if (StringUtils.isNotBlank(guid)) {
			map.put(GUID, guid);
		}
		return map;
	}

	/*
	 * 获取登录用户的guid
	 */
	public final static String getGuidCookie(HttpServletRequest request) {
		String cookie = getCookie(request, GUID);
		if (StringUtils.isBlank(cookie)) {
			return null;
		}
		return cookie;
	}
	
	
	public static String getCookie(HttpServletRequest request,String name){
		Cookie[] cookies = request.getCookies();//这样便可以获取一个cookie数组
		if(cookies==null){
			return null;
		}
		for(Cookie cookie : cookies){
		    String cookieName=cookie.getName();// get the cookie name
		    if(cookieName.equals(name)){
		    	return cookie.getValue();
		    }
		}
		return null;
	}

	/**
	 * 取uin cookie中的值
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	public final static String getValueByName(HttpServletRequest request,
			String name) {
		Map<String, String> map = getLoginCookie(request);
		if (map != null) {
			return map.get(name);
		}
		return null;
	}

	/**
	 * 清除登录
	 */
	public final static void removeLoginCookie(HttpServletResponse response) {
		CookieUtils.removeCookie(response, COOKIE_NAME);
		CookieUtils.removeCookie(response, "bannerClose", ".qiye.zhenai.com", "/");
		CookieUtils.removeCookie(response, GUID);
	}

	public final static void recordUsername(HttpServletRequest request,HttpServletResponse response,String username){
//		if(StringUtils.isNotBlank(username)){
			CookieUtils.addCookie(response, LOGINUSERNAME, username,(int)TimeUnit.DAYS.toSeconds(30));
//		}
	}
	
	public static void main(String[] args){
		System.out.println(493344 % 72);
	}
	
}
