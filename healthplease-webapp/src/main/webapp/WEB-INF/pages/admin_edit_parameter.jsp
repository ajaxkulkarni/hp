<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add/Edit Category</title>
</head>
<body>

<%@include file="user_header.jsp"%>

<div class="classGoldenDivider"></div>        <div class="classTopHeading">
        <div class="container">
            <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Welcome <span class="nameHolder">Admin</span></h1>
            </div>
        </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
        <div id="msg" class="container">
        	<c:if test="${result == 'OK'}">
        		<div class="alert alert-success">
        			Record updated successfully!
        		</div>
        	</c:if>	
        	<c:if test="${result != 'OK' && result != null}">
        		<div class="alert alert-danger">
        			${result}
        		</div>
        	</c:if>
        </div>


<div class="container" id="addUser" name="addUser">
   
  <div class="row">
    <%@include file="admin_header.jsp" %> 
<div class="col-lg-9 col-md-9">

<!--Add user start from here-->
<div class="" id="addUser" name="addUser">

<form method='post' id="form_add_user" action="<%=Constants.ADMIN_EDIT_PARAMETER_POST_URL%>">
 
    <table class='table table-bordered'>
 
        <tr>
            <td>Parameter Name</td>
            <input type='hidden' name='id' id="id" class='form-control' value="${parameter.id}">
            <td><input type='text' name='name' id='par_name' class='form-control' value="${parameter.name}" required ></td>
        </tr>
        
        <tr>
            <td>Unit</td>
            <td><input type='text' name='unit' class='form-control' value="${parameter.unit}" required ></td>
        </tr>
        
        <tr>
            <td>Normal Value Male :</td>
            <td><input type='text' name='normalValueMale' class='form-control' placeholder="male normal range" value="${parameter.normalValueMale}" required ></td>
        </tr>
        
        <tr>
            <td>Normal Value Female :</td>
            <td><input type='text' name='normalValueFemale' class='form-control' placeholder="female range" value="${parameter.normalValueFemale}" required ></td>
        </tr>
        
        <tr>
            <td>Normal Value child :</td>
            <td><input type='text' name='normalValueChild' class='form-control' placeholder="child range" value="${parameter.normalValueChild}" required ></td>
        </tr>
        
        <tr>
            <td>Type</td>
            <td>
            	<select name="type">
            		<c:if test="${parameter.type == 'N'}">
            			<option value="N" selected>Numeric</option>
            		</c:if>
            		<c:if test="${parameter.type == 'D'}">
            			<option value="D" selected>Descriptive</option>
            		</c:if>
            		<option value="">Choose type</option>
            		<option value="N">Numeric</option>
            		<option value="D">Descriptive</option>
            	</select>
            </td>
        </tr>
        
        <tr>
            <td>Method 1 :</td>
            <td><textarea name='methods[0]' class='form-control' required >${parameter.methods[0]}</textarea>
            </td>
        </tr>
        <tr>
            <td>Method 2 :</td>
            <td><textarea name='methods[1]' class='form-control'><c:if test="${fn:length(parameter.methods) > 1}">${parameter.methods[1]}</c:if></textarea>
            </td>
        </tr>
        
        <tr>
            <td>Method 3 :</td>
            <td><textarea name='methods[2]' class='form-control'><c:if test="${fn:length(parameter.methods) > 2}">${parameter.methods[2]}</c:if></textarea>
            </td>
        </tr>
        
        <tr>
       
        <td colspan="2">
            <div id="submituser" class=" pull-left">
               <button type="submit" class="btn btn-primary" name="btn-save" id="submit">
                   <span class="glyphicon glyphicon-plus"></span> Update
               </button>  
                <a href="<%=Constants.ADMIN_LOCATIONS_GET_URL %>" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; Back to index</a>
            </div>
        </td>
            
        </tr>
 
    </table>
</form>
</div>
</div>
</div>
</div>

<%@include file="user_footer.jsp" %>

</body>
</html>