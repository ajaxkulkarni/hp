<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="col-lg-2 col-md-2">
		<div class="row">
			<div class="col-md-12 column margintop20">
				<ul class="nav nav-pills nav-stacked classCustomAMenu">
					<li class="${activeList[0]}"><a href="<%=Constants.ADMIN_HOME_GET_URL%>"><span
							class="glyphicon glyphicon-chevron-right"></span> Controller</a></li>
					<li class="${activeList[1]}"><a href="<%=Constants.ADMIN_CATEGORIES_GET_URL%>"><span
							class="glyphicon glyphicon-chevron-right"></span> Test Category</a></li>
					<li class="${activeList[2]}"><a href="<%=Constants.ADMIN_TESTS_GET_URL%>" class="active2"><span
							class="glyphicon glyphicon-chevron-right"></span> Test</a></li>
					<li class="${activeList[3]}"><a href="<%=Constants.ADMIN_LOCATIONS_GET_URL%>"><span
							class="glyphicon glyphicon-chevron-right"></span> Location</a></li>
					<li class="${activeList[4]}"><a href="<%=Constants.ADMIN_LABS_GET_URL%>"><span
							class="glyphicon glyphicon-chevron-right"></span> Lab</a></li>
					<li class="${activeList[5]}"><a href="<%=Constants.ADMIN_LAB_DASHBOARD_GET_URL%>"><span
							class="glyphicon glyphicon-chevron-right"></span> Lab Dashboard</a></li>
					<li class="${activeList[6]}"><a href="<%=Constants.ADMIN_CORPORATE_GET_URL%>"><span
							class="glyphicon glyphicon-chevron-right"></span> Corporate</a></li>		
					<li class="${activeList[7]}"><a href="<%=Constants.ADMIN_PARAMETERS_GET_URL%>"><span
							class="glyphicon glyphicon-chevron-right"></span> Test Parameters</a></li>
					<li class="${activeList[8]}"><a href=""><span
							class="glyphicon glyphicon-chevron-right"></span> Slots</a></li>
					<li class="${activeList[9]}"><a href=""><span
							class="glyphicon glyphicon-chevron-right"></span> Fix Appointment</a></li>
					<li class="${activeList[10]}"><a href=""><span
							class="glyphicon glyphicon-chevron-right"></span> Users</a></li>
					<li class="${activeList[11]}"><a href=""><span
							class="glyphicon glyphicon-chevron-right"></span> Reports</a></li>
					<li><a href=""><span
							class="glyphicon glyphicon-chevron-right"></span>Settings</a></li>
				</ul>
			</div>
		</div>
		<!-- /.panel-heading -->
	</div>

</body>
</html>