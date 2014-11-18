package com.hhwork.dao;

import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.Presentation;

public interface PresentationDao {

	/**
	 * 保存一屏内容
	 * @param presentation
	 * @return
	 */
	public int savePresentation(Presentation presentation);
	
	/**
	 * 分页获取产品内容
	 * @param page
	 * @return
	 */
	public Pagination<Presentation> getPresentationList(Pagination<Presentation> page,Map<String,Object>query);
}
