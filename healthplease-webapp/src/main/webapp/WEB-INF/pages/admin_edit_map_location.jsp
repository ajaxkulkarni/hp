<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Map Lab Location | HealthPlease.in</title>
<link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>">
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

<form method='post' id="form_add_user" action="<%=Constants.ADMIN_EDIT_LAB_LOCATION_POST_URL%>">
 
    <table class='table table-bordered'>
 
        <tr>
            <td>Location Name</td>
            <input type='hidden' name='labId' id="lab_id" class='form-control' value="${lab.id}">
            <td>
            	<c:if test="${labLocation.id != null }">
            		<input type='text' name='name' id='loc_name' class='form-control' value="${labLocation.name}" readonly="readonly" required >
            		<input type='hidden' name='id' id="id" class='form-control' value="${labLocation.id}">
            	</c:if>
            	<c:if test="${labLocation.id == null }">
            		<select class="form-control" id="test_cat_id" name="id">
                 	<c:forEach items="${locations}" var="loc">
                  		<option value="${loc.id}">${loc.name}</option>
                  	</c:forEach>
               		</select>
            	</c:if>
            </td>
        </tr>
        
        <tr>
            <td>Pickup charges</td>
            <td><input type='text' name='charge' id='loc_charges' class='form-control' value="${labLocation.charge}" required ></td>
        </tr>
 
        <tr>
       
        <td colspan="2">
            <div id="submituser" class=" pull-left">
               <button type="submit" class="btn btn-primary" name="btn-save" id="submit">
                   <span class="glyphicon glyphicon-plus"></span> Update
               </button>  
                <a href="<%=Constants.ADMIN_MAP_LAB_LOCATIONS_GET_URL %>" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; Back to index</a>
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