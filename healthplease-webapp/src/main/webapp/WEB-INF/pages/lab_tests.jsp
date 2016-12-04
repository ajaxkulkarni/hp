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
<a href="<%=Constants.LAB_EDIT_TEST_GET_URL %>" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Add New Test</a>
</div>

<div class="clearfix"></div><br/>
<!--Main div where content get loaded-->
<h1>${lab.name}</h1>
<div class="" id="loadUser" name="loadUser">
<input type="text" id="search" class="form-control" placeholder="Search">
<table id="tests_table" class="table table-bordered table-responsive paginate">
                    <tbody>
                    <tr class = "page_header">
                    <th>#</th>
                    <th>Test Name</th>
                    <th>Charge</th>
                    <th colspan="2" align="center">Actions</th>
                    </tr>                
                <c:forEach items="${tests}" var="test" varStatus="i">
                <tr>
                	<td>${i.index + 1}</td>
                	<td>${test.name}</td>
                	<td>${test.price}</td>
                	<td align="center">
                		<a href="<%=Constants.LAB_EDIT_TEST_GET_URL%>?id=${test.id}&name=${test.name}&charge=${test.price}" class="js-edituser"><i class="glyphicon glyphicon-edit"></i></a>
                	</td>
                	<td align="center">
                		<a href="#" class="js-deleteuser" onclick="confirmDelete('${test.name}','${test.id}')" ><i class="glyphicon glyphicon-remove-circle"></i></a>
                	</td>
                </tr>
                </c:forEach>
                </tbody></table>
                
</div>    
<!--Paging div will get content soon-->

<ul class="pagination" id="pagination_list">
</ul>


<form id="loc_form" action="<%=Constants.LAB_DELETE_LAB_TEST_POST_URL%>" method="post">

	<input type="hidden" id="test_id" name="testId"/>
	<%-- <input type="hidden" id="lab_id" name="labId" value="${lab.id}"/> --%>

</form>


<!--Add user ends here-->

<script>
   
</script>
    
   </div>  
  </div>      
</div>
</div>
</div>
        <!-- /#page-wrapper -->
    <!-- /#wrapper -->

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<c:url value="/resources/js/jquery.paging.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.easy-paging.js"/>"></script>
<script src="<c:url value="/resources/js/myPagination.js"/>"></script> 

<script type="text/javascript">

$(document).ready(function(){
	paginateTable(10, 0);
	 
}); 
   
   function confirmDelete(name,id) {
	   if(confirm("Are you sure you want to delete this test " + name + " from this Lab ?")) {
		   $("#test_id").val(id);
		   $("#loc_form").submit();
	   }
   }
   
   $('#search').keyup(function()
		    {
		    	searchTable($(this).val());
		    });
		    
		    function searchTable(inputVal)
		    {
		    	var table = $('#tests_table');
		    	table.find('tr').each(function(index, row)
		    	{
		    		var allCells = $(row).find('td');
		    		if(allCells.length > 0)
		    		{
		    			var found = false;
		    			allCells.each(function(index, td)
		    			{
		    				var regExp = new RegExp(inputVal, 'i');
		    				if(regExp.test($(td).text()))
		    				{
		    					found = true;
		    					return false;
		    				}
		    			});
		    			if(found == true)$(row).show();else $(row).hide();
		    		}
		    	});
		    }
   
</script>

</body>

</html>