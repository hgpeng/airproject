package com.hhwork.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hhwork.common.Constants;
import com.hhwork.common.Pagination;
import com.hhwork.dao.LeavesDao;
import com.hhwork.model.Leaves;
import com.hhwork.service.LeavesService;

@Service("leavesService")
public class LeavesServiceImpl implements LeavesService {

	@Resource
	protected LeavesDao leavesDao;
	
	@Override
	public int replyLeaves(Leaves leaves) {
		leaves.setReplyMan(Constants.ADMIN);
		return leavesDao.updateLeaves(leaves);
	}

	@Override
	public Pagination<Leaves> getLeaves(Pagination<Leaves> page,
			Map<String, Object> params) {
		return leavesDao.getLeaves(page, params);
	}

}
