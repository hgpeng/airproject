package com.hhwork.model;

import java.io.Serializable;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;


public class Articles implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9154435536662419948L;

	private int id;
	
	private String title;
	
	private String content;
	
	private String img;
	
	private String preview;
	
	private int type;
	
	private int status;
	
	private Date createTime;
	
	private String createMan;

	//
	private List<String> imglist;
	
	//
	private BaseData basedata;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateMan() {
		return createMan;
	}

	public void setCreateMan(String createMan) {
		this.createMan = createMan;
	}

	public List<String> getImglist() {
		if(StringUtils.isEmpty(img)) return null;
		String[] imgary = img.split(",");
		List<String> imglist = Arrays.asList(imgary);
		return imglist;
	}

	public void setImglist(List<String> imglist) {
		this.imglist = imglist;
	}

	public BaseData getBasedata() {
		return basedata;
	}

	public void setBasedata(BaseData basedata) {
		this.basedata = basedata;
	}
	
	
}
