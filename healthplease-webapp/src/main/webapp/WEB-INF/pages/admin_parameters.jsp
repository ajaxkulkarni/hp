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
<a href="" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Add New Parameter</a>
<a href="<%=Constants.ADMIN_TEST_PARAMETERS_MAP_GET_URL%>" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Mapping</a>
<input type="text" id="search" class="form-control" placeholder="Search">
<br/>
Upload Test Parameters :
<form action="<%=Constants.ADMIN_UPLOAD_PARAMETERS_POST_URL %>" method="post" enctype="multipart/form-data">
<input type="file" id="file" name="file" placeholder="Search"/>
<br/>
<button type="submit" class="btn btn-large btn-info"><i class="glyphicon glyphicon-plus"></i> &nbsp; Upload</button>
</form>
</div>

<div class="clearfix"></div><br/>
<!--Main div where content get loaded-->
<div class="" id="loadUser" name="loadUser">
<table id="par_table" class="table table-bordered table-responsive paginate">
                    <tbody>
					<tr class="page_header">
                    <th>#</th>
                    <th>Parameter Name</th>
                    <th>Normal Value</th>
                    <th>Male</th>
                    <th>Female</th>
                    <th>Methods</th>
                    <th>Unit</th>
                    <th colspan="2" align="center">Actions</th>
                    </tr>                
                <c:forEach items="${parameters}" var="par" varStatus="i">
                <tr>
                	<td>${i.index + 1}</td>
                	<td>${par.name}</td>
                	<td>${par.normalValue}</td>
                	<td>${par.normalValueMale}</td>
                	<td>${par.normalValueFemale}</td>
                	<td>
                		<c:forEach items="${methods}" var="method">
                			${method},
                		</c:forEach>
                	</td>
                	<td>${par.unit}</td>
                	<td align="center">
                		<a href="" class="js-edituser"><i class="glyphicon glyphicon-edit"></i></a>
                	</td>
                	<td align="center">
                		<a href="" class="js-deleteuser" onclick="confirmDelete('${par.name}','${par.id}')" ><i class="glyphicon glyphicon-remove-circle"></i></a>
                	</td>
                </tr>
                </c:forEach>
                </tbody></table>
                
</div>    
<ul class="pagination" id="pagination_list">
</ul>


<form id="par_form" action="" method="post">

	<input type="hidden" id="par_id" name="id"/>

</form>


<!--Add user ends here-->

<script>
$(document).ready(function(){
	paginateTable(21,0);
}); 

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
<script>



   function confirmDelete(name,id) {
	   if(confirm("Are you sure you want to delete parameter " + name + " ?")) {
		   $("#par_id").val(id);
		   $("#par_form").submit();
	   }
   }
   
   $('#search').keyup(function()
		    {
		    	searchTable($(this).val());
		    	 $("#par_table").paging({limit:21});
		    });
		    
		    function searchTable(inputVal)
		    {
		    	var table = $('#par_table');
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