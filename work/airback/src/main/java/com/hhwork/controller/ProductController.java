package com.hhwork.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.hhwork.common.Pagination;
import com.hhwork.model.Product;
import com.hhwork.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController extends BaseController {

	
	@Resource
	protected ProductService productService;
	
	@RequestMapping("productIndex")
	public String productIndex(ModelMap modelMap){
		return "/product/productIndex";
	}
	
	@RequestMapping("getProductList")
	public void getProductList(HttpServletRequest request,
			HttpServletResponse response,Pagination<Product> page){
		Map<String,Object> query=new HashMap<String,Object>();
		Pagination<Product> res=productService.getProductList(page, query);
		outPrint(response,JSONArray.toJSON(res) );
	}
	
	@RequestMapping("saveProductDialog")
	public String saveProductDialog(ModelMap modelMap){
		int productId=getInt("productId");
		return "/product/openProductDialog";
	}
	
	
}
