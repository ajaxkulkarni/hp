<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
          <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
          <title>Corporate Partners | HealthPlease.in</title>
          	<link href="<c:url value="/resources/css/mui.css" />" rel="stylesheet" ></link>
          	<link href="<c:url value="/resources/css/mui.min.css" />" rel="stylesheet" ></link>
          	<link href="<c:url value="/resources/js/mui.js" />" rel="javascript" ></link>
</head>
<body style="background-color:#555">
<%@include file="user_header.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-md-12" style="color:#fff"><h1>Corporate Partner</h1></div>
	</div>
	<div class="row">
	<div class="col-md-8 col-sm-6 col-xs-12" >
	
	
	</div>
	<div class="col-md-4 col-sm-6 col-xs-12" style="border: ">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="text-center panel-title">Become Our Corporate Partner</h2></div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-10 col-lg-push-1 col-md-10 col-md-push-1 col-sm-10 col-sm-push-1 col-xs-12" style="border: ">
                        <form>
                            
                            <label for="name">Name of Requester</label>
                            <input class="form-control" type="text" required="" placeholder="Name" pattern="[a-zA-Z]+">
                            <label for="name" style="margin-top:10px">Company Name</label>
                            <input class="form-control" type="text" required="" placeholder="Company" pattern="[a-zA-Z]+">
                            <label for="name" style="margin-top:10px">Name of HR/Admin</label>
                            <input class="form-control" type="text" required="" placeholder="HR/Admin" pattern="[a-zA-Z]+">
                             <label style="margin-top:10px">Contact No.</label>
                            <input class="form-control" type="text" required="" placeholder="Mobile" pattern="[0-9]{10}">
                            <label style="margin-top:10px">Email of HR/Admin</label>
                            <input class="form-control" type="email" required="" placeholder="Email">
                            <label style="margin-top:10px">Corporate's Location</label>
                             <input class="form-control" type="text" required="" placeholder="Location" pattern="[a-zA-Z]+">
                           
                        </form>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
            <div class="row">
            <div class="col-xs-6">
                <button class="btn btn-primary" type="submit" style="margin-left:20%;height:35px;width:105px">Request</button>
            </div>
             <div class="col-xs-6">
                <button class="btn btn-primary" type="submit" style="margin-left:10%;height:35px;width:105px">Cancel</button>
            </div>
            </div>
        </div>
        </div>
    </div>
    </div>
    </div>

 <%@include file="user_footer.jsp" %>   
   </body>

</html>