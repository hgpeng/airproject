package com.hhwork.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hhwork.common.PageMapper;
import com.hhwork.common.Pagination;
import com.hhwork.dao.ProductDao;
import com.hhwork.model.Product;
import com.hhwork.utils.SQLHelpers;

@Repository("productDao")
public class ProductDaoImpl extends BaseDaoImpl implements ProductDao {

	@Resource
	ProxoolDataSource airDataSource;
	
	@Resource
	protected JdbcTemplate airJdbcTemplate;
	
	@Override
	public int saveProduct(Product product) {
		if(product.getId()<=0){
			return saveObject(product);
		}else{
			return updateObject(product, product.getId());
		}
	}

	@Override
	public Pagination<Product> getProducts(Pagination<Product> page,
			Map<String, Object> query) {
		StringBuilder sql=new StringBuilder("select SQL_CALC_FOUND_ROWS id,name,typeId,descr,mainPhoto,status,basedataId,createTime,createMan from product where 1=1 ");
		List<Object> args=new ArrayList<Object>();
		Object typeId=query.get("typeId");
		if(typeId!=null){
			sql.append(" and typeId=? ");
			args.add(typeId);
		}
		return SQLHelpers.getRowSize(sql.toString(), airDataSource, args.toArray(), page, new PageMapper<Product>(){

			@Override
			public Product toCustomizedBean(ResultSet rs) throws SQLException {
				return generateProduct(rs);
			}
			
		});
	}

	@Override
	public int putProductOffShelves(Product p) {
		return updateObject(p, p.getId());
	}

	@Override
	public Product getProduct(int id) {
		String sql="select id,name,typeId,descr,mainPhoto,status,basedataId,createTime,createMan from product where id=?";
		
		return airJdbcTemplate.queryForObject(sql,new Object[]{ id},new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int arg1) throws SQLException {
				return generateProduct(rs);
			}
		});
	}
	
	private Product generateProduct(ResultSet rs) throws SQLException{
		Product p=new Product();
		p.setId(rs.getInt("id"));
		p.setName(rs.getString("name"));
		p.setDesc(rs.getString("descr"));
		p.setMainPhoto(rs.getString("mainPhoto"));
		p.setStatus(rs.getInt("status"));
		p.setBasedataId(rs.getInt("basedataId"));
		p.setCreateTime(rs.getDate("createTime"));
		p.setCreateMan(rs.getString("createMan"));
		p.setTypeId(rs.getInt("typeId"));
		p.setBasedataId(rs.getInt("basedataId"));
		return p;
	}

	@Override
	public int deleteProduct(Product p) {
		return deleteObjectById(p, p.getId());
	}
}
