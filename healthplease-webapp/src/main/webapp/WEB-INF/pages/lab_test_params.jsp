<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>HealthPlease - Appointments</title>
<!-- Bootstrap Core CSS -->
<!-- <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
MetisMenu CSS
<link href="dist/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
Timeline CSS
<link href="dist/css/timeline.css" rel="stylesheet">
Custom CSS
<link href="labcomponents/css/sb-admin-2.css" rel="stylesheet">
Morris Charts CSS
<link href="dist/morrisjs/morris.css" rel="stylesheet">
Custom Fonts
<link href="labcomponents/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css"> -->


</head>
<body>
	<div id="wrapper">
	
		<%@include file="lab_header.jsp" %>
		
		<link href="<c:url value="/resources/css/prepare_report.css"/>" rel="stylesheet" type="text/css">
	
		<!-- <nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href=""><img src="images/LOGO-2.png"
					class="classLogoImg" /></a>
			</div>
			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><div class="sidebar-nav navbar-collapse">
						<input type="hidden" id="lab_id" name="lab_name" value="">
						<h3>Dhanwantari Path Lab</h3>
					</div></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-user"></i><b
						class="caret"></b></a>
				<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
						<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a></li>
						<li class="divider"></li>
						<li><a href="logout.php"><i class="fa fa-fw fa-power-off"></i>
								Log Out</a></li>
					</ul></li>
			</ul>
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a class="active" href="lab-dashboard.php"><i
								class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
						<li><a href="#"><i class="fa fa-wrench fa-fw"></i>
								Statistics<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
								<li><a href="appointments.html">Appointments</a></li>
								<li><a href="test_completed.html">Test Completed</a></li>
								<li><a href="payment_modes.html">Payment Modes</a></li>
								<li><a href="frequent_tests.html">Frequent Tests</a></li>
								<li><a href="test_used.html"> Test/Packages Used</a></li>
							</ul></li>
						<li><a class="" href="lab-bookAppointment.php"><i
								class="fa fa-calendar fa-fw"></i> Book an Appointment</a></li>
						<li><a href="javascript:void(0);"><i
								class="fa fa-bar-chart-o fa-fw"></i> Availability<span
								class="fa arrow"></span></a>
						<ul class="nav nav-second-level ">
								<li><a class="" href="lab-daySettings.php">Day</a></li>
							</ul></li>
						<li><a class="" href="lab-slots.php"><i
								class="fa fa-table fa-fw"></i> Slots</a></li>
						<li><a class="" href="lab-settings.php"><i
								class="fa fa-cogs fa-fw"></i> Settings</a></li>
						<li><a href="logout.php"><i class="fa fa-sign-out fa-fw"></i>
								Log Out</a></li>
					</ul>
				</div>
			</div>
		</nav> -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Prepare Report</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<c:if test="${result != null}">
                <div class="alert alert-success">
                	${result}
  				</div>
  			</c:if>
			<!-- **** Code added for prepare report div **** -->
			<div id="prepare_report_div">
				<div class="row">
					<div class="col-lg-12">
						<p>
							<label>Name: ${appointment.user.firstName}</label><br />
							<label>Reg.No.: ${appointment.id}</label><br />
						</p>
						<div class="panel panel-default">
							<div class="panel-heading">Select tests which you want to
								prepare</div>
							<!-- .panel-heading -->
							<form action="<%=Constants.GENERATE_REPORT_POST_URL%>" method="post" id="report_form" onsubmit="return validate()">
							<div class="panel-body">
									<div class="panel-group" id="accordion">
									<input type="hidden" id="is_send_mail" name="printRequired" value="N">
									<input type="hidden" id="appointment_id" name="id" value="${appointment.id}">
									<c:forEach items="${appointment.tests}" var="test" varStatus="t">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<input type="checkbox" value="${test.id}" name="testIds"/>
													<a data-toggle="collapse" data-parent="#accordion"
														href="#${test.id}">${test.name}</a>
													<c:if test="${test.reportSent == 'Y' }">
														<i class="fa fa-check-square" style='float:right' aria-hidden="true"></i>
													</c:if>
												</h4>
											</div>
											<input type="hidden" name="tests[${t.index}].id" value="${test.id}" />
											<div id="${test.id}" class="panel-collapse collapse">
												<div class="panel-body">
													<table class="table table-bordered">
														<thead>
															<th>Tests</th>
															<th>Test Values</th>
															<th>Units</th>
															<th>Normal Values</th>
														</thead>
														<tbody>
															<c:forEach items="${test.parameters}" var="testParameter" varStatus="p">
																<tr>
																	<td>${testParameter.name}</td>
																	<td>
																		<c:if test="${test.reportSent == 'Y' }">
																			<c:if test="${testParameter.type == 'D' }">
																				<textarea name="tests[${t.index}].parameters[${p.index}].actualValue" rows="5" cols="50" readonly="readonly">${testParameter.actualValue}</textarea>
																			</c:if>
																			<c:if test="${testParameter.type != 'D' }">
																				<input type="text" name="tests[${t.index}].parameters[${p.index}].actualValue" value="${testParameter.actualValue}" readonly="readonly" />
																			</c:if>
																		</c:if>
																		<c:if test="${test.reportSent == null  || test.reportSent == 'N'}">
																			<c:if test="${testParameter.type == 'D' }">
																				<textarea name="tests[${t.index}].parameters[${p.index}].actualValue" rows="5" cols="50" maxlength="250">${testParameter.actualValue}</textarea>
																			</c:if>
																			<c:if test="${testParameter.type != 'D' }">
																				<input type="text" name="tests[${t.index}].parameters[${p.index}].actualValue" value="${testParameter.actualValue}" />
																			</c:if>
																		</c:if>
																		<input type="hidden" name="tests[${t.index}].parameters[${p.index}].id" value="${testParameter.id}" />
																	</td>
																	<td>${testParameter.unit}</td>
																	<td>${testParameter.normalValue}</td>
																</tr>
															</c:forEach>
															
															
														</tbody>
													</table>
												</div>
											</div>
										</div>
										
									</c:forEach>
										
								</div>
								<button type="button" class="btn btn-primary" onclick="sendReport()">Send</button>
								<button type="submit" class="btn btn-primary">Export</button>
								</div>
							</form>
							<!-- .panel-body -->
						</div>
						<!-- /.panel -->
					</div>
				</div>
			</div>
			<!-- **** End of Code added for prepare report div **** -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- jQuery -->
	
	<script type="text/javascript">
	
   	function validate() {
      var checked = $("input[type=checkbox]:checked").length;

      if(!checked) {
        alert("You must select at least one test.");
        return false;
      }
      
   	}
 

</script>
	
	<%@include file="lab_footer.jsp" %>
	
</body>
</html>