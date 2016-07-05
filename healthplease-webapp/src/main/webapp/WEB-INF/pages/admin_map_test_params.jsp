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
    <title>Book online Pathology & Diagnostic Tests in Pune | HealthPlease.in</title>
    <link href="<c:url value="/resources/css/fixedheadertable.css"/>" rel="stylesheet" media="screen" />
	<link href="<c:url value="/resources/css/custom.css"/>" rel="stylesheet" media="screen" />
</head>

<body>
<%@include file="user_header.jsp" %>


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


<!--Add user start from here-->
<div class="container" id="addUser" name="addUser">
   
  <div class="row">
    <%@include file="admin_header.jsp" %> 
<div class="col-lg-9 col-md-9">


<div class="clearfix"></div>

<div id="msg" class="container"></div>

<form action="<%=Constants.ADMIN_UPLOAD_TEST_PARAMETER_MAP_POST_URL %>" method="post">
<div class="" id="div_add">
<button type="submit" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Save</button>
</div>

<div class="clearfix"></div><br/>
<!--Main div where content get loaded-->
<div class="" id="loadUser" name="loadUser">
<div class="outerbox">
            <div class="innerbox">
<table class="bluetable" id="myDemoTable" cellpadding="0" cellspacing="0">
        		    <thead>
        		        <tr>
                            <TH>test/para</TH>
                            <c:forEach items="${parameters}" var="par">
                            	<TH>${par.name}</TH>
                            </c:forEach>
        		        </tr>
        		    </thead>
        		  
        		    <tbody>
        		    	<c:forEach items="${tests}" var="test">
						<tr><td>${test.name}</td>
							<c:forEach items="${parameters}" var="par">
								<c:set var="mapped" value=""/>
								<c:forEach items="${test.parameters}" var="testPar">
									<c:if test="${testPar.name == par.name}">
										<c:set var="mapped" value="checked"></c:set>
									</c:if>
								</c:forEach>
								<td><input type="checkbox" value="${test.id},${par.id}" ${mapped} name="mappings"></td>
                        	</c:forEach>
						</tr>
						</c:forEach>
        		    </tbody>
        		</table>               
      </div>
      </div>          
</div>    
</form>
<form id="cat_form" action="<%=Constants.ADMIN_DELETE_CATEGORY_POST_URL %>" method="post">

<input type="hidden" id="cat_id" name="id"/>

</form>


<!--Add user ends here-->

<script>
   
</script>
    
   </div>  
  </div>      
</div>
        <!-- /#page-wrapper -->
    <!-- /#wrapper -->
<%@include file="user_footer.jsp" %>
<script src="<c:url value="/resources/js/paging.js"/>"></script> 
<%--<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<c:url value="/resources/js/jquery.paging.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.easy-paging.js"/>"></script> --%>
<script src="<c:url value="/resources/js/myPagination.js"/>"></script> 
<script src="<c:url value="/resources/js/jquery-1.7.2.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.fixedheadertable.js"/>"></script>
<script>

$(document).ready(function(){
	 $('#myDemoTable').fixedHeaderTable({
         altClass : 'odd',
         footer : true,
         fixedColumns : 1
     });
}); 

function confirmDelete(name,id) {
	   if(confirm("Are you sure you want to delete category " + name + " ?")) {
		   $("#cat_id").val(id);
		   $("#cat_form").submit();
	   }
}

   
</script>
</body>

</html>