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
			return updateObject(baseType, baseType.getId());
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
	public List<BaseType> getBaseTypeList(Map<String,Object> params) {
		StringBuilder sql=new StringBuilder("select id,name from basetype where 1=1 ");
		List<Object> args=new ArrayList<Object>();
		Object article=params.get("article");
		if(article!=null){
			sql.append(" and id>=? and id<=? ");
			args.add(4);
			args.add(9);
		}
		return airJdbcTemplate.query(sql.toString(),args.toArray(), new RowMapper<BaseType>(){

			@Override
			public BaseType mapRow(ResultSet rs, int arg1)
					throws SQLException {
				return generateBaseType(rs);
			}
			
		});
	}

	class BaseTypeMapper extends PageMapper<BaseType>{

		@Override
		public BaseType toCustomizedBean(ResultSet rs) throws SQLException {
			return generateBaseType(rs);
		}
		
	}
	
	private BaseType generateBaseType(ResultSet rs) throws SQLException{
		BaseType res=new BaseType();
		res.setId(rs.getInt("id"));
		res.setName(rs.getString("name"));
		return res;
	}

	@Override
	public BaseType getBaseTypeById(int id) {
		String sql="select id,name from basetype where id=?";
		List<Object> args=new ArrayList<Object>();
		args.add(id);
		return airJdbcTemplate.queryForObject(sql, args.toArray(), new RowMapper<BaseType>(){

			@Override
			public BaseType mapRow(ResultSet rs, int arg1)
					throws SQLException {
				return generateBaseType(rs);
			}
			
		});
	}
}
