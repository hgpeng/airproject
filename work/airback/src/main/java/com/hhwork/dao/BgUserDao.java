package com.hhwork.dao;

import com.hhwork.model.BgUser;

public interface BgUserDao {

	
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
	
	
}
