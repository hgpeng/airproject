/*
 * JSP generated by Resin-3.1.4 (built Tue, 04 Dec 2007 05:30:53 PST)
 */

package _jsp._web_22dinf._views._article;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;

public class _savearticlesdialog__jsp extends com.caucho.jsp.JavaPage
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
    com.caucho.jsp.IteratorLoopSupportTag _jsp_loop_0 = null;
    try {
      out.write(_jsp_string0, 0, _jsp_string0.length);
      pageContext.include("../common.jsp", false);
      out.write(_jsp_string1, 0, _jsp_string1.length);
      _caucho_expr_0.print(out, _jsp_env, false);
      out.write(_jsp_string2, 0, _jsp_string2.length);
      _caucho_expr_1.print(out, _jsp_env, false);
      out.write(_jsp_string3, 0, _jsp_string3.length);
      _caucho_expr_2.print(out, _jsp_env, false);
      out.write(_jsp_string4, 0, _jsp_string4.length);
      if (_jsp_loop_0 == null)
        _jsp_loop_0 = new com.caucho.jsp.IteratorLoopSupportTag();
      java.lang.Object _jsp_items_1 = _caucho_expr_3.evalObject(_jsp_env);
      java.util.Iterator _jsp_iter_1 = com.caucho.jstl.rt.CoreForEachTag.getIterator(_jsp_items_1);
      _jsp_loop_0.init(0, Integer.MAX_VALUE, 1);
      while (_jsp_iter_1.hasNext()) {
        Object _jsp_i_1 = _jsp_iter_1.next();
        pageContext.setAttribute("baseData", _jsp_i_1);
        _jsp_loop_0.setCurrent(_jsp_i_1, _jsp_iter_1.hasNext());
        out.write(_jsp_string5, 0, _jsp_string5.length);
        _caucho_expr_4.print(out, _jsp_env, false);
        out.write(_jsp_string6, 0, _jsp_string6.length);
        if (_caucho_expr_5.evalBoolean(_jsp_env)) {
          out.write(_jsp_string7, 0, _jsp_string7.length);
        }
        out.write('>');
        _caucho_expr_6.print(out, _jsp_env, false);
        out.write(_jsp_string8, 0, _jsp_string8.length);
      }
      pageContext.removeAttribute("baseData");
      out.write(_jsp_string9, 0, _jsp_string9.length);
      _caucho_expr_7.print(out, _jsp_env, false);
      out.write(_jsp_string10, 0, _jsp_string10.length);
      if (_jsp_loop_0 == null)
        _jsp_loop_0 = new com.caucho.jsp.IteratorLoopSupportTag();
      java.lang.Object _jsp_items_2 = _caucho_expr_8.evalObject(_jsp_env);
      java.util.Iterator _jsp_iter_2 = com.caucho.jstl.rt.CoreForEachTag.getIterator(_jsp_items_2);
      _jsp_loop_0.init(0, Integer.MAX_VALUE, 1);
      while (_jsp_iter_2.hasNext()) {
        Object _jsp_i_2 = _jsp_iter_2.next();
        pageContext.setAttribute("item", _jsp_i_2);
        _jsp_loop_0.setCurrent(_jsp_i_2, _jsp_iter_2.hasNext());
        out.write(_jsp_string11, 0, _jsp_string11.length);
        _caucho_expr_9.print(out, _jsp_env, false);
        out.write(_jsp_string12, 0, _jsp_string12.length);
        _caucho_expr_10.print(out, _jsp_env, false);
        out.write(_jsp_string13, 0, _jsp_string13.length);
      }
      pageContext.removeAttribute("item");
      out.write(_jsp_string14, 0, _jsp_string14.length);
      _caucho_expr_11.print(out, _jsp_env, false);
      out.write(_jsp_string15, 0, _jsp_string15.length);
      _caucho_expr_12.print(out, _jsp_env, false);
      out.write(_jsp_string16, 0, _jsp_string16.length);
      _caucho_expr_12.print(out, _jsp_env, false);
      out.write(_jsp_string17, 0, _jsp_string17.length);
      _caucho_expr_12.print(out, _jsp_env, false);
      out.write(_jsp_string18, 0, _jsp_string18.length);
      _caucho_expr_12.print(out, _jsp_env, false);
      out.write(_jsp_string19, 0, _jsp_string19.length);
      _caucho_expr_12.print(out, _jsp_env, false);
      out.write(_jsp_string20, 0, _jsp_string20.length);
      _caucho_expr_12.print(out, _jsp_env, false);
      out.write(_jsp_string21, 0, _jsp_string21.length);
      _caucho_expr_12.print(out, _jsp_env, false);
      out.write(_jsp_string22, 0, _jsp_string22.length);
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
    _caucho_expr_0 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${article.id }");
    _caucho_expr_1 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${article.title }");
    _caucho_expr_2 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${typeId }");
    _caucho_expr_3 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${bdlist }");
    _caucho_expr_4 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${baseData.id }");
    _caucho_expr_5 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${article.type==baseData.id }");
    _caucho_expr_6 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${baseData.name }");
    _caucho_expr_7 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${article.img }");
    _caucho_expr_8 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${imgList }");
    _caucho_expr_9 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${base}");
    _caucho_expr_10 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${item}");
    _caucho_expr_11 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${article.content}");
    _caucho_expr_12 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${base }");
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("WEB-INF/views/article/saveArticlesDialog.jsp"), -5856871444846147064L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  static {
    try {
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
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
  private static com.caucho.el.Expr _caucho_expr_9;
  private static com.caucho.el.Expr _caucho_expr_10;
  private static com.caucho.el.Expr _caucho_expr_11;
  private static com.caucho.el.Expr _caucho_expr_12;

  private final static char []_jsp_string8;
  private final static char []_jsp_string3;
  private final static char []_jsp_string5;
  private final static char []_jsp_string4;
  private final static char []_jsp_string6;
  private final static char []_jsp_string14;
  private final static char []_jsp_string13;
  private final static char []_jsp_string9;
  private final static char []_jsp_string11;
  private final static char []_jsp_string10;
  private final static char []_jsp_string7;
  private final static char []_jsp_string21;
  private final static char []_jsp_string19;
  private final static char []_jsp_string20;
  private final static char []_jsp_string15;
  private final static char []_jsp_string12;
  private final static char []_jsp_string16;
  private final static char []_jsp_string22;
  private final static char []_jsp_string0;
  private final static char []_jsp_string17;
  private final static char []_jsp_string18;
  private final static char []_jsp_string2;
  private final static char []_jsp_string1;
  static {
    _jsp_string8 = "</option>\r\n		".toCharArray();
    _jsp_string3 = "\" />\r\n			<label>\r\n			\u662f\u5426\u4e3a\u63a8\u8350\u4ea7\u54c1<input type=\"checkbox\" id=\"recommend\" />\r\n			</label>\r\n			<span>\u3000\u5e8f\u53f7:</span>\r\n			<input type=\"text\" id=\"number\" />\r\n		<div style=\"clear:both;margin:5px;\"></div>\r\n	</div>\r\n	<div>\r\n		<input type=\"hidden\" id=\"type\" name=\"type\" value=\"".toCharArray();
    _jsp_string5 = "\r\n		<option value=\"".toCharArray();
    _jsp_string4 = "\" />\r\n		\u8bf7\u9009\u62e9\u7c7b\u578b:\r\n		<select id=\"baseDataList\" style=\"width:200px;\">\r\n		".toCharArray();
    _jsp_string6 = "\" ".toCharArray();
    _jsp_string14 = "\r\n	</div>\r\n	<div style=\"width:900px;height:240px;\">\r\n		<script type=\"text/plain\" id=\"content\" name=\"content\">".toCharArray();
    _jsp_string13 = "\" /> <input type=\"button\"\r\n					onclick=\"deleteimg(this)\" value=\"\u5220\u9664\" />\r\n			</p>\r\n		".toCharArray();
    _jsp_string9 = "\r\n		</select>\r\n	</div>\r\n	<input type=\"hidden\" id=\"imgpath\" name=\"imgpath\"\r\n		value=\"".toCharArray();
    _jsp_string11 = "\r\n			<p>\r\n				<img style='width:100px;' path='\"+json.PATH+\"'\r\n					src=\"".toCharArray();
    _jsp_string10 = "\" /> \u56fe\u7247:\r\n	<input type=\"button\" value=\"\u6dfb\u52a0\" id=\"upload\" />\r\n	<div id=\"imgdiv\">\r\n		".toCharArray();
    _jsp_string7 = "selected".toCharArray();
    _jsp_string21 = "/js/common.js\"></script>\r\n	<script type=\"text/javascript\"\r\n		src=\"".toCharArray();
    _jsp_string19 = "/js/artDialog/plugins/iframeTools.js\"></script>\r\n	<script type=\"text/javascript\" src=\"".toCharArray();
    _jsp_string20 = "/js/ajaxupload.js\"></script>\r\n	<script type=\"text/javascript\" src=\"".toCharArray();
    _jsp_string15 = "</script>\r\n	</div>\r\n	<script type=\"text/javascript\"\r\n		src=\"".toCharArray();
    _jsp_string12 = "/uploadimages/".toCharArray();
    _jsp_string16 = "/js/ueditor/ueditor.config.js\"></script>\r\n	<script type=\"text/javascript\"\r\n		src=\"".toCharArray();
    _jsp_string22 = "/js/custom/articles/saveArticlesDialog.js\"></script>\r\n	<script type=\"text/javascript\">\r\n		function deleteimg(obj) {\r\n			$(obj).parent().remove();\r\n		}\r\n	</script>\r\n</body>\r\n</html>".toCharArray();
    _jsp_string0 = "\r\n\r\n<html>\r\n<head>\r\n<title>\u4fee\u6539\u6587\u7ae0</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n<style type=\"text/css\">\r\n</style>\r\n".toCharArray();
    _jsp_string17 = "/js/ueditor/ueditor.all.min.js\"></script>\r\n	<script type=\"text/javascript\"\r\n		src=\"".toCharArray();
    _jsp_string18 = "/js/artDialog/artDialog.js?skin=blue\"></script>\r\n	<script type=\"text/javascript\"\r\n		src=\"".toCharArray();
    _jsp_string2 = "\" />\r\n	<div>\r\n		\u6807\u9898:<input type=\"text\" id=\"title\" style=\"width:300px;\"\r\n			value=\"".toCharArray();
    _jsp_string1 = "\r\n</head>\r\n<body>\r\n	<input type=\"hidden\" id=\"articleId\" value=\"".toCharArray();
  }
}
