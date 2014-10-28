package com.hhwork.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.dingjian.base.dao.QueryExecutor;
import com.dingjian.base.spring.DataSourceHolder;

public abstract class BaseController
{
	private Logger log = Logger.getLogger(BaseController.class);
private static ThreadLocal<Map<String, Object>> outPutMsg = new ThreadLocal();

@Resource(name="queryExecutor")
protected QueryExecutor queryExecutor;

protected HttpServletRequest getRequest() {
  return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
}

protected HttpSession getSession()
{
  return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession();
}

protected ServletContext getServletContext()
{
  return ContextLoader.getCurrentWebApplicationContext().getServletContext();
}


public String getString(String name) {
  return getString(name, null);
}

public String getString(String name, String defaultValue) {
  String resultStr = getRequest().getParameter(name);
  if ((resultStr == null) || ("".equals(resultStr)) || ("null".equals(resultStr)) || ("undefined".equals(resultStr)))
  {
    return defaultValue;
  }
  return resultStr;
}

public void outPrint(HttpServletResponse response, Object result)
{
  try
  {
    response.setCharacterEncoding("utf-8");
    PrintWriter out = response.getWriter();
    out.print(result.toString());
    getOutputMsg().clear();
  } catch (IOException e) {
    log.error(e);
  }
}


public Map<String, Object> getOutputMsg()
{
  Map output = (Map)outPutMsg.get();
  if (output == null) {
    output = new HashMap();
    outPutMsg.set(output);
  }
  return output;
}

protected void setOutputMsg(String key, String value) {
  getOutputMsg().put(key, value);
}

protected Map<String, String> getParamMap()
{
  Map parameters = new HashMap();
  Map map = getRequest().getParameterMap();
  Set keys = map.keySet();
  for (Iterator i$ = keys.iterator(); i$.hasNext(); ) { Object key = i$.next();
    parameters.put(key.toString(), getRequest().getParameter(key.toString()));
  }
  return parameters;
}

protected Map<String, Object> getParaMap()
{
  Map parameters = new HashMap();
  Map map = getRequest().getParameterMap();
  Set keys = map.keySet();
  for (Iterator i$ = keys.iterator(); i$.hasNext(); ) { Object key = i$.next();
    Object o = getRequest().getParameter(key.toString());
    if (((o instanceof String)) && 
      ("".equals(o))) {
      o = null;
    }

    parameters.put(key.toString(), o);
  }
  return parameters;
}

public int getInt(String name) {
  return getInt(name, 0);
}

public int getInt(String name, int defaultValue) {
  String resultStr = getRequest().getParameter(name);
  if (resultStr != null) {
    try {
      return Integer.parseInt(resultStr);
    } catch (Exception e) {
      return defaultValue;
    }
  }
  return defaultValue;
}

public BigDecimal getBigDecimal(String name) {
  return getBigDecimal(name, null);
}

public BigDecimal getBigDecimal(String name, BigDecimal defaultValue) {
  String resultStr = getRequest().getParameter(name);
  if (resultStr != null) {
    try {
      return BigDecimal.valueOf(Double.parseDouble(resultStr));
    } catch (Exception e) {
      return defaultValue;
    }
  }
  return defaultValue;
}

public boolean hasPermission(String permissionId)
{
  Map permissionMap = (Map)getSession().getAttribute("PERSONAL_PERMISSION_MAP");
  return (permissionMap != null) && (permissionMap.containsKey(permissionId)) ? checkPermission((String)permissionMap.get(permissionId)) : false;
}

public boolean checkPermission(String method)
{
  Set personPermission = (Set)getSession().getAttribute("PERSONAL-PERMISSION");
  Set wholePermission = (Set)getSession().getServletContext().getAttribute(new StringBuilder().append("WHOLE-PERMISSIONMETHODS-").append(DataSourceHolder.getDataSource()).toString());
  if ((wholePermission != null) && (wholePermission.contains(method)))
  {
    return personPermission != null ? personPermission.contains(method) : false;
  }

  return true;
}

public String getIpAddr(HttpServletRequest request)
{
  String ip = request.getHeader("x-forwarded-for");
  if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
    ip = request.getHeader("Proxy-Client-IP");
  }
  if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
    ip = request.getHeader("WL-Proxy-Client-IP");
  }
  if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
    ip = request.getRemoteAddr();
  }
  return ip;
}

public void putCommonPath() {
  int port = getRequest().getServerPort();
  String scheme = getRequest().getScheme();
  String path = new StringBuilder().append(getRequest().getScheme()).append("://").append(getRequest().getServerName()).append((("http".equals(scheme)) && (port == 80)) || (("https".equals(scheme)) && (port == 443)) ? "" : new StringBuilder().append(":").append(port).toString()).append(getRequest().getContextPath()).toString();
  getSession().setAttribute("base", path);
  getSession().setAttribute("imgBase", new StringBuilder().append(path).append("/images").toString());
  getSession().setAttribute("imgPrePath", new StringBuilder().append(path).append("/default/style/images").toString());
  getSession().setAttribute("initImagePath", new StringBuilder().append(path).append("/default").toString());
}

protected String getBasePath() {
  int port = getRequest().getServerPort();
  String scheme = getRequest().getScheme();
  String path = new StringBuilder().append(getRequest().getScheme()).append("://").append(getRequest().getServerName()).append((("http".equals(scheme)) && (port == 80)) || (("https".equals(scheme)) && (port == 443)) ? "" : new StringBuilder().append(":").append(port).toString()).append(getRequest().getContextPath()).toString();
  return path;
}

protected boolean isMobileDevice() {
  String qhd = getRequest().getHeader("user-agent");
  if (qhd != null) {
    if (qhd.indexOf("Android") > -1)
      return true;
    if (qhd.indexOf("iPhone") > -1)
      return true;
    if (qhd.indexOf("iPad") > -1)
      return true;
    if ((qhd.indexOf("Windows") < 0) && (qhd.indexOf("Linux") < 0)) {
      return true;
    }
  }
  return false;
}	
}
