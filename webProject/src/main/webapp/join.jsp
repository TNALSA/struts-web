<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String lang = (String)session.getAttribute("lang");
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=lang%>"/>
<fmt:requestEncoding value="UTF-8" />
<fmt:bundle basename="join">
	<fmt:message var="main" key="MAIN"/>
	<fmt:message var="post" key="POST"/>
	<fmt:message var="brand" key="BRAND"/>
	<fmt:message var="join" key="JOIN"/>
	<fmt:message var="format" key="FORMAT"/>
	<fmt:message var="id" key="ID"/>
	<fmt:message var="password" key="PASSWORD"/>
	<fmt:message var="name" key="NAME"/>
	<fmt:message var="male" key="MALE"/>
	<fmt:message var="female" key="FEMALE"/>
	<fmt:message var="email" key="EMAIL"/>
</fmt:bundle>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
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
	
	<nav class="navbar navbar-default" style="background-color: #D8D8D8">
			<a class="navbar-brand" href="main.do">${brand}</a>
			<div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.do" style="font-size: large;">${main}</a></li>
					<li><a href="post.do" style="font-size: large;">${post}</a></li>
				</ul>
			</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="join_ok.do"
				>
					<h3 style="text-align: center;">${format}</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="${id}" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="${password}" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="${name}" name="userName" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active" style="background-color: #2E64FE">
								<input type="radio" name="userGender" autocomplete="off" value="male" checked>${male}
							</label>
							<label class="btn btn-primary active" style="background-color: #2E64FE">
								<input type="radio" name="userGender" autocomplete="off" value="female" checked>${female}
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="${email}" name="userEmail" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="${join}" style="background-color: #2E64FE">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>