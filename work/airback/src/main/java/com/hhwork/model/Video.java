package com.hhwork.model;

import java.io.Serializable;
import java.util.Date;

import com.hhwork.annotation.Column;

public class Video implements Serializable{

	/**
	 * 
	 */
	@Column(ignore=true)
	private static final long serialVersionUID = 3134386749695852076L;

	private int id;
	
	private BaseData path;
	
	private Date createTime;
	
	private BaseData createMan;
	
	private BaseData descr;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public BaseData getPath() {
		return path;
	}

	public void setPath(BaseData path) {
		this.path = path;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public BaseData getCreateMan() {
		return createMan;
	}

	public void setCreateMan(BaseData createMan) {
		this.createMan = createMan;
	}

	public BaseData getDescr() {
		return descr;
	}

	public void setDescr(BaseData descr) {
		this.descr = descr;
	}
	
	
	
}
