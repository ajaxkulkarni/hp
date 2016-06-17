<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">

function cancel(id) {
	
	if(!confirm("Do you really want to cancel this appointment?")) {
		return;
	}
	$("#cancelAppointmentId").value(id);
	$("#cancel_form").submit();
	/* $.ajax({
	   	type : "POST",
	       url : 'cancelAppointment',
	       data: "appointmentId=" + id,
	       success : function(msg) {
	    	   if(msg == 'OK') {
	    		   alert("Appointment cancelled successfully!");
	    		   location.reload();
	    	   }
	       },
	       error: function(e){
	       	alert("Error: " + e);
	   	}
	   });  */
}

</script>
</head>
<body>


	<h1>History</h1>

	<div id="user_history">
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
					<th colspan="2" align="center">Actions</th>
				</tr>
				<c:forEach items="${user.appointments}" var="appointment">
					<tr>
						<td>${appointment.id}</td>
						<td>${appointment.user.firstName}</td>
						<td>${appointment.lab.name}</td>
						<td>
						<c:forEach items="${appointment.tests}" var="test">
						${test.name} || ${test.price}
						<br>
						</c:forEach>
						<c:if test="${appointment.status.id == 3}">
							<a style="" target="_blank" href="getReport?appointmentId=${appointment.id}">download</a>
						</c:if>
						</td>
						<td>${appointment.date}</td>
						<td>${appointment.status.name}</td>
						<td align="center">
							<c:if test="${appointment.status.id == 1}">
								<a id="407" class="js-editappointment" onclick="">edit</a>
								<a class="js-cancelappointment" onclick="cancel(${appointment.id})">cancel</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form action="<%=Constants.CANCEL_APPOINTMENT_POST_URL %>" method="post" id="cancel_form">
			<input type="hidden" id="cancelAppointmentId" name="${appointment.id}">
			<input type="hidden" name="status.cancelId"> 
			<input type="hidden" id="statusId" name="status.id" value="2" />
		</form>
	</div>
</body>
</html>