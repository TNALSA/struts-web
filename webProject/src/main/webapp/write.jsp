<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String lang = (String)session.getAttribute("lang");
%>
<fmt:setLocale value="${lang}" />
<fmt:requestEncoding value="UTF-8" />
<fmt:bundle basename="write">
	<fmt:message var="main" key="MAIN"/>
	<fmt:message var="post" key="POST"/>
	<fmt:message var="post_title" key="POST_TITLE"/>
	<fmt:message var="post_content" key="POST_CONTENT"/>
	<fmt:message var="write" key="WRITE"/>
	<fmt:message var="brand" key="BRAND"/>
	<fmt:message var="format" key="FORMAT"/>
</fmt:bundle>   
<!DOCTYPE html>
<html>
<head>
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
	                        	환영합니다. <%=userID%>님<span class="caret"></span>
	                    	</a>
	                    	<ul class="dropdown-menu">
	                        	<li>
	                        		<a href="logout.do">로그아웃</a> <!-- 로그아웃 Action 실행 -->
	                      		</li>
	                    	</ul>
	               	</li>
               	</ul>
            	<%
				}
            	%>
			</div>
	</nav>
		<div class="container">
		<div class="row">
		<form action="write_ok.do">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">${format}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<input type="hidden" name="userID" value="<%=userID%>"/> <!--접속한 세션의 userID를 같이 넘겨줌  -->
						<td><input type="text" class="form-control" placeholder="${post_title}" name="postTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea type="text" class="form-control" placeholder="${post_content}" name="postContent" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="${write}" style="background-color: #2E64FE">
		</form>
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>  