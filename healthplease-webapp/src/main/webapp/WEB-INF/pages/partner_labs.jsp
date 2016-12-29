<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
          <title>Book Diagnostic & Pathology Test like Thyroid, Sugar, Urine, Cholesterol, ECG and X-Ray. Pay for them Online. Sample Collected at home or in lab. EMR Storage Available.</title>
    <meta name="keywords" content="Book Online Path Test, Book online diagnostic test, Blood Sugar test">
    <meta name="description" content="Book your online Pathology Lab test and test packages and have sample picked from home. Online Payment option and save reports for future reference.">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<%@include file="user_header.jsp" %>
	
	 <div class="classTopHeading">
        <div class="container"> 
            <div class="row">
            <div class="col-lg-12">
                <h1 class="classAbout">Partner Labs</h1>
            </div>
        </div>
            <!-- /.col-lg-12-->
        </div>
	
	<div id="page-wrappera" class="container">
            
            <!-- /.row -->
            <div class="row" style="margin-bottom:30px;">
                <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <div class="row r-classAboutHighLightBox ">
                    	<c:forEach items="${labs}" var="lab">
                       <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 classHLBox " style="background:#F0FAFF;padding:40px;height:300px;margin-bottom:0px;">
                            <img src="getLabLogo?logoPath=${lab.logo}" style="height:100px;width:200px;" />
                            <h3><i class="fa fa-building"></i> ${lab.name}</h3>
                            <p><i class="fa fa-map-marker"></i> ${lab.address}</p>
                       </div>
                       </c:forEach>
                    </div>
                </div>
            </div>
           
     </div>
	
	<%@include file="user_footer.jsp" %>

</body>
</html>