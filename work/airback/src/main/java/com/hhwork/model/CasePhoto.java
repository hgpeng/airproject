package com.hhwork.model;

import com.hhwork.annotation.Table;

@Table(value="casephoto")
public class CasePhoto {
	private int id;
	private String name;
	private String path;
	private int caseid;
	
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
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getCaseid() {
		return caseid;
	}
	public void setCaseid(int caseid) {
		this.caseid = caseid;
	} 
}
