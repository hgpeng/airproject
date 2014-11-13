package com.hhwork.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hhwork.common.Pagination;
import com.hhwork.dao.AppCaseDao;
import com.hhwork.dao.ArticlesDao;
import com.hhwork.dao.CasePhotoDao;
import com.hhwork.model.AppCase;
import com.hhwork.model.CasePhoto;
import com.hhwork.service.AppCaseService;

@Service("appCaseService")
public class AppCaseServiceImpl implements AppCaseService {

	@Resource
	protected AppCaseDao appCaseDao;
	
	@Resource
	protected CasePhotoDao casePhotoDao;
	
	@Override
	public Pagination<AppCase> getAppCase(Pagination<AppCase> page) {
		// TODO Auto-generated method stub
		return appCaseDao.getAppCase(page);
	}

	@Override
	public int saveAppCase(AppCase article) {
		// TODO Auto-generated method stub
		return appCaseDao.saveAppCase(article);
	}

	@Override
	public int saveCasePhoto(CasePhoto casePhoto) {
		// TODO Auto-generated method stub
		return casePhotoDao.saveCasePhoto(casePhoto);
	}

	@Override
	public List<CasePhoto> getCasePhoto(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return casePhotoDao.getCasePhoto(param);
	}

	@Override
	public int deleteAppCase(int id) {
		
		return appCaseDao.deleteAppCase(id);
	}

}
