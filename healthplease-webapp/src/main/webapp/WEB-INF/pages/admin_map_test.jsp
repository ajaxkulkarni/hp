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

<div class="" id="div_add">
<a href="<%=Constants.ADMIN_EDIT_CATEOGORY_GET_URL %>" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Add New Test</a>
</div>

<div class="clearfix"></div><br/>
<!--Main div where content get loaded-->
<div class="" id="loadUser" name="loadUser">
<table id="categories_table" class="table table-bordered table-responsive">
                    <tbody><tr>
                    <th>#</th>
                    <th>Test Name</th>
                    <th>Test Charges</th>
                    <th colspan="2" align="center">Actions</th>
                    </tr>                
                <c:forEach items="${categories}" var="cat" varStatus="i">
                <tr>
                	<td>${i.index + 1}</td>
                	<td>${cat.categoryName}</td>
                	<td align="center">
                		<a href="<%=Constants.ADMIN_EDIT_CATEOGORY_GET_URL%>?id=${cat.id}&name=${cat.categoryName}" class="js-edituser"><i class="glyphicon glyphicon-edit"></i></a>
                	</td>
                	<td align="center">
                		<a href="" class="js-deleteuser" onclick="confirmDelete('${cat.categoryName}','${cat.id}')" ><i class="glyphicon glyphicon-remove-circle"></i></a>
                	</td>
                </tr>
                </c:forEach>
                </tbody></table>
                
</div>    
<!--Paging div will get content soon-->
<!-- <div class="" id="pagination">
    <table class='table table-bordered table-responsive'>
    <tr>
        <td colspan="7" align="center">
            <div class="pagination-wrap">
                <ul class="pagination">
                <ol id="paging">
                <li>
                	<a href='#' style='color:red;' class='js-pageDisplay'>#c</a>
                </li>
                <li>
                	<a href='#' class='js-pageDisplay'>#n</a>
                </li>
                </ol>
               </ul>
             </div>
        </td>
    </tr>
    </table>    
</div>    -->

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

<script>

$(document).ready(function(){
	 $("#categories_table").paging({limit:10});
	 /* $("#categories_table").paging(1337,{ // make 1337 elements navigatable
		    format: '[< ncnnn! >]', // define how the navigation should look like and in which order onFormat() get's called
		    perpage: 10, // show 10 elements per page
		    onFormat: function (type) {
		        switch (type) {
		        case 'block': // n and c
		            return '<a href="#">' + this.value + '</a>';
		        case 'next': // >
		            return '<a href="#">&gt;</a>';
		        case 'prev': // <
		            return '<a href="#">&lt;</a>';
		        case 'first': // [
		            return '<a href="#">first</a>';
		        case 'last': // ]
		            return '<a href="#">last</a>';
		        }
		    }
		}); */
	 /* $("#categories_table").easyPaging(1000, {
		    onSelect: function(page) {
		        console.log("You are on page " + page + " and you will select elements "+(this.slice[0]+1) + "-" + this.slice[1]+"!!!");
		    }
		}); */
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