<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Change password</title>
 <link rel="icon" type="image/png"  href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
<link rel="icon" type="image/png"  href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
<link rel="icon" type="image/png"  href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>"> 
   
</head>

<body>

 <%@include file="user_header_dummy.jsp"%> 
	
	<div class="classTopHeading">
		<div class="container">
			<div class="col-lg-12 col-md-12 col-sm-12">
                <h2 class="">Change Password</h2>
            </div>
			<%@include file="forms/change_password_form.jsp" %>
			</div>
		</div>
	<%@include file="user_footer_dummy.jsp"%>

</body>
</html>