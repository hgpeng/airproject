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
import com.hhwork.dao.ArticlesDao;
import com.hhwork.model.Articles;
import com.hhwork.utils.SQLHelpers;

@Repository("articlesDao")
public class ArticlesDaoImpl extends BaseDaoImpl implements ArticlesDao {

	@Resource
	ProxoolDataSource airDataSource;
	
	@Override
	public Pagination<Articles> getArticles(Pagination<Articles> page,Map<String,Object> params) {
		StringBuilder sql=new StringBuilder("select SQL_CALC_FOUND_ROWS a.id,a.title,a.content,a.img,a.preview,a.type,a.status,a.createTime,a.createMan ");
		sql.append("from articles a,basedata b where a.type=b.id ");
		List<Object> args=new ArrayList<Object>();
		Object baseTypeIdObj=params.get("baseTypeId");
		if(baseTypeIdObj!=null){
			sql.append(" and b.typeId=? ");
			args.add(baseTypeIdObj);
		}
		return SQLHelpers.getRowSize(sql.toString(), airDataSource, args.toArray(), page, new PageMapper<Articles>(){

			@Override
			public Articles toCustomizedBean(ResultSet rs) throws SQLException {
				return generateArticles(rs);
			}
			
		});
	}

	private Articles generateArticles(ResultSet rs) throws SQLException{
		Articles res=new Articles();
		res.setId(rs.getInt("id"));
		res.setTitle(rs.getString("title"));
		res.setContent(rs.getString("content"));
		res.setImg(rs.getString("img"));
		res.setPreview(rs.getString("preview"));
		res.setType(rs.getInt("type"));
		res.setStatus(rs.getInt("status"));
		res.setCreateTime(rs.getDate("createTime"));
		res.setCreateMan(rs.getString("createMan"));
		return res;
	}
	
	@Override
	public int saveArticles(Articles article) {
		if(article.getId()<=0){
			return saveObject(article);
		}else{
			return updateObject(article, article.getId());
		}
	}

	@Override
	public int deleteArticles(int id) {
		return deleteObjectById(new Articles(),id);
	}

	@Override
	public Articles getArticleById(int id) {
		String sql="select id,title,content,img,preview,type,status,createTime,createMan from articles where id=? ";
		List<Object> args=new ArrayList<Object>();
		args.add(id);
		return airJdbcTemplate.queryForObject(sql, args.toArray(), new RowMapper<Articles>(){

			@Override
			public Articles mapRow(ResultSet rs, int arg1)
					throws SQLException {
				return generateArticles(rs);
			}
			
		});
	}

}
