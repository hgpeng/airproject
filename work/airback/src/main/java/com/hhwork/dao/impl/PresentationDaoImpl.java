package com.hhwork.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.math.NumberUtils;
import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.stereotype.Repository;

import com.hhwork.common.PageMapper;
import com.hhwork.common.Pagination;
import com.hhwork.dao.PresentationDao;
import com.hhwork.model.Presentation;
import com.hhwork.model.Product;
import com.hhwork.utils.SQLHelpers;

@Repository("presentionDao")
public class PresentationDaoImpl extends BaseDaoImpl implements PresentationDao {

	@Resource
	ProxoolDataSource airDataSource;
	
	@Override
	public int savePresentation(Presentation presentation) {
		if(presentation.getId()<=0){
			return saveObject(presentation);
		}else{
			return updateObject(presentation, presentation.getId());
		}
	}

	@Override
	public Pagination<Presentation> getPresentationList(
			Pagination<Presentation> page, Map<String, Object> query) {
		StringBuilder sql=new StringBuilder("select SQL_CALC_FOUND_ROWS id,productId,num,html,createTime,createMan from presentation where 1=1 ");
		List<Object> args=new ArrayList<Object>();
		Object productIdObj=query.get("productId");
		if(productIdObj!=null){
			sql.append(" and productId=? ");
			args.add(productIdObj);
		}
		sql.append(" order by num asc");
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

	@Override
	public int deletePresentation(Presentation presentation) {
		return deleteObjectById(presentation, presentation.getId());
	}

	@Override
	public Presentation getPresentationById(int id) {
		StringBuilder sql=new StringBuilder("select p.id presentId,p.productId,p.num,p.html,p.createTime,p.createMan,pro.name proName ");
		sql.append(" from presentation p,product pro where p.productId=pro.id and p.id=?");
		List<Object> args=new ArrayList<Object>();
		args.add(id);
		Map<String,Object> map=airJdbcTemplate.queryForMap(sql.toString(), args.toArray());
		Presentation pre=new Presentation();
		pre.setId(NumberUtils.toInt(map.get("presentId").toString()));
		int productId=NumberUtils.toInt(map.get("productId").toString());
		pre.setProductId(productId);
		Product product=new Product();
		product.setId(productId);
		product.setName(map.get("proName").toString());
		pre.setProduct(product);
		pre.setNum(map.get("num").toString());
		pre.setHtml(map.get("html").toString());
		pre.setCreateTime((Date)map.get("createTime"));
		pre.setCreateMan(map.get("createMan").toString());
		return pre;
	}

}
