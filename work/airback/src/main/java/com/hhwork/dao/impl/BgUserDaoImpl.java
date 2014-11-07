package com.hhwork.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hhwork.dao.BgUserDao;
import com.hhwork.model.BgUser;

@Repository("bgUserDao")
public class BgUserDaoImpl implements BgUserDao{

	@Resource
	protected JdbcTemplate airJdbcTemplate;
	
	@Override
	public BgUser getBgUserByUserName(String name) {
		String sql="select id,username,password,salt,nickname,createTime from bg_admin where username=?";
		try{
			return airJdbcTemplate.queryForObject(sql,new Object[]{name},new RowMapper<BgUser>(){
	
				@Override
				public BgUser mapRow(ResultSet rs, int arg1) throws SQLException {
					BgUser user=new BgUser();
					user.setId(rs.getInt("id"));
					user.setUserName(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setSalt(rs.getString("salt"));
					user.setNickName(rs.getString("nickname"));
					user.setCreateTime(rs.getDate("createTime"));
					return user;
				}
				
			});
		}catch(Exception e){
			return null;
		}
	}

	@Override
	public int saveBgUser(BgUser user) {
		if(user==null){
			return -1;
		}
		StringBuilder sql=new StringBuilder();
		List<Object> args=new ArrayList<Object>();
		if(user.getId()!=0){
			sql.append("update bg_admin set ");
			if(user.getUserName()!=null){
				sql.append("username=?,");
				args.add(user.getUserName());
			}
			if(user.getPassword()!=null){
				sql.append("password=?,");
				args.add(user.getPassword());
			}
			if(user.getSalt()!=null){
				sql.append("salt=?,");
				args.add(user.getSalt());
			}
			if(user.getNickName()!=null){
				sql.append("nickname=?,");
				args.add(user.getNickName());
			}
			sql.setLength(sql.length()-1);
			sql.append(" where id=?");
			args.add(user.getId());
		}else{
			sql.append("insert into bg_admin(username,password,salt,nickname,createTime) values(?,?,?,?,now())");
			args.add(user.getUserName());
			args.add(user.getPassword());
			args.add(user.getSalt());
			args.add(user.getNickName());
		}
		return airJdbcTemplate.update(sql.toString(), args.toArray());
	}

	@Override
	public int deleteBgUserById(int id) {
		String sql="delete from bg_admin where id="+id;
		return airJdbcTemplate.update(sql);
	}
	
	private BgUser mapToBgUser(Map<String,Object> data){
		BgUser user=new BgUser();
		user.setId((Integer)data.get("id"));
		return user;
	}

}
