/**
 * com.dingjian.framework.compoment.ImageController.java
 */
package com.hhwork.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.dingjian.base.common.ImageAttribute;
import com.dingjian.base.util.ImageUtil;
import com.dingjian.base.util.StringUtils;
import com.dingjian.base.util.SystemConfig;

/**
 * 图片处理Controller
 * @author FengMy
 * 
 * @since 2012-10-29
 */
@Controller
@RequestMapping(value="/imgupload/*")
public class ImageController extends BaseController {
	
	/**
	 * 图片上传时name必须为image,必须指定图片存放相对路径direct(如:person/head - > /usr/local/appData/images/person/head)
	 * @param file
	 * @param dir
	 * @param response
	 * @throws IOException 
	 */
	@RequestMapping(value="upload",method=RequestMethod.POST)
	public void upload(@RequestParam(value="image")MultipartFile file,
			@RequestParam(value="fileName",required=false)String ordingName,
			@RequestParam(value="direct",required=true)String dir,
			HttpServletResponse response) throws IOException{
		if(!file.isEmpty()){
			File path = new File(SystemConfig.getParameter("image_path") + dir);
			if(!path.exists()){
				path.mkdirs();
			}
			
			String fileName = file.getOriginalFilename();
			
			fileName = (StringUtils.isEmpty(ordingName)?UUID.randomUUID().toString():ordingName) + fileName.substring(fileName.lastIndexOf("."));
			File img = new File(path.getPath() + "/" + fileName);
			if(img.exists()){
				getOutputMsg().put("STATE", "FAIL");
				getOutputMsg().put("MSG", "该文件己存在");
			}else{
				img.createNewFile();
				FileOutputStream fos = new FileOutputStream(img);
				InputStream is = file.getInputStream();
				byte[] buff = new byte[4096];//缓存4k
				int len = 0;
				while((len=is.read(buff))>0){
					fos.write(buff, 0, len);
				}
				is.close();
				fos.flush();
				fos.close();
				getOutputMsg().put("STATE", "SUCCESS");
				getOutputMsg().put("MSG", "上传文件成功");
				getOutputMsg().put("PATH", dir + "/" + fileName);
			}
		}else{
			getOutputMsg().put("STATE", "FAIL");
			getOutputMsg().put("MSG", "上传文件为空");
		}
		outPrint(response, JSONObject.toJSON(getOutputMsg()));
	}
	
	@RequestMapping(value={"compressUpload"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	  public void compressUpload(@RequestParam("image") MultipartFile file, 
			  @RequestParam(value="fileName", required=false) String ordingName, 
			  @RequestParam(value="direct", required=true) String dir, 
			  HttpServletResponse response)
	    throws IOException, InterruptedException, ExecutionException
	  {
	    byte[] bytes = file.getBytes();
	    String fileName = file.getOriginalFilename();
	    String path = new StringBuilder().append(SystemConfig.getParameter("image_path")).append(dir).toString();
	    String suffix = fileName.substring(fileName.lastIndexOf("."));
	    File folder = new File(new StringBuilder().append(SystemConfig.getParameter("image_path")).append(dir).toString());
	    if (!folder.exists()) {
	      folder.mkdirs();
	    }

	    List list = new ArrayList();

	    ImageAttribute imgattr = new ImageAttribute(null, null, true);
	    list.add(imgattr);

	    if (dir.indexOf("myProject") > -1) {
	      imgattr = new ImageAttribute(Integer.valueOf(75), Integer.valueOf(75), true);
	      list.add(imgattr);
	      imgattr = new ImageAttribute(Integer.valueOf(900), Integer.valueOf(600), true);
	      list.add(imgattr);
	      imgattr = new ImageAttribute(Integer.valueOf(300), Integer.valueOf(200), true);
	      list.add(imgattr);
	    }

	    String url = ImageUtil.compressSave(bytes, path, suffix, list);

	    getOutputMsg().put("STATE", "SUCCESS");
	    getOutputMsg().put("MSG", "上传文件成功");

	    getOutputMsg().put("PATH", new StringBuilder().append(dir).append("/").append(url).append("_size").append(suffix).toString());
	    getOutputMsg().put("TARGET_EL", getString("TARGET_EL"));
	    response.setContentType("text/html");
	    outPrint(response, JSONObject.toJSON(getOutputMsg()));
	  }
	
	
}
