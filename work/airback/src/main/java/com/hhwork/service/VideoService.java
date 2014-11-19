package com.hhwork.service;

import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.Video;

public interface VideoService {

	public int saveVideo(Video video);
	
	/**
	 * 获取视频列表
	 * @param page
	 * @param query
	 * @return
	 */
	public Pagination<Video> getVideoList(Pagination<Video> page,Map<String,Object> query);
}
