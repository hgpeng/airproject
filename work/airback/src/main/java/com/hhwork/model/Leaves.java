package com.hhwork.model;

import java.util.Date;

import com.hhwork.annotation.Table;

/**
 * 留言
 * @author hgpeng
 *
 */
@Table(value="leaves")
public class Leaves {

	private int id;
	
	private String content;
	
	private String contact;
	
	private int status;
	
	private Date createTime;
	
	private String replyMan;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
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

	public String getReplyMan() {
		return replyMan;
	}

	public void setReplyMan(String replyMan) {
		this.replyMan = replyMan;
	}
	
	
}
