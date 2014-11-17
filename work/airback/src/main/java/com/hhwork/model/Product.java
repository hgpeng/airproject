package com.hhwork.model;

import java.util.Date;

import com.hhwork.annotation.Column;
import com.hhwork.annotation.Table;

@Table(value="product")
public class Product {

	private int id;
	
	private String name;
	
	@Column(value="descr")
	private String desc;
	
	private String mainPhoto;
	
	private int typeId;
	
	private int status;
	
	private int basedataId;
	
	private Date createTime;
	
	private String createMan;

	private String recPhoto;
	
	private String recommend;
	
	private Integer sortorder;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getMainPhoto() {
		return mainPhoto;
	}

	public void setMainPhoto(String mainPhoto) {
		this.mainPhoto = mainPhoto;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	

	public int getBasedataId() {
		return basedataId;
	}

	public void setBasedataId(int basedataId) {
		this.basedataId = basedataId;
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

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getRecPhoto() {
		return recPhoto;
	}

	public void setRecPhoto(String recPhoto) {
		this.recPhoto = recPhoto;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	public Integer getSortorder() {
		return sortorder;
	}

	public void setSortorder(Integer sortorder) {
		this.sortorder = sortorder;
	}
	
	
}
