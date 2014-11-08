package com.hhwork.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.stereotype.Repository;

import com.hhwork.common.PageMapper;
import com.hhwork.common.Pagination;
import com.hhwork.dao.PresentationDao;
import com.hhwork.model.Presentation;
import com.hhwork.utils.SQLHelpers;

@Repository("presentionDao")
public class PresentationDaoImpl extends BaseDaoImpl implements PresentationDao {

	@Resource
	ProxoolDataSource airDataSource;
	
	@Override
	public int savePresentation(Presentation presentation) {
		if(presentation.getId()>0){
			return saveObject(presentation);
		}else{
			return updateObject(presentation, presentation.getId());
		}
	}

	@Override
	public Pagination<Presentation> getPresentationList(
			Pagination<Presentation> page, Map<String, Object> query) {
		StringBuilder sql=new StringBuilder("select SQL_CALC_FOUND_ROWS id,productId,num,html,createTime,createMan from presentation");
		List<Object> args=new ArrayList<Object>();
		return SQLHelpers.getRowSize(sql.toString(), airDataSource, args.toArray(), page, new PageMapper<Presentation>(){

			@Override
			public Presentation toCustomizedBean(ResultSet rs)
					throws SQLException {
				Presentation p=new Presentation();
				p.setId(rs.getInt("id"));
				p.setProductId(rs.getInt("productId"));
				p.setNum(rs.getString("num"));
				p.setHtml(rs.getString("html"));
				p.setCreateTime(rs.getDate("createTime"));
				p.setCreateMan(rs.getString("createMan"));
				return p;
			}
			
		});
	}

}
