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
    <title>Admin Settings | HealthPlease.in</title>
    
</head>

<body>
<%@include file="user_header.jsp" %>
<div class="classTopHeading">
        <div class="container">
            <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Welcome <span class="nameHolder"></span></h1>
            </div>
        </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
   <div class="container" id="addUser" name="addUser" >
  <div class="row"> 
    <%--  <%@include file="admin_header.jsp" %> --%>
    <div class="col-lg-1 col-md-3 offset"></div>
     <div class="col-lg-9 col-md-9"style="border">
     <ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#setting1">Report Settings</a></li>
			    <li><a data-toggle="tab" href="#setting2">Other Settings</a></li>
	  </ul>
     
      <div class="tab-content">
	 	
			    <div id="setting1" class="tab-pane fade in active" >
				<div class="container">
				<div class="row">
				
				<div class="col-md-9">
				<div class="panel panel-default" style="margin-top:5%">
			    <div class="panel-heading">Header</div>
			    <div class="panel-body">
			    <div class="checkbox">
				  <label><input type="checkbox" value="">Include Header</label>
				</div>
			    </div>
			    </div>
							
				<div class="panel panel-default">
			    <div class="panel-heading">Footer</div>
			    <div class="panel-body">
			    <div class="checkbox">
				  <label><input type="checkbox" value="">Include Footer</label>
				</div>
			    </div>
			    </div>
				
				<div class="panel panel-default">
			    <div class="panel-heading">Signature</div>
			    <div class="panel-body">
			    <span>Choose file</span></br>
			     <div class="fileinput fileinput-new" data-provides="fileinput">
   					 <span class="btn btn-default btn-file"><input type="file" /></span>
    			</div>
			    <div class="checkbox">
				  <label><input type="checkbox" value="">Include Signature</label>
				</div>
			    </div>
			    </div>
			   <button type="button" style="float:right" class="btn btn-primary">Submit</button> 
		
	    		</div>
				</div>
     			</div>	
			   	</div>
			   	
			   	
			   	 <div id="setting2" class="tab-pane fade in" >
					<div class="container" style="height:500px">
				<div class="row">
				
				<div class="col-md-9" style="margin:5%">
					<div class="panel panel-default" >
			    <div class="panel-heading">Lab Logo</div>
			    <div class="panel-body">
			    <span>Choose file</span></br>
			     <div class="fileinput fileinput-new" data-provides="fileinput">
   					 <span class="btn btn-default btn-file"><input type="file" /></span>
    			</div>
			
			    </div>
			    </div>
			   <button type="button" style="float:right" class="btn btn-primary">Submit</button>
				
     			</div>	
			   	</div></div></div>
     </div>
    </div>
    </div> </div>
    
     <%@include file="user_footer.jsp" %>
     </body>

</html>