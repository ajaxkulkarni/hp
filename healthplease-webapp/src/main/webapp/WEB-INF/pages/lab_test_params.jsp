<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>HealthPlease - Appointments</title>
</head>
<body>
	<div id="wrapper">
	
		<%@include file="lab_header.jsp" %>
		
		<link href="<c:url value="/resources/css/prepare_report.css"/>" rel="stylesheet" type="text/css">
	
		<div id="page-wrapper">
			<form action="<%=Constants.GENERATE_REPORT_POST_URL%>" method="post" id="report_form" onsubmit="return validate()">
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
		
			<div id="header_footer" style="border:">
			<div class="panel panel-default">
			<div class="panel-heading">Report Settings</div>
			<input type="hidden" name="signaturePath" value="${user.lab.reportConfig.signaturePath}">
			<div class="row" style="margin:20px">
			<div class="col-md-4">
				<c:if test="${user.lab.reportConfig.isHeader == 'y'}">
					<input type="checkbox" name="isHeader" value="y" checked> Include Header
				</c:if>
				<c:if test="${user.lab.reportConfig.isHeader != 'y'}">
					<input type="checkbox" name="isHeader" value="y"> Include Header
				</c:if>
           </div> 
           
           	<div class="col-md-4">
				<c:if test="${user.lab.reportConfig.isFooter == 'y'}">
					<input type="checkbox" name="isFooter" value="y" checked> Include Footer
				</c:if>
				<c:if test="${user.lab.reportConfig.isFooter != 'y'}">
					<input type="checkbox" name="isFooter" value="y"> Include Footer
				</c:if>
           </div> 
           
           <div class="col-md-4">
				<c:if test="${user.lab.reportConfig.isSignature == 'y'}">
					<input type="checkbox" name="isSignature" value="y" checked> Include Signature
				</c:if>
				<c:if test="${user.lab.reportConfig.isSignature != 'y'}">
					<input type="checkbox" name="isSignature" value="y"> Include Signature
				</c:if>
           </div> 
         <div class="col-md-4">
				<input type="checkbox" name="isSeparatePage" value="y"> Each Test on separate page
           </div> 
           
			</div>
			
			
			<div class="row" style="margin:20px"">
			 
			<div class="col-md-8">
			<div class="">
				<input name="name" style="margin-top:20px" value="${user.lab.reportConfig.name}" placeholder="Doctor Name" class="form-control input-md" type="text">      
			</div>
			<div class="">
				<input name="designation" style="margin-top:20px" value="${user.lab.reportConfig.designation}" placeholder="Designation" class="form-control input-md" type="text">      
			</div>
		<%-- 	<div class="">
				<input name="remark" style="margin-top:20px" value="${appointment.remark}" placeholder="Remark" class="form-control input-md" type="text">      
			</div> --%>
			</div>
			</div>
			</div>
			
			</div>
			
	<!-- invoice setting%%%%%%%%%%%%%%%%%%%%%%%%%%5 -->		

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
					<!--		 <form action="<%=Constants.GENERATE_REPORT_POST_URL%>" method="post" id="report_form" onsubmit="return validate()">  -->
							 <div class="panel-body">
									<div class="panel-group" id="accordion" >
									<input type="hidden" id="is_send_mail" name="printRequired" value="N">
									<input type="hidden" id="appointment_id" name="id" value="${appointment.id}">
									
									<c:forEach items="${appointment.tests}" var="test" varStatus="t">
										<c:if test="${fn:length(test.childTests) == 0 || fn:length(test.parameters) > 0 }">
										
											<%@include file="forms/test_parameters_form.jsp" %>
										
										</c:if>
										<c:if test="${fn:length(test.childTests) > 0 && fn:length(test.parameters) == 0 }">
											<h3>${test.name}</h3>
											<c:forEach items="${appointment.tests}" var="test" varStatus="t">
												<%@include file="forms/test_parameters_form.jsp" %>												
											</c:forEach>
										</c:if>
									</c:forEach>
									</div>
								</div>
								<button type="button" class="btn btn-primary" onclick="sendReport()">Send</button>
								<button type="button" class="btn btn-primary" onclick="exportReport()">Export</button>
								<button type="button" class="btn btn-primary" onclick="saveReport()">Save</button>
								</div>
							<%--  </form>  --%>
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