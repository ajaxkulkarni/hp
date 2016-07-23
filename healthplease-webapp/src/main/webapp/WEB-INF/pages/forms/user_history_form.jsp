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

function cancel(id,labId) {
	
	if(!confirm("Do you really want to cancel this appointment?")) {
		return;
	}
	$("#cancelAppointmentId").val(id);
	$("#labId").val(labId)
	$("#cancel_form").submit();
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
						<c:if test="${test.reportSent == 'Y' || test.fileLocation != null}">
							<a style="" target="_blank" href="getReport?appointmentId=${appointment.id}&testId=${test.id}">download</a>
						</c:if>
						<br>
						</c:forEach>
						</td>
						<td>${appointment.date}</td>
						<td>${appointment.status.name}</td>
						<td align="center">
							<c:if test="${appointment.status.id == 1}">
								<a id="407" class="js-editappointment" href="<%=Constants.EDIT_APPOINTMENT_GET_URL %>?appointmentId=${appointment.id}" onclick="">edit</a>
								<a class="js-cancelappointment" onclick="cancel(${appointment.id},${appointment.lab.id})">cancel</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form action="<%=Constants.CANCEL_APPOINTMENT_POST_URL %>" method="post" id="cancel_form">
			<input type="hidden" id="cancelAppointmentId" value="" name="id">
			<input type="hidden" name="status.cancelId" value="1"> 
			<input type="hidden" id="statusId" name="status.id" value="2" />
			<input type="hidden" id="labId" name="lab.id" value="" />
		</form>
	</div>
</body>
</html>