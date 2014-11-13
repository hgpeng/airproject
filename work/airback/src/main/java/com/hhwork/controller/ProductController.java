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
		int productId=getInt("productId",-1);
		if(productId!=-1){
			Product product=productService.getProduct(productId);
			modelMap.put("product", product);
		}
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
		int productId=getInt("id",-1);
		if(productId!=-1){
			p.setId(productId);
		}
		int typeId=getInt("typeId",-1);
		if(typeId!=-1){
			p.setTypeId(typeId);
		}
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
	
	
	@RequestMapping("putOnShelves")
	public void putOnShelves(HttpServletRequest request,
			HttpServletResponse response){
		int productId=getInt("productId",-1);
		int status=getInt("status",-1);
		if(productId==-1 || status==-1){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}
		Product product=new Product();
		product.setId(productId);
		product.setStatus(status);
		int ret=productService.putProductOnOrOffShelves(product);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
	
	
	@RequestMapping("deleteProduct")
	public void deleteProduct(HttpServletRequest request,
			HttpServletResponse response){
		int productId=getInt("productId",-1);
		if(productId==-1){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}
		int ret=productService.deleteProduct(productId);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
}
