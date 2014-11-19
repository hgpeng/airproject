package com.hhwork.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hhwork.common.Pagination;
import com.hhwork.dao.VideoDao;
import com.hhwork.model.Video;
import com.hhwork.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService{

	@Resource
	protected VideoDao videoDao;
	
	@Override
	public int saveVideo(Video video) {
		return videoDao.saveVideo(video);
	}

	@Override
	public Pagination<Video> getVideoList(Pagination<Video> page,
			Map<String, Object> query) {
		return videoDao.getVideoList(page, query);
	}

}
