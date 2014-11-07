package com.hhwork.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.annotation.Resource;

import org.logicalcobwebs.proxool.ProxoolDataSource;
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
	public Pagination<Articles> getArticles(Pagination<Articles> page) {
		StringBuilder sql=new StringBuilder("select SQL_CALC_FOUND_ROWS id,title,content,img,preview,type,status,createTime,createMan from articles ");
		
		return SQLHelpers.getRowSize(sql.toString(), airDataSource, null, page, new PageMapper<Articles>(){

			@Override
			public Articles toCustomizedBean(ResultSet rs) throws SQLException {
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
			
		});
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

}
