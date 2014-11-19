package com.hhwork.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hhwork.common.Constants;
import com.hhwork.common.Pagination;
import com.hhwork.dao.BaseDataDao;
import com.hhwork.dao.BaseTypeDao;
import com.hhwork.model.BaseData;
import com.hhwork.model.BaseType;
import com.hhwork.service.BaseDataService;

@Service("baseDataService")
public class BaseDataServiceImpl implements BaseDataService {

	@Resource
	protected BaseDataDao baseDataDao;
	
	@Resource
	protected BaseTypeDao baseTypeDao;
	
	@Override
	public List<BaseData> getMenus() {
		return baseDataDao.getAllMenus();
	}

	@Override
	public Pagination<BaseType> getBaseType(Pagination<BaseType> page,
			Map<String, Object> query) {
		return baseTypeDao.getBaseType(page, query);
	}

	@Override
	public Pagination<BaseData> getBaseData(Pagination<BaseData> page,
			Map<String, Object> query) {
		return baseDataDao.getBaseData(page, query);
	}

	@Override
	public int saveBaseType(BaseType baseType) {
		return baseTypeDao.saveBaseType(baseType);
	}

	@Override
	public int saveBaseData(BaseData baseData) {
		baseData.setCreateMan(Constants.ADMIN);
		baseData.setCreateTime(new Date());
		return baseDataDao.saveMenuItem(baseData);
	}

	@Override
	public int deleteBaseType(int id) {
		return baseTypeDao.deleteBaseType(id);
	}

	@Override
	public List<BaseType> getAllBaseTypes(Map<String,Object> params) {
		return baseTypeDao.getBaseTypeList(params);
	}

	@Override
	public List<BaseData> getAllBaseData(Map<String,Object> param) {
		return baseDataDao.getAllBaseData(param);
	}

	@Override
	public BaseType getBaseTypeById(int id) {
		return baseTypeDao.getBaseTypeById(id);
	}

	@Override
	public List<BaseData> getBaseDataByBaseTypeId(int typeId) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("type", typeId);
		return baseDataDao.getAllBaseData(params);
	}

	@Override
	public BaseData getBaseDataById(int id) {
		return baseDataDao.getBaseDataById(id);
	}

	@Override
	public int deleteBaseData(int id) {
		
		return baseDataDao.deleteBaseData(id);
	}

}
