package com.hhwork.dao;

import java.util.List;
import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.BaseData;

public interface BaseDataDao {

	/**
	 * 添加菜单
	 * @param menu
	 */
	public int saveMenuItem(BaseData menu);
	
	
	/**
	 * 删除菜单
	 * @param id
	 * @return
	 */
	public int deleteMenuItem(int id);
	
	
	/**
	 * 获取所有菜单
	 * @return
	 */
	public List<BaseData> getAllMenus();
	
	/**
	 * 根据特定条件翻页获取基础数据
	 * @param page
	 * @param query
	 * @return
	 */
	public Pagination<BaseData> getBaseData(Pagination<BaseData> page,Map<String,Object> query);
	
	public List<BaseData> getAllBaseData(Map<String,Object> param);
}
