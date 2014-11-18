package com.hhwork.service;

import javax.servlet.http.HttpServletResponse;

import com.hhwork.model.BgUser;

public interface BgUserService {

	/**
	 * 根据用户名获取后台管理人员
	 * @param name
	 * @return
	 */
	public BgUser getBgUserByUserName(String name);
	
	
	
	/**
	 * 保存后台管理人员
	 * @param user
	 * @return
	 */
	public int saveBgUser(BgUser user);
	
	
	/**
	 * 根据id删除后台管理人员
	 * @param id
	 * @return
	 */
	public int deleteBgUserById(int id);
	
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	public int login(BgUser user,HttpServletResponse response);
}
