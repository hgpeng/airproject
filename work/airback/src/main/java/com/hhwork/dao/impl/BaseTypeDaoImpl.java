package com.hhwork.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hhwork.common.PageMapper;
import com.hhwork.common.Pagination;
import com.hhwork.dao.BaseTypeDao;
import com.hhwork.model.BaseType;
import com.hhwork.utils.SQLHelpers;

@Repository("baseTypeDao")
public class BaseTypeDaoImpl extends BaseDaoImpl implements BaseTypeDao {

	@Resource
	ProxoolDataSource airDataSource;
	
	@Override
	public int saveBaseType(BaseType baseType) {
		if(baseType.getId()<=0){
			return saveObject(baseType);
		}else{
			return 0;
		}
	}

	@Override
	public Pagination<BaseType> getBaseType(Pagination<BaseType> page,
			Map<String, Object> query) {
		StringBuilder sql=new StringBuilder("select SQL_CALC_FOUND_ROWS id,name from basetype where 1=1 ");
		List<Object>args=new ArrayList<Object>();
		return SQLHelpers.getRowSize(sql.toString(), airDataSource, args.toArray(), page, new BaseTypeMapper());
	}

	@Override
	public int deleteBaseType(int id) {
		return deleteObjectById(new BaseType(), id);
	}

	@Override
	public List<BaseType> getBaseTypeList() {
		StringBuilder sql=new StringBuilder("select id,name from basetype where 1=1 ");
		
		return airJdbcTemplate.query(sql.toString(), new RowMapper<BaseType>(){

			@Override
			public BaseType mapRow(ResultSet rs, int arg1)
					throws SQLException {
				BaseType res=new BaseType();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				return res;
			}
			
		});
	}

	class BaseTypeMapper extends PageMapper<BaseType>{

		@Override
		public BaseType toCustomizedBean(ResultSet rs) throws SQLException {
			BaseType res=new BaseType();
			res.setId(rs.getInt("id"));
			res.setName(rs.getString("name"));
			return res;
		}
		
	}
}
