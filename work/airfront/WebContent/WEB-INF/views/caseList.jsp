<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="HandheldFriendly" content="True">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta http-equiv="cleartype" content="on">
        <jsp:include page="common/commonHead.jsp"></jsp:include>
        <script type="text/javascript" src="${base }/default/js/control/horwheel.min.js"></script>
        <style>
            body {
                margin: 0;
                padding: 0;
            }

            .wrapper-scroll {
                -webkit-overflow-scrolling: touch;
                overflow-scrolling: touch;
                overflow: auto;
                position: absolute;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
            }

            .content {
                
                width: -moz-max-content;
                width: -webkit-max-content;
                width: -o-max-content;
                width: -ms-max-content;
                width: max-content;
            }

            h1 {
                font-family: 'Segoe UI Light', 'Open Sans', "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size: 2em;
                margin: .3em 0;
            }

            .section {
                float: left;
                overflow: hidden;
                width: 750px;
                margin: 0 1.2em 0 0;
            }

            .article {
                float: left;
                width: 15em;
                height: 12em;
                margin: .2em;
                background-color: #C40C20;
            }

            .section:nth-child(1) .article {
                background-color: #C40C20;
            }

            .section:nth-child(2) .article {
                background-color: #F9A02E;
            }

            .section:nth-child(3) .article {
                background-color: #FEF20A;
            }
            .section:nth-child(4) .article {
                background-color: #35A338;
            }
            .section:nth-child(5) .article {
                background-color: #139CEB;
            }
        </style>
        <script type="text/javascript">
        	$(document).ready(function(){
        		var view = document.getElementById('wrapper');
                horwheel(view);
        	});
        </script>
    </head>
    <body>
        <div id="wrapper" class="wrapper-scroll">
           
            <div class="content">
                <div class="section">
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                </div>
                <div class="section">
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                </div>
                <div class="section">
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                </div>
                <div class="section">
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                </div>
                <div class="section">
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                    <div class="article"></div>
                </div>
            </div>
        </div>
</body>
</html>