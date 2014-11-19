package com.hhwork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.d3.d396333.common.util.ResponseUtils;
import com.hhwork.common.Constants;
import com.hhwork.common.Pagination;
import com.hhwork.model.AppCase;
import com.hhwork.model.BaseData;
import com.hhwork.model.CasePhoto;
import com.hhwork.service.AppCaseService;
import com.hhwork.service.BaseDataService;

@Controller
@RequestMapping("/case/*")
public class CaseController extends BaseController {

	@Autowired
	private AppCaseService appCaseService;

	@Resource
	protected BaseDataService baseDataService;

	@RequestMapping("list")
	public String menuIndex() {
		return "/case/list";
	}

	/**
	 * 获取基础数据
	 * 
	 * @param request
	 * @param response
	 * @param page
	 */
	@RequestMapping("getCaseData")
	public void getAppCaseData(HttpServletRequest request,
			HttpServletResponse response, Pagination<AppCase> page) {
		Pagination<AppCase> res = appCaseService.getAppCase(page);
		outPrint(response, JSONArray.toJSON(res));
	}

	@RequestMapping("saveCaseDialog")
	public String saveCaseDialog(ModelMap modelMap) {
		List<BaseData> bdlist = baseDataService
				.getBaseDataByBaseTypeId(Constants.BaseType.CASE);
		modelMap.put("bdlist", bdlist);

		int caseId = getInt("id", -1);
		if (caseId != -1) {
			AppCase app = appCaseService.getAppCase(caseId);
			modelMap.put("data", app);
		}

		return "/case/saveCaseDialog";
	}

	@ResponseBody
	@RequestMapping("saves")
	public void saveAppCase(HttpServletResponse response) {
		String id = this.getString("id");
		String name = this.getString("name");
		String area = this.getString("area");
		String addr = this.getString("addr");
		String buildtime = this.getString("buildtime");
		int basedataId = Integer.parseInt(this.getString("basedataId"));
		String content = this.getString("content");
		String name_en = this.getString("name_en");
		String photo = this.getString("photo");
		AppCase app = new AppCase();
		if (StringUtils.isBlank(name)) {
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}

		if (!StringUtils.isBlank(id)) {
			app = this.appCaseService.getAppCase(Integer.parseInt(id));
		}

		app.setAddr(addr);
		app.setArea(area);
		app.setName(name);
		app.setBuildtime(buildtime);
		app.setContent(content);
		app.setBasedataId(basedataId);
		app.setName_en(name_en);
		app.setPhoto(photo);
		int ret = appCaseService.saveAppCase(app);
		ResponseUtils.renderJson(response, "{\"ret\":\"" + ret + "\"}");
	}

	@RequestMapping("uploadphoto")
	public String uploadphoto(ModelMap modelMap) {
		String caseid = this.getString("id");
		modelMap.put("caseid", caseid);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("caseid", caseid);
		List<CasePhoto> cplist = this.appCaseService.getCasePhoto(param);
		modelMap.put("cplist", cplist);
		return "/case/uploadphoto";
	}

	@ResponseBody
	@RequestMapping("savesPhoto")
	public void savesPhoto(HttpServletResponse response) {

		String caseid = this.getString("caseid");
		String path = this.getString("path");
		CasePhoto app = new CasePhoto();
		if (StringUtils.isBlank(caseid)) {
			ResponseUtils.renderJson(response, "{\"ret\":-1}");
			return;
		}
		app.setCaseid(Integer.parseInt(caseid));
		app.setPath(path);

		int ret = appCaseService.saveCasePhoto(app);
		ResponseUtils.renderJson(response, "{\"ret\":\"" + ret + "\"}");
	}

	@RequestMapping("delete")
	public void delete(HttpServletResponse response) {
		int id = getInt("id", -1);
		int ret = appCaseService.deleteAppCase(id);
		ResponseUtils.renderJson(response, "{\"ret\":\"" + ret + "\"}");
	}
}
