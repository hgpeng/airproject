package com.hhwork.dao.impl;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hhwork.dao.BaseDao;
import com.hhwork.utils.SQLHelpers;
import com.hhwork.utils.SQLHelpers.SQLValues;

@Repository("baseDao")
public class BaseDaoImpl implements BaseDao {

	@Resource
	protected JdbcTemplate airJdbcTemplate;
	
	@Override
	public int saveObject(Object obj) {
		SQLValues sqlValues=SQLHelpers.generateInsertSQL(obj);
		System.out.println(sqlValues.getSql());
		return airJdbcTemplate.update(sqlValues.getSql(), sqlValues.getArgs());
	}

	@Override
	public int deleteObjectById(Object obj,int id) {
		String sql=SQLHelpers.generateDeleteSQL(obj, id);
		System.out.println(sql);
		return airJdbcTemplate.update(sql);
	}

	@Override
	public int updateObject(Object obj, int id) {
		SQLValues sqlValues=SQLHelpers.generateUpdateSQL(obj, id);
		System.out.println(sqlValues.getSql());
		return airJdbcTemplate.update(sqlValues.getSql(),sqlValues.getArgs());
	}

}
