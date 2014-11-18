package com.hhwork.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hhwork.common.PageMapper;
import com.hhwork.common.Pagination;
import com.hhwork.dao.AppCaseDao;
import com.hhwork.model.AppCase;
import com.hhwork.model.Articles;
import com.hhwork.utils.SQLHelpers;

@Repository("appCaseDao")
public class AppCaseDaoImpl extends BaseDaoImpl implements AppCaseDao {

	@Resource
	ProxoolDataSource airDataSource;
	
	@Override
	public Pagination<AppCase> getAppCase(Pagination<AppCase> page) {
		
		StringBuilder sql=new StringBuilder("select SQL_CALC_FOUND_ROWS id,addr,content,area,buildtime,name,name_en,basedataid from appcase ");
		
		return SQLHelpers.getRowSize(sql.toString(), airDataSource, null, page, new PageMapper<AppCase>(){

			@Override
			public AppCase toCustomizedBean(ResultSet rs) throws SQLException {
				AppCase res=new AppCase();
				res.setId(rs.getInt("id"));
				res.setAddr(rs.getString("addr"));
				res.setArea(rs.getString("area"));
				res.setBuildtime(rs.getString("buildtime"));
				res.setName(rs.getString("name"));
				res.setName_en(rs.getString("name_en"));
				res.setBasedataId(rs.getInt("basedataid"));
				res.setContent(rs.getString("content"));		
				return res;
			}
			
		});
	}

	@Override
	public int saveAppCase(AppCase appcase) {
		if(appcase.getId()<=0){
			return saveObject(appcase);
		}else{
			return updateObject(appcase, appcase.getId());
		}
	}

	@Override
	public int deleteAppCase(int id) {
		// TODO Auto-generated method stub
		return deleteObjectById(new AppCase(),id);
	}

	@Override
	public AppCase getAppCase(int id) {
		String sql="select id,addr,content,area,buildtime,photo,name,name_en,basedataid from appcase where id=? ";
		List<Object> args=new ArrayList<Object>();
		args.add(id);
		return airJdbcTemplate.queryForObject(sql, args.toArray(), new RowMapper<AppCase>(){

			@Override
			public AppCase mapRow(ResultSet rs, int arg1)
					throws SQLException {
				AppCase res=new AppCase();
				res.setId(rs.getInt("id"));
				res.setAddr(rs.getString("addr"));
				res.setArea(rs.getString("area"));
				res.setBuildtime(rs.getString("buildtime"));
				res.setName(rs.getString("name"));
				res.setName_en(rs.getString("name_en"));
				res.setBasedataId(rs.getInt("basedataid"));
				res.setContent(rs.getString("content"));
				res.setPhoto(rs.getString("photo"));
				return res;
			}
			
		});
	}

}
