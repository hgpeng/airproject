package com.hhwork.model;

import java.io.Serializable;
import java.util.Date;

import com.hhwork.annotation.Column;
import com.hhwork.annotation.Table;

@Table(value="presentation")
public class Presentation implements Serializable{

	/**
	 * 
	 */
	@Column(ignore=true)
	private static final long serialVersionUID = -5571839730696316529L;
	
	private int id;
	
	private int productId;
	
	/**
	 * 关联的产品
	 */
	private Integer detail;
	
	private String num;
	
	private String html;
	
	private Date createTime;
	
	private String createMan;

	@Column(ignore=true)
	private Product product;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
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

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getDetail() {
		return detail;
	}

	public void setDetail(Integer detail) {
		this.detail = detail;
	}
	
	
	
	

}
