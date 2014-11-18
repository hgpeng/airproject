<%@page import="com.hhwork.controller.ueditor.Uploader"%>
<%@page import="com.dingjian.base.util.StringUtils"%>
<%@page import="com.dingjian.base.util.SystemConfig"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    Uploader up = new Uploader(request);
    String direct = request.getParameter("direct");
    up.setSavePath(SystemConfig.getParameter("attachment_path") + (StringUtils.isEmpty(direct)?"":("/"+direct)));
    String[] fileType = {".rar" , ".doc" , ".docx" , ".zip" , ".pdf" , ".txt" , ".swf", ".wmv"};  //允许的文件类型
    up.setAllowFiles(fileType);
    up.setMaxSize(10000);        //允许的文件最大尺寸，单位KB
    up.upload();
    response.getWriter().print("{'url':'"+up.getFilePath()+"','fileType':'"+up.getType()+"','state':'"+up.getState()+"','original':'"+up.getOriginalName()+"'}");

%>
