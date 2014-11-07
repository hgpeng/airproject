package com.hhwork.service;

import com.hhwork.common.Pagination;
import com.hhwork.model.AppCase;

public interface AppCaseService {
public Pagination<AppCase> getAppCase(Pagination<AppCase> page);
	
	/**
	 * 保存文章
	 * @param article
	 * @return
	 */
	public int saveAppCase(AppCase article);
}
