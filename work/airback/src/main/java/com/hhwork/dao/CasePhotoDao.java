package com.hhwork.dao;

import java.util.List;
import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.CasePhoto;

public interface CasePhotoDao {
	
	public List<CasePhoto> getCasePhoto(Map<String,Object> param);
	
	/**
	 * 保存文章
	 * @param article
	 * @return
	 */
	public int saveCasePhoto(CasePhoto casePhoto);
	
	/**
	 * 删除文章
	 * @param id
	 * @return
	 */
	public int deleteCasePhoto(int id);
}
