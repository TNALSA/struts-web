<%@page import="org.apache.taglibs.bsf.scriptlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.PrintWriter" %>
<%
	String lang = (String)session.getAttribute("lang");
%>
<fmt:setLocale value="<%=lang%>"/> 
<fmt:requestEncoding value="UTF-8" />
<fmt:bundle basename="main">
	<fmt:message var="title" key="TITLE"/>
	<fmt:message var="main" key="MAIN"/>
	<fmt:message var="post" key="POST"/>
	<fmt:message var="explain" key="EXPLAIN"/>
	<fmt:message var="more" key="MORE"/>
	<fmt:message var="brand" key="BRAND"/>
	<fmt:message var="access" key="ACCESS"/>
	<fmt:message var="welcome" key="WELCOME"/>
	<fmt:message var="sir" key="SIR"/>
</fmt:bundle>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Struts Website</title>
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
 <style>
    /* 폰트를 적용할 스타일 선언 */
    body {
      font-family: 'Noto Sans', sans-serif;
    }
    h1, h2, h3, h4, h5, h6 {
      font-family: 'Noto Sans', sans-serif; font-weight: bolder;
    }
  </style>
</head>
<body style=" background-color: white;">
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
	%>
		<nav class="navbar navbar-default" style="background-color: #D8D8D8">
			<a class="navbar-brand" href="main.do?lang=${lang}">${brand}</a>
			<div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.do" style="font-size: large;">${main}</a></li>
					<li><a href="post.do" style="font-size: large;">${post}</a></li>
				</ul>
				<%
					if(userID == null){//접속한 user가 없을 경우
				%>
				<ul class="nav navbar-nav navbar-right">
				<li class="text">
					<a href="login.do">${access}</a>
				</li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        Language <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="main.do?lang=ko">한국어</a>
                      	</li>
                        <li><a href="main.do?lang=en">English</a>
                        </li>
                    </ul>
                </li>
            	</ul>
            	<%
					}else{
            	%>
            	<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        	${welcome} <%=userID%>${sir}<span class="caret"></span>
                    	</a>
                    	<ul class="dropdown-menu">
                        	<li>
                        		<a href="logout.do">로그아웃</a> <!-- 로그아웃 Action 실행 -->
                      		</li>
                    	</ul>
               		</li>
                	<li class="dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        	Language <span class="caret"></span>
                    	</a>
                    	<ul class="dropdown-menu">
                        	<li>
                        		<a href="main.do?lang=ko">한국어</a>
                      		</li>
                        	<li>
                        		<a href="main.do?lang=en">English</a>
                        	</li>
                    	</ul>
               		</li>
            	</ul>
            	<%
            		}
				%>
			</div>
		</nav>
	<div class="container mt-4">
    <div class="row">
      <div class="col-md-8">
        <!-- 게시물 목록 또는 게시물 카드를 동적으로 생성 -->
        <!-- 예시로 3개의 게시물 카드 생성 -->
      <div class="panel panel-default">
          <div class="panel-body">
            <img src="images/background.jpg" class="img-responsive" alt="게시물 이미지">
          </div>
          <div class="panel-footer">
            <h4>${title}</h4>
            <p>${explain}</p>
            <a href="#" class="btn btn-primary" style="background-color: #2E64FE">${more}</a>
          </div>
     </div>
      </div>

      <div class="col-md-4">
        <!-- 사이드바 또는 광고 등을 추가할 수 있습니다 -->
        <div class="panel panel-default">
          <div class="panel-body">
            <h4>인기 게시글</h4>
            <p>게시글 제목</p>
          </div>
        </div>
      </div>
    </div>
  </div>
		
 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>