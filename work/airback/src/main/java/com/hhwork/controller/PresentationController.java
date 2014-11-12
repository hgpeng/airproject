package com.hhwork.controller;

import java.util.HashMap;
import java.util.List;
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
import com.hhwork.model.BaseData;
import com.hhwork.model.Presentation;
import com.hhwork.model.Product;
import com.hhwork.service.BaseDataService;
import com.hhwork.service.PresentationService;
import com.hhwork.service.ProductService;

@Controller
@RequestMapping("/presentation/*")
public class PresentationController extends BaseController {

	@Resource
	protected PresentationService presentationService;
	
	@Resource
	protected ProductService productService;
	
	@Resource
	protected BaseDataService baseDataService;
	
	@RequestMapping("presentationIndex")
	public String presentationIndex(ModelMap modelMap){
		int productId=getInt("productId",-1);
		Product product=null;
		if(productId==-1){
			int id=getInt("id",-1);
			Presentation pre=presentationService.getPresentation(id);
			modelMap.put("presentation", pre);
			product=pre.getProduct();
		}else{
			product=productService.getProduct(productId);
		}
		
		if(product==null){
			return "";
		}
		modelMap.put("product", product);
		return "/presentation/presentationIndex";
	}
	
//	@RequestMapping("getPresentationList")
//	public void getPresentationList(HttpServletRequest request,
//			HttpServletResponse response,Pagination<Presentation> page){
//		Map<String,Object> query=new HashMap<String,Object>();
//		Pagination<Presentation> res=presentationService.getPresentation(page, query);
//		outPrint(response,JSONArray.toJSON(res) );
//	}
	
	
	@RequestMapping("savePresentation")
	public void savePresentation(HttpServletRequest request,
			HttpServletResponse response){
		int productId=getInt("productId",-1);
		String num=getString("num");
		String html=getString("html");
		int presentationId=getInt("presentationId",-1);
		if(productId<=0 || StringUtils.isEmpty(html) || StringUtils.isEmpty(num)){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}
		
		Presentation presentation=new Presentation();
		if(presentationId!=-1){
			presentation.setId(presentationId);
		}
		presentation.setProductId(productId);
		presentation.setHtml(html);
		presentation.setNum(num);
		int ret=presentationService.savePresentation(presentation);
		
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
	
	@RequestMapping("manageTemplate")
	public String manageTemplate(ModelMap modelMap){
		int productId=getInt("productId");
		Product product=productService.getProduct(productId);
		if(product==null){
			return "";
		}
		modelMap.put("product", product);
		return "/presentation/manageTemplate";
	}
	
	@RequestMapping("productTemplateList")
	public void productTemplateList(HttpServletRequest request,
			HttpServletResponse response,Pagination<Presentation> page){
		int productId=getInt("productId",-1);
		if(productId==-1){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("productId", productId);
		Pagination<Presentation> res=presentationService.getPresentation(page, params);
		outPrint(response,JSONArray.toJSON(res) );
	}
	
	@RequestMapping("deleteTemplate")
	public void deleteTemplate(HttpServletRequest request,
			HttpServletResponse response){
		int templateId=getInt("templateId",-1);
		if(templateId==-1){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}
		Presentation p=new Presentation();
		p.setId(templateId);
		int ret=presentationService.deletePresentation(p);
		ResponseUtils.renderJson(response, "{\"ret\":\""+ret+"\"}");
	}
	
	@RequestMapping("getTemplateScript")
	public void getTemplateScript(HttpServletRequest request,
			HttpServletResponse response){
		int scriptType=getInt("scriptType",-1);
		//参数不合法
		if(scriptType==-1 || scriptType>=3 || scriptType<1){
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}
		int realTypeId=0;
		if(scriptType==1){//等于1取flash脚本
			realTypeId=Constants.BaseType.FLASH;
		}else{//等于2的情况取Html脚本
			realTypeId=Constants.BaseType.HTML;
		}
		List<BaseData> baseDatas=baseDataService.getBaseDataByBaseTypeId(realTypeId);
		if(baseDatas!=null && baseDatas.size()>0){
			BaseData baseData=baseDatas.get(0);
			String script=baseData.getDesc();
			ResponseUtils.renderJson(response, "{\"ret\":\"1\",\"script\":\""+script+"\"}");
		}
	}
}
