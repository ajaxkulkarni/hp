<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<table class='table table-bordered'>
		<tr>
			<td>Test</td>
			<td><c:forEach var="test" items="${appointment.tests}">
					${test.name} || ${test.price} <br />
				</c:forEach></td>
		</tr>
		<tr id="idErrTest"></tr>

		<tr>
			<td>Location</td>
			<td>${appointment.location.name}</td>
		</tr>
		<tr>
			<td>Lab</td>
			<td>${appointment.lab.name}</td>
		</tr>
		<tr id="idErrLocation"></tr>
		<tr>
			<td>Appointment Date</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${appointment.date}" /></td>
		</tr>
		<tr>
			<td>Appointment Slot</td>
			<td>
				${appointment.slot.startTime} - ${appointment.slot.endTime}
			</td>
		</tr>

	</table>

</body>
</html>