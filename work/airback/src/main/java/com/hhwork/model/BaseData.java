package com.hhwork.model;

import java.util.Date;
import java.util.List;

import com.hhwork.annotation.Column;
import com.hhwork.annotation.Table;

@Table(value="basedata")
public class BaseData {

	private int id;
	
	private int parentId;
	
	private int typeId;
	
	private String name;
	
	private String icon;
	
	private String url;
	
	private String desc;
	
	private Date createTime;
	
	private String createMan;
	
	private String name_en;
	
	@Column(ignore=true)
	private List<BaseData> childrens;

	@Column(ignore=true)
	private String baseType;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
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

	public List<BaseData> getChildrens() {
		return childrens;
	}

	public void setChildrens(List<BaseData> childrens) {
		this.childrens = childrens;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getBaseType() {
		return baseType;
	}

	public void setBaseType(String baseType) {
		this.baseType = baseType;
	}

	public String getName_en() {
		return name_en;
	}

	public void setName_en(String name_en) {
		this.name_en = name_en;
	}
	
	
}
