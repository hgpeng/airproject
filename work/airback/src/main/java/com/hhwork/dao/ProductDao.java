package com.hhwork.dao;

import java.util.Map;

import com.hhwork.common.Pagination;
import com.hhwork.model.Product;

public interface ProductDao {

	/**
	 * 保存产品
	 * @param product
	 * @return
	 */
	public int saveProduct(Product product);
	
	/**
	 * 翻页获取产品信息
	 * @param page
	 * @param query
	 * @return
	 */
	public Pagination<Product> getProducts(Pagination<Product> page,Map<String,Object> query);
}
