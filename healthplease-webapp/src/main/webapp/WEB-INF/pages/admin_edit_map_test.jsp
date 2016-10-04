<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Test Mapping | HealthPlease.in</title>
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

<%@include file="user_footer.jsp" %>

</body>
</html>