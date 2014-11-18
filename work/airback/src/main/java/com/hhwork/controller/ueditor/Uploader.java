package com.hhwork.controller.ueditor;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadBase.InvalidContentTypeException;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import sun.misc.BASE64Decoder;

public class Uploader
{
  private String url = "";

  private String fileName = "";

  private String state = "";

  private String type = "";

  private String originalName = "";

  private String size = "";

  private HttpServletRequest request = null;
  private String title = "";

  private String savePath = "upload";

  private String filePath = "";

  private String[] allowFiles = { ".rar", ".doc", ".docx", ".zip", ".pdf", ".txt", ".swf", ".wmv", ".gif", ".png", ".jpg", ".jpeg", ".bmp" };

  private int maxSize = 10000;

  private HashMap<String, String> errorInfo = new HashMap();

  public Uploader(HttpServletRequest request) {
    this.request = request;
    HashMap tmp = this.errorInfo;
    tmp.put("SUCCESS", "SUCCESS");
    tmp.put("NOFILE", "未包含文件上传域");
    tmp.put("TYPE", "不允许的文件格式");
    tmp.put("SIZE", "文件大小超出限制");
    tmp.put("ENTYPE", "请求类型ENTYPE错误");
    tmp.put("REQUEST", "上传请求异常");
    tmp.put("IO", "IO异常");
    tmp.put("DIR", "目录创建失败");
    tmp.put("UNKNOWN", "未知错误");
  }

  public void upload() throws Exception
  {
    boolean isMultipart = ServletFileUpload.isMultipartContent(this.request);
    if (!isMultipart) {
      this.state = ((String)this.errorInfo.get("NOFILE"));
      return;
    }
    DiskFileItemFactory dff = new DiskFileItemFactory();
    String savePath = getFolder(this.savePath);
    dff.setRepository(new File(savePath));
    try {
      ServletFileUpload sfu = new ServletFileUpload(dff);
      sfu.setSizeMax(this.maxSize * 1024);
      sfu.setHeaderEncoding("utf-8");
      FileItemIterator fii = sfu.getItemIterator(this.request);
      while (fii.hasNext()) {
        FileItemStream fis = fii.next();
        if (!fis.isFormField()) {
          this.originalName = fis.getName().substring(fis.getName().lastIndexOf(System.getProperty("file.separator")) + 1);
          if (!checkFileType(this.originalName)) {
            this.state = ((String)this.errorInfo.get("TYPE"));
            continue;
          }
          this.fileName = getName(this.originalName);
          this.type = getFileExt(this.fileName);
          this.url = new StringBuilder().append(savePath).append("/").append(this.fileName).toString();
          this.filePath = this.url.substring(this.savePath.length());
          BufferedInputStream in = new BufferedInputStream(fis.openStream());
          FileOutputStream out = new FileOutputStream(new File(this.url));
          BufferedOutputStream output = new BufferedOutputStream(out);
          Streams.copy(in, output, true);
          this.state = ((String)this.errorInfo.get("SUCCESS"));

          break;
        }
        String fname = fis.getFieldName();

        if (!fname.equals("pictitle")) {
          continue;
        }
        BufferedInputStream in = new BufferedInputStream(fis.openStream());
        BufferedReader reader = new BufferedReader(new InputStreamReader(in));
        StringBuffer result = new StringBuffer();
        while (reader.ready()) {
          result.append((char)reader.read());
        }
        this.title = new String(result.toString().getBytes(), "utf-8");
        reader.close();
      }
    }
    catch (FileUploadBase.SizeLimitExceededException e)
    {
      this.state = ((String)this.errorInfo.get("SIZE"));
    } catch (FileUploadBase.InvalidContentTypeException e) {
      this.state = ((String)this.errorInfo.get("ENTYPE"));
    } catch (FileUploadException e) {
      this.state = ((String)this.errorInfo.get("REQUEST"));
    } catch (Exception e) {
      this.state = ((String)this.errorInfo.get("UNKNOWN"));
    }
  }

  public void uploadBase64(String fieldName)
  {
    String savePath = getFolder(this.savePath);
    String base64Data = this.request.getParameter(fieldName);
    this.fileName = getName("test.png");
    this.url = new StringBuilder().append(savePath).append("/").append(this.fileName).toString();
    BASE64Decoder decoder = new BASE64Decoder();
    try {
      File outFile = new File(this.url);
      OutputStream ro = new FileOutputStream(outFile);
      byte[] b = decoder.decodeBuffer(base64Data);
      for (int i = 0; i < b.length; i++) {
        if (b[i] < 0)
        {
          int tmp124_122 = i;
          byte[] tmp124_120 = b; tmp124_120[tmp124_122] = (byte)(tmp124_120[tmp124_122] + 256);
        }
      }
      ro.write(b);
      ro.flush();
      ro.close();
      this.state = ((String)this.errorInfo.get("SUCCESS"));
    } catch (Exception e) {
      this.state = ((String)this.errorInfo.get("IO"));
    }
  }

  private boolean checkFileType(String fileName)
  {
    Iterator type = Arrays.asList(this.allowFiles).iterator();
    while (type.hasNext()) {
      String ext = (String)type.next();
      if (fileName.toLowerCase().endsWith(ext)) {
        return true;
      }
    }
    return false;
  }

  private String getFileExt(String fileName)
  {
    return fileName.substring(fileName.lastIndexOf("."));
  }

  private String getName(String fileName)
  {
    Random random = new Random();
    return this.fileName = new StringBuilder().append("").append(random.nextInt(10000)).append(System.currentTimeMillis()).append(getFileExt(fileName)).toString();
  }

  private String getFolder(String path)
  {
    SimpleDateFormat formater = new SimpleDateFormat("yyyyMMdd");
    path = new StringBuilder().append(path).append(path.endsWith("/") ? "" : "/").append(formater.format(new Date())).toString();
    File dir = new File(path);
    if (!dir.exists()) {
      try {
        dir.mkdirs();
      } catch (Exception e) {
        this.state = ((String)this.errorInfo.get("DIR"));
        return "";
      }
    }
    return path;
  }

  public void setSavePath(String savePath) {
    this.savePath = savePath;
  }

  public void setAllowFiles(String[] allowFiles) {
    this.allowFiles = allowFiles;
  }

  public void setMaxSize(int size) {
    this.maxSize = size;
  }

  public String getSize() {
    return this.size;
  }

  public String getUrl() {
    return this.url;
  }

  public String getFileName() {
    return this.fileName;
  }

  public String getState() {
    return this.state;
  }

  public String getTitle() {
    return this.title;
  }

  public String getType() {
    return this.type;
  }

  public String getOriginalName() {
    return this.originalName;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  public String getFilePath() {
    return this.filePath;
  }
}