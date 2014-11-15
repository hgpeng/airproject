package com.hhwork.dao;

import com.hhwork.common.Pagination;
import com.hhwork.model.AppCase;

public interface AppCaseDao {
	
	public Pagination<AppCase> getAppCase(Pagination<AppCase> page);
	
	/**
	 * 保存文章
	 * @param article
	 * @return
	 */
	public int saveAppCase(AppCase appcase);
	
	/**
	 * 删除文章
	 * @param id
	 * @return
	 */
	public int deleteAppCase(int id);
	
	public AppCase getAppCase(int id);
}
