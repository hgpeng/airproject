package com.hhwork.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hhwork.common.Constants;
import com.hhwork.common.Pagination;
import com.hhwork.dao.ProductDao;
import com.hhwork.model.Product;
import com.hhwork.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Resource
	protected ProductDao productDao;
	
	@Override
	public int saveProduct(Product p) {
		return productDao.saveProduct(p);
	}

	@Override
	public int putProductOnOrOffShelves(Product p) {
		return productDao.putProductOffShelves(p);
	}

	@Override
	public Pagination<Product> getProductList(Pagination<Product> page,
			Map<String, Object> query) {
		return productDao.getProducts(page, query);
	}

	@Override
	public Product getProduct(int id) {
		return productDao.getProduct(id);
	}

	@Override
	public int deleteProduct(int id) {
		Product p=new Product();
		p.setId(id);
		return productDao.deleteProduct(p);
	}

}
