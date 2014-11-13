<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<div class="about-warp">
                	<h2 class="about-h2"><p>关于绿色时代</p><p class="p-en">About Greentimes</p></h2>
                    <ul class="about-img">
                    	<li><img src="${base}/default/style/images/case/13.jpg" /></li>
                        <li><img src="${base}/default/style/images/case/14.jpg" /></li>
                        <li><img src="${base}/default/style/images/case/15.jpg" /></li>
                    </ul>
                	<h3 class="about-h3">${data.title }</h3>
                    
                    <div class="slyWrap example12">
		
                        <div class="scrollbar">
                            <div class="handle"></div>
                        </div>
                    
                        <div class="sly" data-options='{ "scrollBy": 100, "startAt": 0 }'>
                            <div>
                            	${data.content }
                            </div>
                        </div>
                    </div>
                    
                    
                </div>