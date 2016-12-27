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
    <title> Users | HealthPlease.in</title>
    
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


<div class="clearfix"></div>

<div id="msg" class="container">
	<input type="hidden" id="labId" value="${user.lab.id}">
</div>

<div class="" id="div_add">
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
                    <!-- <th>Landmark</th>
                    <th>Area</th>
                    <th>Pincode</th>
                    <th>City</th> -->
                    <th>Gender</th>
                    <th>Date Of Birth</th>
                    <th colspan="1" align="center">History</th>
                    </tr>                
                <c:forEach items="${users}" var="user" varStatus="i">
                <tr>
                	<td>${i.index + 1}</td>
                	<td>${user.id}</td>
                	<td>${user.firstName}</td>
                	<td>${user.lastName}</td>
                	<td>${user.email}</td>
                	<td>${user.phone}</td>
                	<td>${user.address}</td>
                	<td>${user.gender}</td>
                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.dob}"/></td>
                	<td><button type="button" class="btn btn-info btn-lg" onclick="showAppointments('${user.email}')">History</button></td>
                	<td><a href="<%=Constants.BOOK_APPOINTMENT_LAB_GET_URL%>?email=${user.email}"><button type="button" class="btn btn-info btn-lg">Book</button></a></td>
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
<%@include file="lab_footer.jsp" %>
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
			<tbody id="tbody">
				
					<%-- <tr>
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
						
					</tr> --%>
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
  <!-- modal for histry of users past appointments -->
</body>

</html>