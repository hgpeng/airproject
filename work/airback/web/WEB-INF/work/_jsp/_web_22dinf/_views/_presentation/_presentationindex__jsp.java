/*
 * JSP generated by Resin-3.1.4 (built Tue, 04 Dec 2007 05:30:53 PST)
 */

package _jsp._web_22dinf._views._presentation;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;

public class _presentationindex__jsp extends com.caucho.jsp.JavaPage
{
  private static final java.util.HashMap<String,java.lang.reflect.Method> _jsp_functionMap = new java.util.HashMap<String,java.lang.reflect.Method>();
  private boolean _caucho_isDead;
  
  public void
  _jspService(javax.servlet.http.HttpServletRequest request,
              javax.servlet.http.HttpServletResponse response)
    throws java.io.IOException, javax.servlet.ServletException
  {
    javax.servlet.http.HttpSession session = request.getSession(true);
    com.caucho.server.webapp.WebApp _jsp_application = _caucho_getApplication();
    javax.servlet.ServletContext application = _jsp_application;
    com.caucho.jsp.PageContextImpl pageContext = com.caucho.jsp.QJspFactory.allocatePageContext(this, _jsp_application, request, response, null, session, 8192, true, false);
    javax.servlet.jsp.JspWriter out = pageContext.getOut();
    final javax.el.ELContext _jsp_env = pageContext.getELContext();
    javax.servlet.ServletConfig config = getServletConfig();
    javax.servlet.Servlet page = this;
    response.setContentType("text/html; charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    try {
      out.write(_jsp_string0, 0, _jsp_string0.length);
      
int port = request.getServerPort();
String scheme = request.getScheme();
String path = request.getScheme()+"://"+request.getServerName() + ((("http".equals(scheme) && port == 80) ||("https".equals(scheme)  && port == 443)) ? "" : ":" + port) + request.getContextPath();
request.setAttribute("base", path);
request.setAttribute("imagepath", path +"/images");

      out.write(_jsp_string1, 0, _jsp_string1.length);
      _caucho_expr_0.print(out, _jsp_env, false);
      out.write(_jsp_string2, 0, _jsp_string2.length);
      _caucho_expr_1.print(out, _jsp_env, false);
      out.write(_jsp_string3, 0, _jsp_string3.length);
      _caucho_expr_2.print(out, _jsp_env, false);
      out.write(_jsp_string4, 0, _jsp_string4.length);
      _caucho_expr_3.print(out, _jsp_env, false);
      out.write(_jsp_string5, 0, _jsp_string5.length);
      _caucho_expr_4.print(out, _jsp_env, false);
      out.write(_jsp_string6, 0, _jsp_string6.length);
      _caucho_expr_5.print(out, _jsp_env, false);
      out.write(_jsp_string7, 0, _jsp_string7.length);
      _caucho_expr_6.print(out, _jsp_env, false);
      out.write(_jsp_string8, 0, _jsp_string8.length);
      _caucho_expr_7.print(out, _jsp_env, false);
      out.write(_jsp_string9, 0, _jsp_string9.length);
      _caucho_expr_8.print(out, _jsp_env, false);
      out.write(_jsp_string10, 0, _jsp_string10.length);
      _caucho_expr_8.print(out, _jsp_env, false);
      out.write(_jsp_string11, 0, _jsp_string11.length);
      _caucho_expr_8.print(out, _jsp_env, false);
      out.write(_jsp_string12, 0, _jsp_string12.length);
      _caucho_expr_8.print(out, _jsp_env, false);
      out.write(_jsp_string13, 0, _jsp_string13.length);
    } catch (java.lang.Throwable _jsp_e) {
      pageContext.handlePageException(_jsp_e);
    } finally {
      com.caucho.jsp.QJspFactory.freePageContext(pageContext);
    }
  }

  private java.util.ArrayList _caucho_depends = new java.util.ArrayList();

  public java.util.ArrayList _caucho_getDependList()
  {
    return _caucho_depends;
  }

  public void _caucho_addDepend(com.caucho.vfs.PersistentDependency depend)
  {
    super._caucho_addDepend(depend);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  public boolean _caucho_isModified()
  {
    if (_caucho_isDead)
      return true;
    if (com.caucho.server.util.CauchoSystem.getVersionId() != -5502314496210410653L)
      return true;
    for (int i = _caucho_depends.size() - 1; i >= 0; i--) {
      com.caucho.vfs.Dependency depend;
      depend = (com.caucho.vfs.Dependency) _caucho_depends.get(i);
      if (depend.isModified())
        return true;
    }
    return false;
  }

  public long _caucho_lastModified()
  {
    return 0;
  }

  public java.util.HashMap<String,java.lang.reflect.Method> _caucho_getFunctionMap()
  {
    return _jsp_functionMap;
  }

  public void init(ServletConfig config)
    throws ServletException
  {
    com.caucho.server.webapp.WebApp webApp
      = (com.caucho.server.webapp.WebApp) config.getServletContext();
    super.init(config);
    com.caucho.jsp.TaglibManager manager = webApp.getJspApplicationContext().getTaglibManager();
    manager.addTaglibFunctions(_jsp_functionMap, "c", "http://java.sun.com/jsp/jstl/core");
    com.caucho.jsp.PageContextImpl pageContext = new com.caucho.jsp.PageContextImpl(webApp, this);
    _caucho_expr_0 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${base}");
    _caucho_expr_1 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${presentation.id}");
    _caucho_expr_2 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${product.name}");
    _caucho_expr_3 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${presentation.num }");
    _caucho_expr_4 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${detailProduct.name }");
    _caucho_expr_5 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${presentationIndex.detail }");
    _caucho_expr_6 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${product.id }");
    _caucho_expr_7 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${presentation.html}");
    _caucho_expr_8 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${base }");
  }

  public void destroy()
  {
      _caucho_isDead = true;
      super.destroy();
  }

  public void init(com.caucho.vfs.Path appDir)
    throws javax.servlet.ServletException
  {
    com.caucho.vfs.Path resinHome = com.caucho.server.util.CauchoSystem.getResinHome();
    com.caucho.vfs.MergePath mergePath = new com.caucho.vfs.MergePath();
    mergePath.addMergePath(appDir);
    mergePath.addMergePath(resinHome);
    com.caucho.loader.DynamicClassLoader loader;
    loader = (com.caucho.loader.DynamicClassLoader) getClass().getClassLoader();
    String resourcePath = loader.getResourcePathSpecificFirst();
    mergePath.addClassPath(resourcePath);
    com.caucho.vfs.Depend depend;
    depend = new com.caucho.vfs.Depend(appDir.lookup("WEB-INF/views/presentation/presentationIndex.jsp"), 3392155186267081926L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }
  private static com.caucho.el.Expr _caucho_expr_0;
  private static com.caucho.el.Expr _caucho_expr_1;
  private static com.caucho.el.Expr _caucho_expr_2;
  private static com.caucho.el.Expr _caucho_expr_3;
  private static com.caucho.el.Expr _caucho_expr_4;
  private static com.caucho.el.Expr _caucho_expr_5;
  private static com.caucho.el.Expr _caucho_expr_6;
  private static com.caucho.el.Expr _caucho_expr_7;
  private static com.caucho.el.Expr _caucho_expr_8;

  private final static char []_jsp_string4;
  private final static char []_jsp_string10;
  private final static char []_jsp_string1;
  private final static char []_jsp_string6;
  private final static char []_jsp_string2;
  private final static char []_jsp_string13;
  private final static char []_jsp_string5;
  private final static char []_jsp_string3;
  private final static char []_jsp_string0;
  private final static char []_jsp_string8;
  private final static char []_jsp_string11;
  private final static char []_jsp_string12;
  private final static char []_jsp_string7;
  private final static char []_jsp_string9;
  static {
    _jsp_string4 = "\u3000\u3000 \u7b2c<input type=\"text\" id=\"num\" value=\"".toCharArray();
    _jsp_string10 = "/js/artDialog/artDialog.js?skin=blue\"></script>\r\n<script type=\"text/javascript\" src=\"".toCharArray();
    _jsp_string1 = "\r\n<script type='text/javascript'>\r\n	var base='".toCharArray();
    _jsp_string6 = "</span>\r\n	<input type=\"hidden\" id=\"detail\" value=\"".toCharArray();
    _jsp_string2 = "';\r\n</script>\r\n</head>\r\n<body>\r\n	<div>\r\n	<input type=\"hidden\" id=\"presentationId\" value=\"".toCharArray();
    _jsp_string13 = "/js/common.js\"></script>\r\n<script type=\"text/javascript\">\r\n	initajaxupload(\"upload\",\"/imgupload/upload.jsps?direct=product\",afterupload,null,null);\r\n	\r\n	function afterupload(json,data){\r\n		if(json.STATE=='SUCCESS'){\r\n			art.dialog.alert(\"\u4e0a\u4f20\u6210\u529f\",function(){\r\n				$(\"#imgpath\").val(json.PATH);\r\n			});\r\n			\r\n		}else{\r\n			art.dialog.alert(\"\u4e0a\u4f20\u5931\u8d25\");\r\n		}\r\n	}\r\n</script>\r\n<script type=\"text/javascript\" src=\"/js/custom/presentation/presentationIndex.js\"></script>\r\n</body>\r\n</html>".toCharArray();
    _jsp_string5 = "\" style=\"width:30px;\"/>\u5c4f\r\n	\u94fe\u63a5\u4ea7\u54c1:<a href='javascript:void(0);' onclick='presentationIndex.selectProduct();'>\u9009\u62e9\u4ea7\u54c1</a>\r\n	<span id=\"productName\">".toCharArray();
    _jsp_string3 = "\"/>\r\n	\u6807\u9898:".toCharArray();
    _jsp_string0 = "\r\n\r\n<html>\r\n<head>\r\n<title>\u4fee\u6539\u6a21\u677f</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n<style type=\"text/css\">\r\n</style>\r\n".toCharArray();
    _jsp_string8 = "\" name=\"productId\"/>\r\n	<div style=\"clear:both;margin:5px;\"></div>\r\n	<label>\r\n	<input type=\"radio\" name=\"script\" value=\"1\"/>\r\n	flash\u811a\u672c\r\n	</label>\r\n	<label>\r\n	<input type=\"radio\" name=\"script\" value=\"2\"/>\r\n	\u56fe\u7247\u811a\u672c\r\n	</label>\r\n	<label>\r\n	<input type=\"radio\" name=\"script\" value=\"3\" checked/>\r\n	\u4e0d\u4f7f\u7528\u811a\u672c\r\n	</label>\r\n	<div style=\"clear:both;margin:5px;\"></div>\r\n	</div>\r\n	\r\n	<div>\r\n	<div style=\"width:650px;\">\r\n	<script type=\"text/plain\" id=\"content\" name=\"content\">".toCharArray();
    _jsp_string11 = "/js/artDialog/plugins/iframeTools.js\"></script>\r\n<script type=\"text/javascript\" src=\"/js/jquery-1.8.3.min.js\"></script>\r\n<script type=\"text/javascript\" src=\"".toCharArray();
    _jsp_string12 = "/js/ajaxupload.js\"></script>\r\n<script type=\"text/javascript\" src=\"".toCharArray();
    _jsp_string7 = "\"/>\r\n	<input id=\"productId\" type=\"hidden\" value=\"".toCharArray();
    _jsp_string9 = "</script>\r\n	</div>\r\n	</div>\r\n	<div id=\"imagePanel\" style=\"display:none;\">\r\n		<input type=\"hidden\" id=\"imgpath\" name=\"imgpath\"/>\r\n		<span id=\"uploadTxt\">\u56fe\u7247</span>:<input type=\"button\" value=\"\u6dfb\u52a0\" id=\"upload\"/>\r\n	</div>\r\n<script type=\"text/javascript\" src=\"/js/ueditor/ueditor.config.js\"></script>\r\n<script type=\"text/javascript\" src=\"/js/ueditor/ueditor.all.js\"></script>\r\n<script type=\"text/javascript\" src=\"".toCharArray();
  }
}
