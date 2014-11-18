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
	 * 下架产品
	 * @param productId
	 * @return
	 */
	public int putProductOffShelves(Product p);
	
	/**
	 * 翻页获取产品信息
	 * @param page
	 * @param query
	 * @return
	 */
	public Pagination<Product> getProducts(Pagination<Product> page,Map<String,Object> query);
	
	/**
	 * 根据id获取Product
	 * @param id
	 * @return
	 */
	public Product getProduct(int id);
	
	/**
	 * 删除产品
	 * @param p
	 * @return
	 */
	public int deleteProduct(Product p);
}
