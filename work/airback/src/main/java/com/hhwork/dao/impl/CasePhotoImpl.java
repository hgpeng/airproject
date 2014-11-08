package com.hhwork.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hhwork.common.Pagination;
import com.hhwork.dao.CasePhotoDao;
import com.hhwork.model.AppCase;
import com.hhwork.model.BaseData;
import com.hhwork.model.CasePhoto;

@Repository("casePhotoDao")
public class CasePhotoImpl extends BaseDaoImpl implements CasePhotoDao {

	@Override
	public List<CasePhoto> getCasePhoto(Map<String,Object> param) {
		
		String sql="select id,name,path,caseid from casephoto where 1=1 ";
		if(null!=param.get("caseid")){
			sql += "and caseid= '"+param.get("caseid").toString()+"'";
		}
		List<Map<String,Object>> list=airJdbcTemplate.queryForList(sql);
		if(list==null || list.size()==0){
			return null;
		}
		//转换成菜单
		List<CasePhoto> items=new ArrayList<CasePhoto>();
		for(Map<String,Object> data:list){
			CasePhoto e=new CasePhoto();
			e.setId((Integer)data.get("id"));
			e.setName(null==data.get("name")?"":data.get("name").toString());
			e.setPath(null==data.get("path")?"":data.get("path").toString());
			e.setCaseid((Integer)data.get("caseid"));
			items.add(e);
		}
		return items;
	}

	@Override
	public int saveCasePhoto(CasePhoto casePhoto) {
		if(casePhoto.getId()<=0){
			return saveObject(casePhoto);
		}else{
			return updateObject(casePhoto, casePhoto.getId());
		}
	}

	@Override
	public int deleteCasePhoto(int id) {
		// TODO Auto-generated method stub
		return deleteObjectById(new CasePhoto(),id);
	}

}
