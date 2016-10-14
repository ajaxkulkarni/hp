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
    <title>Admin Users | HealthPlease.in</title>
    
</head>

<body>
<%@include file="user_header.jsp" %>

        <div class="classGoldenDivider"></div> 
        <div class="classTopHeading">
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
<a href="<%=Constants.ADMIN_EDIT_LOCATION_GET_URL %>" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Add New Location</a>
<select id="limit" id="limit" class="form-control"  onchange="resetTable()">
                                        <option>5</option>
                                        <option>10</option>
                                        <option>20</option>
                                        <option>50</option>
                                        <option>100</option>
                                    </select>

</div>

<div class="clearfix"></div><br/>
<!--Main div where content get loaded-->
<div class="" id="loadUser" name="loadUser">
<table id="user_table" class="table table-bordered table-responsive paginate">
                    <tbody><tr class="page_header">
                    <th>#</th>
                    <th>User Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Mobile No.</th>
                    <th>Address</th>
                    <th>Landmark</th>
                    <th>Area</th>
                    <th>Pincode</th>
                    <th>City</th>
                    <th>Gender</th>
                    <th>Date Of Birth</th>
                    <th colspan="1" align="center">History</th>
                    </tr>                
                <c:forEach items="${locations}" var="loc" varStatus="i">
                <tr>
                	<td>${i.index + 1}</td>
                	<td>${loc.id}</td>
                	<td>${loc.name}</td>
                	<td align="center">
                		<a href="<%=Constants.ADMIN_EDIT_LOCATION_GET_URL%>?id=${loc.id}&name=${loc.name}" class="js-edituser"><i class="glyphicon glyphicon-edit"></i></a>
                	</td>
                	<td align="center">
                		<a href="#" class="js-deleteuser" onclick="confirmDelete('${loc.name}','${loc.id}')" ><i class="glyphicon glyphicon-remove-circle"></i></a>
                	</td>
                </tr>
                </c:forEach>
                </tbody></table>
                
</div>    
<ul class="pagination" id="pagination_list">
</ul>


<form id="loc_form" action="<%=Constants.ADMIN_DELETE_LOCATION_POST_URL %>" method="post">

	<input type="hidden" id="loc_id" name="id"/>

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
<script>

$(document).ready(function(){
	paginateTable($("#limit").val(),0);
	 
}); 

function resetTable() {
	 paginateTable($("#limit").val(),0);
}   
  
   
   function confirmDelete(name,id) {
	   if(confirm("Are you sure you want to delete location " + name + " ?")) {
		   $("#loc_id").val(id);
		   $("#loc_form").submit();
		   //document.getElementById("loc_form").submit();
	   }
	   return false;
   }
   
</script>
  <!-- modal for histry of users past appointments -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">User History</h4>
        </div>
        <div class="modal-body">
            <div class="row">
            <div class="col-md-12">    
          <table class="table table-bordered table-responsive">
			<tbody>
				<tr>
					<th>Appointment ID</th>
					<th>Name</th>
					<th>Lab Name</th>
					<th>Test Name || Test Charge</th>
					<!--   <th>Test Charge</th> -->
					<th>Date</th>
					<th>Status</th>
					
				</tr>
				<c:forEach items="${user.appointments}" var="appointment">
					<tr>
						<td>${appointment.id}</td>
						<td>${appointment.user.firstName}</td>
						<td>${appointment.lab.name}</td>
						<td>
						<c:forEach items="${appointment.tests}" var="test">
						${test.name} || ${test.price} 
						<c:if test="${test.reportSent == 'Y' || test.fileLocation != null}">
							<a style="" target="_blank" href="getReport?appointmentId=${appointment.id}&testId=${test.id}">download</a>
						</c:if>
						<br>
						</c:forEach>
						</td>
						<td>${appointment.date}</td>
						<td>${appointment.status.name}</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
                </div>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

  <!-- modal ends -->  
</body>

</html>