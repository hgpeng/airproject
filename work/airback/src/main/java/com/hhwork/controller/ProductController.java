package com.hhwork.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.d3.d396333.common.util.ResponseUtils;
import com.dingjian.base.util.StringUtils;
import com.hhwork.common.Constants;
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
	
	@RequestMapping("saveProduct")
	public void saveProduct(HttpServletRequest request,
			HttpServletResponse response){
		String name=getString("name");
		String desc=getString("desc");
		String mainPhoto=getString("mainPhoto");
		if(StringUtils.isEmpty(name)){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}
		if(StringUtils.isEmpty(desc)){
			desc="";
		}
		if(StringUtils.isEmpty(mainPhoto)){
			mainPhoto="";
		}
		Product p=new Product();
		p.setCreateTime(new Date());
		p.setName(name);
		p.setDesc(desc);
		p.setMainPhoto(mainPhoto);
		//默认下架
		p.setStatus(Constants.ProductStatus.OffShelves);
		p.setCreateMan(Constants.ADMIN);
		int ret=productService.saveProduct(p);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
	
	
}