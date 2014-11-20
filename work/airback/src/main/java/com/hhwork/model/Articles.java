package com.hhwork.model;

import java.io.Serializable;
import java.util.Date;

import com.hhwork.annotation.Column;
import com.hhwork.annotation.Table;

@Table("articles")
public class Articles implements Serializable{

	/**
	 * 
	 */
	@Column(ignore=true)
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
	
	/**是否为推荐文章
	 * 
	 */
	private Integer recommend;
	
	
	private String number;
	
	@Column(ignore=true)
	private String baseData;
	
	@Column(ignore=true)
	private String formattedDate;

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

	public Integer getRecommend() {
		return recommend;
	}

	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}

	public String getBaseData() {
		return baseData;
	}

	public void setBaseData(String baseData) {
		this.baseData = baseData;
	}

	public String getFormattedDate() {
		return formattedDate;
	}

	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	
}
