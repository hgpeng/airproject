package com.hhwork.model;

public class ProductAlbum {

	private int id;
	
	private BaseData path;
	
	private BaseData desc;
	
	private Product product;
	
	private int type;

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

	public BaseData getDesc() {
		return desc;
	}

	public void setDesc(BaseData desc) {
		this.desc = desc;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	
}
