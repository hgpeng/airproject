<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="case-rlogo"><img src="${base}/default/style/images/case/case_06.png"/></div>
    		<ul class="case-rul">
    			<li class="rlist_01"><a href="#">治理服务</a></li>
    			<li <c:if test="${page=='green'}">class="hover"</c:if>><a href="${base }/greenService">绿色时代</a></li>
    			<li <c:if test="${page=='case'}">class="hover"</c:if> >
    				<a href="${base }/caselist">工程案例</a>
    				<div class="case-r-nav">
    					<ul>
    					<c:forEach items="${celist }" var="item">
    						<li>
    							<a href="${base}/caseclass?type=${item.id}">
    								<img src="${base}/images/${item.icon}"/>
    								${item.name }
    							</a>
    						</li>
    					</c:forEach>
    						<%-- <li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_09.png"/>
    								学校环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_10.png"/>
    								商场环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_11.png"/>
    								酒店环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_12.png"/>
    								医疗环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_13.png"/>
    								家庭环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_14.png"/>
    								工业环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_15.png"/>
    								娱乐环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_16.png"/>
    								超市环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_17.png"/>
    								公共环境
    							</a>
    						</li>
    						<li>
    							<a href="#">
    								<img src="${base}/default/style/images/case/case_18.png"/>
    								车内环境
    							</a>
    						</li> --%>
    					</ul>
    				</div>
    			</li>
    		</ul>
    		<div class="fenxiang">
    			<a href="#"><img src="${base}/default/style/images/case/case_05.png"/></a>
    		</div>