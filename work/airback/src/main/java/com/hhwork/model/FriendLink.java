package com.hhwork.model;

import java.util.Date;

/**
 * ��������
 * @author hgpeng
 *
 */
public class FriendLink {

	
	private int id;
	
	private BaseData text;
	
	private BaseData link;
	
	private BaseData icon;
	
	private Date createTime;
	
	private BaseData createMan;
	
	private int status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public BaseData getText() {
		return text;
	}

	public void setText(BaseData text) {
		this.text = text;
	}

	public BaseData getLink() {
		return link;
	}

	public void setLink(BaseData link) {
		this.link = link;
	}

	public BaseData getIcon() {
		return icon;
	}

	public void setIcon(BaseData icon) {
		this.icon = icon;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
