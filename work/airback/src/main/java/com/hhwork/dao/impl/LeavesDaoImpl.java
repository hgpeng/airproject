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
import com.hhwork.dao.LeavesDao;
import com.hhwork.model.Leaves;
import com.hhwork.utils.SQLHelpers;

@Repository("leavesDao")
public class LeavesDaoImpl extends BaseDaoImpl implements LeavesDao {

	@Resource
	ProxoolDataSource airDataSource;
	
	@Override
	public int saveLeaves(Leaves leaves) {
		return saveObject(leaves);
	}

	@Override
	public int updateLeaves(Leaves leaves) {
		return updateLeaves(leaves);
	}

	@Override
	public Pagination<Leaves> getLeaves(Pagination<Leaves> leaves,
			Map<String, Object> query) {
		StringBuilder sql=new StringBuilder();
		sql.append("select SQL_CALC_FOUND_ROWS id,content,contact,status,createTime,replyMan,replyContent from leaves");
		sql.append(" order by createTime desc");
		List<Object> args=new ArrayList<Object>();
		return SQLHelpers.getRowSize(sql.toString(), airDataSource, args.toArray(), leaves, new PageMapper<Leaves>(){

			@Override
			public Leaves toCustomizedBean(ResultSet rs) throws SQLException {
				Leaves leaves=new Leaves();
				leaves.setId(rs.getInt("id"));
				leaves.setContent(rs.getString("content"));
				leaves.setContact(rs.getString("contact"));
				leaves.setStatus(rs.getInt("status"));
				leaves.setCreateTime(rs.getDate("createTime"));
				leaves.setReplyMan(rs.getString("replyMan"));
				leaves.setReplyContent(rs.getString("replyContent"));
				return leaves;
			}
			
		});
	}

}
