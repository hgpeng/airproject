package com.hhwork.service;

import java.util.List;
import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.AppCase;
import com.hhwork.model.CasePhoto;

public interface AppCaseService {
public Pagination<AppCase> getAppCase(Pagination<AppCase> page);
	
	/**
	 * 保存文章
	 * @param article
	 * @return
	 */
	public int saveAppCase(AppCase article);
	
	public int saveCasePhoto(CasePhoto casePhoto);
	
	public List<CasePhoto> getCasePhoto(Map<String,Object> param);
}
