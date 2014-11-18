package com.hhwork.model;

import com.hhwork.annotation.Table;

@Table(value="appcase")
public class AppCase {
	private int id;
	private String name;
	private String area;
	private String addr;
	private String buildtime;
	private int basedataId;
	private String content;
	
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
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getBuildtime() {
		return buildtime;
	}
	public void setBuildtime(String buildtime) {
		this.buildtime = buildtime;
	}
	public int getBasedataId() {
		return basedataId;
	}
	public void setBasedataId(int basedataId) {
		this.basedataId = basedataId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
