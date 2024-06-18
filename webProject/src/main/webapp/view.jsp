<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.taglibs.bsf.scriptlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String lang = (String)session.getAttribute("lang");
%>
<fmt:setLocale value="${lang}" />
<fmt:requestEncoding value="UTF-8"/>
<fmt:bundle basename="view">
	<fmt:message var="main" 		key="MAIN"/>
	<fmt:message var="post" 		key="POST"/>
	<fmt:message var="post_title" 	key="POST_TITLE"/>
	<fmt:message var="post_content" key="POST_CONTENT"/>
	<fmt:message var="write" 		key="WRITE"/>
	<fmt:message var="brand" 		key="BRAND"/>
	<fmt:message var="format" 		key="FORMAT"/>
	<fmt:message var="user" 		key="USER"/>
	<fmt:message var="date" 		key="DATE"/>
	<fmt:message var="list" 		key="LIST"/>
	<fmt:message var="update" 		key="UPDATE"/>
	<fmt:message var="delete" 		key="DELETE"/>
	<fmt:message var="welcome" 		key="WELCOME"/>
	<fmt:message var="sir" 		key="SIR"/>
</fmt:bundle>   
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
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
	int postID = Integer.parseInt(request.getParameter("postID"));
	String uid = (String)request.getParameter("userID"); //세션의 userID와 해당 게시글 작성자의 ID를 비교하기 위함
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
%>
	<nav class="navbar navbar-default" style="background-color: #D8D8D8">
			<a class="navbar-brand" href="main.do?lang=${param.lang}">${brand}</a>
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
	                        		<a href="logout.do">로그아웃</a> <!-- 로그아웃 Action 실행 -->
	                      		</li>
	                    	</ul>
	               	</li>
               	</ul>
            	<%
				}else{
            	%>
            	<li class="text">
					<a href="login.do">${access}</a>
				</li>
            	<%
				}
            	%>
			</div>
	</nav>
		<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">${format}</th>
					
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">${post_title}</td>
						<td colspan="2">${va.getPostTitle()} </td>
					</tr>
					<tr>
						<td>${user}</td>
						<td colspan="2">${va.getUserID()}</td>
					</tr>
					<tr>
						<td>${date}</td>
						<td>${va.getPostDate().substring(0,11)} ${va.getPostDate().substring(11,13)}시 ${va.getPostDate().substring(14,16)}분</td>
					</tr>
					<tr>
						<td>${post_content}</td>
						<td>${va.getPostContent()}</td>
					</tr>
				</tbody>
			</table>
			<a href = "post.do" class = "btn btn-primary" style="background-color: #2E64FE">${list}</a>
			<%
				if(userID!=null && userID.equals(uid)){
			%>
			<a href = "update.do?postID=<%=postID%>&postTitle=${va.getPostTitle()}&postContent=${va.getPostContent()}" class = "btn btn-primary" style="background-color: #2E64FE">${update}</a>
			<a href = "delete.do?postID=<%=postID%>" onClick="return confirm('정말로 삭제하시겠습니까?')" class="btn btn-primary" style="background-color: #2E64FE">${delete}</a>
			<%
				}
			%>
			<input type="submit" class="btn btn-primary pull-right" value="${write}" style="background-color: #2E64FE">
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>