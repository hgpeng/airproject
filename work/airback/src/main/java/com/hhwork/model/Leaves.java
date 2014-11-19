package com.hhwork.model;

import java.io.Serializable;
import java.util.Date;

import com.hhwork.annotation.Table;

/**
 * 留言
 * @author hgpeng
 *
 */
@Table(value="leaves")
public class Leaves implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4667614016583444204L;

	private int id;
	
	private String content;
	
	private String contact;
	
	private int status;
	
	private Date createTime;
	
	private String replyMan;
	
	private String replyContent;
	
	private String phone;
	
	private String mail;

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

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	
	
}
