package com.hhwork.dao;

import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.Leaves;

public interface LeavesDao {

	/**
	 * 保存留言
	 * @param leaves
	 * @return
	 */
	public int saveLeaves(Leaves leaves);
	
	/**
	 * 保存留言
	 * @param leaves
	 * @return
	 */
	public int updateLeaves(Leaves leaves);
	
	/**
	 * 获取留言列表
	 * @param leaves
	 * @param query
	 * @return
	 */
	public Pagination<Leaves> getLeaves(Pagination<Leaves> leaves,Map<String,Object> query);
	
}
