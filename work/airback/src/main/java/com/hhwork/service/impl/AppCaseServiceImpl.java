package com.hhwork.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hhwork.common.Pagination;
import com.hhwork.dao.AppCaseDao;
import com.hhwork.dao.ArticlesDao;
import com.hhwork.model.AppCase;
import com.hhwork.service.AppCaseService;

@Service("appCaseService")
public class AppCaseServiceImpl implements AppCaseService {

	@Resource
	protected AppCaseDao appCaseDao;
	
	@Override
	public Pagination<AppCase> getAppCase(Pagination<AppCase> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int saveAppCase(AppCase article) {
		// TODO Auto-generated method stub
		return 0;
	}

}
