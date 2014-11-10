package com.hhwork.dao;

import java.util.List;
import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.BaseType;

public interface BaseTypeDao {

	
	public int saveBaseType(BaseType baseType);
	
	/**
	 * 翻页获取基础类型
	 * @param query
	 * @param query
	 * @return
	 */
	public Pagination<BaseType> getBaseType(Pagination<BaseType> page,Map<String,Object> query);
	
	/**
	 * 根据id删除基本类型
	 * @param id
	 * @return
	 */
	public int deleteBaseType(int id);
	
	
	/**
	 * 获取所有基本类型
	 * @return
	 */
	public List<BaseType> getBaseTypeList();
	
	/**
	 * 根据id获取BaseType
	 * @param id
	 * @return
	 */
	public BaseType getBaseTypeById(int id);
}
