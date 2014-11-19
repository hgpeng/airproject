package com.hhwork.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.stereotype.Repository;

import com.hhwork.common.Pagination;
import com.hhwork.dao.VideoDao;
import com.hhwork.model.Video;

@Repository("videoDao")
public class VideoDaoImpl extends BaseDaoImpl implements VideoDao {

	@Resource
	ProxoolDataSource airDataSource;
	
	@Override
	public int saveVideo(Video video) {
		if(video.getId()>0){
			return updateObject(video, video.getId());
		}else{
			return saveObject(video);
		}
	}

	@Override
	public Pagination<Video> getVideoList(Pagination<Video> page,
			Map<String, Object> query) {
		StringBuilder sql=new StringBuilder("select SQL_CALC_FOUND_ROWS id,path,createTime,createMan ");
		sql.append("from video where 1=1 ");
		List<Object> args=new ArrayList<Object>();
		sql.append(" order by createTime desc");
		return null;
	}

}
