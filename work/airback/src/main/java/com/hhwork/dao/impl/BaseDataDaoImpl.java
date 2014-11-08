package com.hhwork.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hhwork.common.PageMapper;
import com.hhwork.common.Pagination;
import com.hhwork.dao.BaseDataDao;
import com.hhwork.model.BaseData;
import com.hhwork.utils.SQLHelpers;

@Repository("menuItemDao")
public class BaseDataDaoImpl extends BaseDaoImpl implements BaseDataDao {

	@Resource
	protected JdbcTemplate airJdbcTemplate;
	
	@Resource
	ProxoolDataSource airDataSource;
	
	@Override
	public int saveMenuItem(BaseData menu) {
		if(menu==null){
			return 0;
		}
		if(menu.getId()>0){
			return updateObject(menu, menu.getId());
		}else{
			return saveObject(menu);
		}
	}

	@Override
	public int deleteMenuItem(int id) {
		StringBuilder sql=new StringBuilder("delete from menu_item where id=?");
		sql.append(id);
		return airJdbcTemplate.update(sql.toString(), id);
	}

	@Override
	public List<BaseData> getAllMenus() {
		String sql="select id,parentId,typeId,name,url,descr,createTime,createMan from basedata where typeId=1 or typeId=2 ";
		List<Map<String,Object>> list=airJdbcTemplate.queryForList(sql);
		if(list==null || list.size()==0){
			return null;
		}
		//转换成菜单
		List<BaseData> items=new ArrayList<BaseData>();
		for(Map<String,Object> data:list){
			BaseData e=new BaseData();
			e.setId((Integer)data.get("id"));
			e.setName(data.get("name").toString());
			e.setTypeId((Integer)data.get("typeId"));
			e.setParentId((Integer)data.get("parentId"));
			e.setUrl(data.get("url").toString());
			e.setDesc(data.get("descr").toString());
			e.setCreateTime((Date)data.get("createTime"));
			e.setCreateMan(data.get("createMan").toString());
			items.add(e);
		}
		return items;
	}

	@Override
	public Pagination<BaseData> getBaseData(Pagination<BaseData> page,
			Map<String, Object> query) {
		StringBuilder sql=new StringBuilder("select SQL_CALC_FOUND_ROWS id,name,typeId,parentId,url,descr,createTime,createMan");
		sql.append(" from basedata where 1=1 ");
		List<Object> args=new ArrayList<Object>();
		sql.append(" order by id asc");
		return SQLHelpers.getRowSize(sql.toString(), airDataSource, args.toArray(), page, new PageMapper<BaseData>(){

			@Override
			public BaseData toCustomizedBean(ResultSet rs) throws SQLException {
				BaseData baseData=new BaseData();
				baseData.setId(rs.getInt("id"));
				baseData.setName(rs.getString("name"));
				baseData.setTypeId(rs.getInt("typeId"));
				baseData.setParentId(rs.getInt("parentId"));
				baseData.setUrl(rs.getString("url"));
				baseData.setDesc(rs.getString("descr"));
				baseData.setCreateTime(rs.getDate("createTime"));
				baseData.setCreateMan(rs.getString("createMan"));
				return baseData;
			}
			
		});
	}

	@Override
	public List<BaseData> getAllBaseData(Map<String,Object> param) {
		String sql="select b.id,b.parentId,b.typeId,b.name,b.url,b.descr,b.createTime,b.createMan,t.name basetype from basedata b left join basetype t on b.typeid = t.id where 1=1 ";
		if(null!=param.get("type")){
			sql += "and typeId= '"+param.get("type").toString()+"'";
		}
		List<Map<String,Object>> list=airJdbcTemplate.queryForList(sql);
		if(list==null || list.size()==0){
			return null;
		}
		//转换成菜单
		List<BaseData> items=new ArrayList<BaseData>();
		for(Map<String,Object> data:list){
			BaseData e=new BaseData();
			e.setId((Integer)data.get("id"));
			e.setName(data.get("name").toString());
			e.setTypeId((Integer)data.get("typeId"));
			e.setParentId((Integer)data.get("parentId"));
			e.setUrl(null==data.get("url")?"":data.get("url").toString());
			e.setDesc(null==data.get("descr")?"":data.get("descr").toString());	
			e.setBaseType(null==data.get("basetype")?"":data.get("basetype").toString());	
			items.add(e);
		}
		return items;
	}

}
