package com.hhwork.service;

import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.Product;

public interface ProductService {

	/**
	 * 保存产品
	 * @param p
	 * @return
	 */
	public int saveProduct(Product p);
	
	/**
	 * 下架商品
	 * @param p
	 * @return
	 */
	public int putProductOnOrOffShelves(Product p);
	
	/**
	 * 根据id获取产品
	 * @param id
	 * @return
	 */
	public Product getProduct(int id);
	
	public Pagination<Product> getProductList(Pagination<Product> page,Map<String,Object> query);
}
