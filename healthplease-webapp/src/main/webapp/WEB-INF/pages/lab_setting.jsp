<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HealthPlease - Lab Setting</title>

   
</head>

<body>

    <div id="wrapper">

		<%@include file="lab_header.jsp" %>        
<!-- Right Side Panel Starts From HERE -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Settings</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <!-- <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">Coming Soon</h3>
                    <h4> Soon you are able to create your own slots </h4>
                    <h4> Block working days of yours  </h4>
                </div>
                /.col-lg-12
            </div> -->
			<div class="row">
				<%--  <%@include file="admin_header.jsp" %> --%>
				<div class="col-lg-1 col-md-3 offset"></div>
				<div class="col-lg-9 col-md-9" style="">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#setting1">Report
								Settings</a></li>
						<li><a data-toggle="tab" href="#setting3">Profile Settings</a></li>
						<li><a data-toggle="tab" href="#setting2">Other Settings</a></li>
					</ul>

					<div class="tab-content">
				
						<div id="setting1" class="tab-pane fade in active">
							<!-- <div class="container"> -->
								<div class="row">
									<form action="<%=Constants.UPDATE_LAB_REPORT_SETTINGS_POST_URL %>" method="post" enctype="multipart/form-data">
									<input type="hidden" name="id" value="${user.lab.id}">
									<div class="col-md-9">
										<div class="panel panel-default" style="margin-top: 5%">
											<div class="panel-heading">Header</div>
											<div class="panel-body">
												<div class="checkbox">
													<label>
														<c:if test="${user.lab.reportConfig.isHeader == 'y'}">
															<input type="checkbox" name="reportConfig.isHeader" value="y" checked>Include Header
														</c:if>
														<c:if test="${user.lab.reportConfig.isHeader != 'y'}">
															<input type="checkbox" name="reportConfig.isHeader" value="y">Include Header
														</c:if>
													</label>
												</div>
											</div>
										</div>

										<div class="panel panel-default">
											<div class="panel-heading">Footer</div>
											<div class="panel-body">
												<div class="checkbox">
													<label>
														<c:if test="${user.lab.reportConfig.isFooter == 'y'}">
															<input type="checkbox" name="reportConfig.isFooter" value="y" checked>Include Footer
														</c:if>
														<c:if test="${user.lab.reportConfig.isFooter != 'y'}">
															<input type="checkbox" name="reportConfig.isFooter" value="y">Include Footer
														</c:if>
													</label>
												</div>
											</div>
										</div>
										
										

										<div class="panel panel-default">
											<div class="panel-heading">Report Signature</div>
											<div class="panel-body">
												<span>Choose file</span></br>
												<div class="fileinput fileinput-new"
													data-provides="fileinput">
													<span class="btn btn-default btn-file"><input type="file" name="reportConfig.signatureFile" /></span>
												</div>
												<!-- <div class="checkbox">
													<label><input type="checkbox" value="">Include
														Signature</label>
												</div> -->
												<div class="checkbox">
													<label>
														<c:if test="${user.lab.reportConfig.isSignature == 'y'}">
															<input type="checkbox" name="reportConfig.isSignature" value="y" checked>Include Signature
														</c:if>
														<c:if test="${user.lab.reportConfig.isSignature != 'y'}">
															<input type="checkbox" name="reportConfig.isSignature" value="y">Include Signature
														</c:if>
													</label>
												</div>
												<div class="">
                									<input name="reportConfig.name" style="margin-top:20px" value="${user.lab.reportConfig.name}" placeholder="Doctor Name" class="form-control input-md" type="text">      
              									</div>
              									<div class="">
                									<input name="reportConfig.designation" style="margin-top:20px" value="${user.lab.reportConfig.designation}" placeholder="Designation" class="form-control input-md" type="text">      
              									</div>
											</div>
										</div>
										
										
										<div class="panel panel-default">
											<div class="panel-heading">Invoice Signature</div>
											<div class="panel-body">
												<span>Choose file</span></br>
												<div class="fileinput fileinput-new"
													data-provides="fileinput">
													<span class="btn btn-default btn-file"><input type="file" name="reportConfig.signatureFile" /></span>
												</div>
												<!-- <div class="checkbox">
													<label><input type="checkbox" value="">Include
														Signature</label>
												</div> -->
												<div class="checkbox">
													<label>
														<c:if test="${user.lab.reportConfig.isSignature == 'y'}">
															<input type="checkbox" name="reportConfig.isSignature" value="y" checked>Include Signature
														</c:if>
														<c:if test="${user.lab.reportConfig.isSignature != 'y'}">
															<input type="checkbox" name="reportConfig.isSignature" value="y">Include Signature
														</c:if>
													</label>
												</div>
												<div class="">
                									<input name="reportConfig.name" style="margin-top:20px" value="${user.lab.reportConfig.name}" placeholder="Doctor Name" class="form-control input-md" type="text">      
              									</div>
              									<div class="">
                									<input name="reportConfig.designation" style="margin-top:20px" value="${user.lab.reportConfig.designation}" placeholder="Designation" class="form-control input-md" type="text">      
              									</div>
											</div>
										</div>
										
										<button type="submit" style="float: right"
											class="btn btn-primary">Save</button>

									</div>
									</form>
								</div>
							<!-- </div> -->
						</div>


						<div id="setting2" class="tab-pane fade in">
							<!-- <div class="container" style="height: 500px"> -->
								<div class="row">
				
									<div class="col-md-9" style="margin: 5%">
										<form action="<%=Constants.UPLOAD_LOGO_POST_URL%>" method="post" enctype="multipart/form-data">
										<div class="panel panel-default">
											<div class="panel-heading">Lab Logo</div>
											<div class="panel-body">
												<span>Choose file</span></br>
												<div class="fileinput fileinput-new"
													data-provides="fileinput">
													<span class="btn btn-default btn-file"><input
														type="file" name="logoFile" /></span>
													<input type="hidden" name="id" value="${user.lab.id}">
												</div>
											</div>
										</div>
										<button type="submit" style="float: right"
											class="btn btn-primary">Submit</button>
										</form>
									</div>
								</div>
						<!-- 	</div> -->
						</div>
						
							<div id="setting3" class="tab-pane fade in">
							<!-- <div class="container" style="height: 500px"> -->
								<div class="row">
								<div class="col-md-9" style="margin: 5%">
										<div class="panel panel-default">
											<div class="panel-heading">Change Password</div>
											<div class="panel-body">
											<div class="col-md-8 col-md-offset-2">
												<%@include file="forms/change_password_form.jsp" %>
											</div>
											</div>
										</div>
										
									</div>
						
								</div>
						<!-- 	</div> -->
							</div>
				
					</div>
				</div>
			</div>
			<!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
    <%@include file="lab_footer.jsp" %>
</body>
</html>