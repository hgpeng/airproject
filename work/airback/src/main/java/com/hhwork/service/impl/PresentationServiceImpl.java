package com.hhwork.service.impl;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hhwork.common.Constants;
import com.hhwork.common.Pagination;
import com.hhwork.dao.PresentationDao;
import com.hhwork.model.Presentation;
import com.hhwork.service.PresentationService;

@Service("presentationService")
public class PresentationServiceImpl implements PresentationService {

	@Resource
	protected PresentationDao presentationDao;
	
	@Override
	public int savePresentation(Presentation presentation) {
		presentation.setCreateTime(new Date());
		presentation.setCreateMan(Constants.ADMIN);
		return presentationDao.savePresentation(presentation);
	}

	@Override
	public Pagination<Presentation> getPresentation(
			Pagination<Presentation> page, Map<String, Object> query) {
		return presentationDao.getPresentationList(page, query);
	}

	@Override
	public int deletePresentation(Presentation p) {
		return presentationDao.deletePresentation(p);
	}

	@Override
	public Presentation getPresentation(int id) {
		return presentationDao.getPresentationById(id);
	}

}
