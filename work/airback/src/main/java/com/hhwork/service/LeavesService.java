package com.hhwork.service;

import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.Leaves;

public interface LeavesService {

	/**
	 * 回复留言
	 * @param leaves
	 * @return
	 */
	public int replyLeaves(Leaves leaves);
	
	/**
	 * 获取留言列表
	 * @param page
	 * @param params
	 * @return
	 */
	public Pagination<Leaves> getLeaves(Pagination<Leaves> page,Map<String,Object> params);
}
