package com.hhwork.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hhwork.common.Pagination;
import com.hhwork.dao.LeavesDao;
import com.hhwork.model.Leaves;

@Repository("leavesDao")
public class LeavesDaoImpl extends BaseDaoImpl implements LeavesDao {

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
		// TODO Auto-generated method stub
		return null;
	}

}
