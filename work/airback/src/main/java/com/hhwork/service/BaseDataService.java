package com.hhwork.service;

import java.util.List;
import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.BaseData;
import com.hhwork.model.BaseType;

public interface BaseDataService {

	
	/**
	 * 获取所有菜单
	 * @return
	 */
	public List<BaseData> getMenus();
	
	/**
	 * 根据查询条件获取基础类型
	 * @param page
	 * @param query
	 * @return
	 */
	public Pagination<BaseType> getBaseType(Pagination<BaseType> page,Map<String,Object> query);
	
	/**
	 * 获取所有基本类型
	 * @return
	 */
	public List<BaseType> getAllBaseTypes(Map<String,Object> params);
	
	/**
	 * 根据查询条件获取基础数据
	 * @param page
	 * @param query
	 * @return
	 */
	public Pagination<BaseData> getBaseData(Pagination<BaseData> page,Map<String,Object> query);
	
	
	
	/**
	 * 保存基本类型
	 * @param baseType
	 * @return
	 */
	public int saveBaseType(BaseType baseType);
	
	/**
	 * 删除基本类型
	 * @param id
	 * @return
	 */
	public int deleteBaseType(int id);
	
	/**
	 * 保存基本数据
	 * @param baseData
	 * @return
	 */
	public int saveBaseData(BaseData baseData);
	
	/**
	 * 
	 */
	public List<BaseData> getAllBaseData(Map<String,Object> param);
	
	/**
	 * 根据id获取BaseType
	 * @param id
	 * @return
	 */
	public BaseType getBaseTypeById(int id);
	
	/**
	 * 根据基本类型id获取基本数据
	 * @param typeId
	 * @return
	 */
	public List<BaseData> getBaseDataByBaseTypeId(int typeId);
	
	/**
	 * 根据id获取BaseData
	 * @param id
	 * @return
	 */
	public BaseData getBaseDataById(int id);
	
	/**
	 * 删除基本shuju
	 * @param id
	 * @return
	 */
	public int deleteBaseData(int id);
	
	public List<BaseData> getGreenSerial(int id);
	
	public  Pagination<BaseData> getGreenProduct(Pagination<BaseData> page,Map<String,Object> query);
}
