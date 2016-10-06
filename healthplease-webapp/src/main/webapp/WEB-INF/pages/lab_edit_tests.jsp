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
    <title> Tests | HealthPlease.in</title>
    
</head>

<body>
 <div id="wrapper">

        <%@include file="lab_header.jsp" %>

 <div id="page-wrapper">
<!--Add user start from here-->
<div class="container" id="addUser" name="addUser">
   
  <div class="row">
    
<div class="col-lg-9 col-md-9">


<div class="clearfix"></div>

<div id="msg" class="container"></div>

<div class="" id="div_add">
<a href="<%=Constants.ADMIN_EDIT_LAB_TEST_GET_URL %>?labId=${lab.id}" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Add New Test</a>
</div>

<div class="clearfix"></div><br/>
<!--Main div where content get loaded-->
<h1>${lab.name}</h1>
<div class="" id="addUser" name="addUser">

<form method='post' id="form_add_user" action="<%=Constants.ADMIN_EDIT_LAB_TEST_POST_URL%>">
    <table class='table table-bordered'>
 
        <tr>
            <td>Test Name</td>
            <input type='hidden' name='labId' id="lab_id" class='form-control' value="${lab.id}">
            <td>
            	<c:if test="${test.id != null }">
            		<input type='text' name='name' id='loc_name' class='form-control' value="${test.name}" required readonly="readonly">
            		<input type='hidden' name='id' id="id" class='form-control' value="${test.id}">
            	</c:if>
            	<c:if test="${test.id == null }">
            		<select class="form-control" id="test_cat_id" name="id">
                 	<c:forEach items="${tests}" var="test">
                  		<option value="${test.id}">${test.name}</option>
                  	</c:forEach>
               		</select>
            	</c:if>
            </td>
        </tr>
        
        <tr>
            <td>Charges</td>
            <td><input type='text' name='price' id='loc_charges' class='form-control' value="${test.price}" required ></td>
        </tr>
 
        <tr>
       
        <td colspan="2">
            <div id="submituser" class=" pull-left">
               <button type="submit" class="btn btn-primary" name="btn-save" id="submit">
                   <span class="glyphicon glyphicon-plus"></span> Update
               </button>  
                <a href="<%=Constants.ADMIN_LAB_TESTS_GET_URL %>?labId=${lab.id}" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; Back to index</a>
            </div>
        </td>
            
        </tr>
 
    </table>
</form>
</div>

   </div>  
  </div>      
</div>
</div>
</div>
    <!-- /#page-wrapper -->
    <!-- /#wrapper -->
</body>

</html>