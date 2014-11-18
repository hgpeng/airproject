package com.hhwork.service;

import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.Presentation;

public interface PresentationService {

	/**
	 * 保存展示模板
	 * @param presentation
	 * @return
	 */
	public int savePresentation(Presentation presentation);
	
	/**
	 * 
	 * @param page
	 * @param query
	 * @return
	 */
	public Pagination<Presentation> getPresentation(Pagination<Presentation> page,Map<String,Object> query);
	
	
	/**
	 * 删除模板
	 * @param p
	 */
	public int deletePresentation(Presentation p);
	
	/**
	 * 获取模板
	 * @param id
	 * @return
	 */
	public Presentation getPresentation(int id);
}
