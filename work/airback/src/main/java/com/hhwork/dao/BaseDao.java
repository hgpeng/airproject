package com.hhwork.dao;

public interface BaseDao {

	public int saveObject(Object obj);
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public int deleteObjectById(Object obj,int id);
	
	/**
	 * 修改
	 * @param obj
	 * @param id
	 * @return
	 */
	public int updateObject(Object obj,int id);
}
