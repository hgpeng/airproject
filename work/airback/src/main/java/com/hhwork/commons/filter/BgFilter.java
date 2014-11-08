package com.hhwork.commons.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.hhwork.utils.LoginCookieUtil;

public class BgFilter implements Filter {

	private String encoding = "utf-8";

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterchain) throws IOException, ServletException {
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		String url = req.getRequestURI();
		if (url.indexOf("/index/index.jsps")==-1 && url.indexOf("/index/login.jsps")==-1) {
			String loginCookie=LoginCookieUtil.getGuidCookie(req);
			/**
			 * 简单控制权限
			 */
			if (StringUtils.isBlank(loginCookie)) {
				resp.sendRedirect("/index/index.jsps");
				return;
			}
		}

		filterchain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
