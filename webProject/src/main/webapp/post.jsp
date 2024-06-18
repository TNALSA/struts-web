<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String lang = (String)session.getAttribute("lang");
%>
<fmt:setLocale value="${lang}" />
<fmt:requestEncoding value="UTF-8" />
<fmt:bundle basename="post">
	<fmt:message var="main" key="MAIN"/>
	<fmt:message var="post" key="POST"/>
	<fmt:message var="number" key="POST_NUMBER"/>
	<fmt:message var="title" key="POST_TITLE"/>
	<fmt:message var="user" key="USER"/>
	<fmt:message var="date" key="DATE"/>
	<fmt:message var="write" key="WRITE"/>
	<fmt:message var="brand" key="BRAND"/>
	<fmt:message var="welcome" key="WELCOME"/>
	<fmt:message var="sir" key="SIR"/>
	<fmt:message var="logout" key="LOGOUT"/>
	<fmt:message var="access" key="ACCESS"/>
</fmt:bundle>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Struts Website</title>
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
 <style>
    /* 폰트를 적용할 스타일 선언 */
    body {
      font-family: 'Noto Sans', sans-serif;
    }
    h1, h2, h3, h4, h5, h6 {
      font-family: 'Noto Sans', sans-serif;
    }
  </style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-default" style="background-color: #D8D8D8">
			<a class="navbar-brand" href="main.do">${brand}</a>
			<div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.do" style="font-size: large;">${main}</a></li>
					<li><a href="post.do" style="font-size: large;">${post}</a></li>
				</ul>
				<%
				if(userID!=null){
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
	                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	                        	${welcome} <%=userID%>${sir}<span class="caret"></span>
	                    	</a>
	                    	<ul class="dropdown-menu">
	                        	<li>
	                        		<a href="logout.do">${logout}</a> <!-- 로그아웃 Action 실행 -->
	                      		</li>
	                    	</ul>
	               	</li>
               	</ul>
            	<%
				}else{
            	%>
            	<ul class="nav navbar-nav navbar-right">
	            	<li class="text">
						<a href="login.do">${access}</a>
					</li>
				</ul>
            	<%
				}
            	%>
			</div>
	</nav>
		<div class="container" >
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead style="">
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">${number}</th>
						<th style="background-color: #eeeeee; text-align: center;">${title}</th>
						<th style="background-color: #eeeeee; text-align: center;">${user}</th>
						<th style="background-color: #eeeeee; text-align: center;">${date}</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${pa}" var="list" varStatus="status">
					<tr>
						<td>${list.getPostID()}</td>
						<td>
							<a href="view.do?postID=${list.getPostID()}&userID=${list.getUserID()}" type="submit">${list.getPostTitle()}</a>
						</td>
						<td>${list.getUserID()}</td>
						<td>${list.getPostDate().substring(0,11)} ${list.getPostDate().substring(11,13)}시 ${list.getPostDate().substring(14,16)}분</td>	
					</tr>	
				</c:forEach>
				</tbody>
			</table>
			<%
				if(userID!=null){
			%>
				<a href="write.do" class="btn btn-primary pull-right" style="background-color: #2E64FE">${write}</a> <!-- 접속한 user세션이 존재할 경우에만 활성화 -->
			<%
				}
			%>
		</div>
	</div>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>