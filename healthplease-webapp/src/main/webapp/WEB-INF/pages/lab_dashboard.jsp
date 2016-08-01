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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HealthPlease - Lab Dashboard</title>

    

</head>
<body>

    <div id="wrapper">
		<%@include file = "lab_header.jsp" %>
       <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/external/file_input/fileinput.css"/>">     
<style>
    .order-detail-well{
	max-width:400px;
	margin: 0;
}
.deal-name{
	white-space:nowrap;
	text-overflow:ellipsis;
	margin-top:0px;
	overflow:wrap;
	height:23px;
}
.your-order-table{
	box-shadow:0 1px 1px rgba(0, 0, 0, 0.05);
	border:1px #dddddd solid;
	border-radius: 4px;
}
.your-order-table thead{
	background-color: #f5f5f5;
    border-color: #dddddd;
    color: #333333;
}
.your-order-table thead th{
    background-color: #f5f5f5;
    color: #333333;
    font-size: 16px;
    font-weight: 500;
    padding: 14px !important;	
}
.reason{
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 2px;
    margin-top: 0;
}
.user-core-info{
	padding:14px 0 8px 0;
	background-color: #fff;
    border: 12px solid #f4f4f4;
	text-align:left;
}
.user-profile-img img{
	width: 100%;
	border: 1px solid #cccccc;
}
.user-core-info h3 {
    color: #333333;
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 10px;
    margin-top: 0;
}
.user-core-info p {
    margin-bottom: 5px;
}
.btn {
    border: 0px none;
    border-radius: 0px;
    text-transform: uppercase;
    font-family: "Open Sans","Helvetica Neue",Arial,sans-serif;
    font-weight: 700;
}
.btn-default {
    border-color: #398DF4;
    color: #FFF;
    background-color: #398DF4;
    transition: all 0.35s ease 0s;
}
</style>
<!-- Right Side Panel Starts From HERE -->
    <div id="dashContain">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <!--<h1 class="page-header">Dashboard</h1>-->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row" style="margin-top:10px">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="today">${fn:length(user.todaysAppointments)}</div>
                                    <div>Today's Appointments</div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=Constants.LAB_HOME_URL_GET%>">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="pending">${fn:length(user.pendingAppointments)}</div>
                                    <div>Pending Appointments</div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=Constants.LAB_HOME_PENDING_APPS_URL_GET%>" id="pending_app">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                     <div class="huge" id="total">${fn:length(user.appointments)}</div>
                                    <div>Total Appointments</div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=Constants.LAB_HOME_TOTAL_URL_GET %>" id="total_app" >
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="cancel">${fn:length(user.cancelledAppointments)}</div>
                                    <div style="font-size: 13px;">Cancelled Appointments</div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=Constants.LAB_HOME_CANCELLED_URL_GET%>" id="cancel_app" >
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Appointment Summary
                        </div>
                        <div class="panel-body">
                            <div class="row">
                            	<form action="<%=Constants.GET_APPOINTMENTS_FOR_DATES_POST_URL%>" method="post">
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-lg-6">
                                           <div class="form-group input-group">
                                               <input type="text" class="form-control fromCalendar" placeholder="From" name="date1" id="fromdate">
                                               <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                           </div>
                                        </div>     
                                        <div class="col-lg-6">
                                           <div class="form-group input-group">
                                               <input type="text" class="form-control toCalendar" placeholder="To" name="date2" id="todate">
                                               <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                           </div>
                                        </div>
                                    </div>    
                                </div>
                                <div class="col-lg-6">
                                    <button type="submit" class="btn btn-primary">Generate</button>
                                    <button type="reset" class="btn btn-default">Reset</button>
                                </div>
                                </form>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>    
            <div class="row">
               <div class="col-lg-12">
                   <!--<section class="search-list" id="overview">-->
                        <!--<div class="container">-->
<!--                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">-->
                                    <!--<div class="panel-body">-->
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6 col-xs-6">
                                                   <input type="text" id="search" class="form-control" placeholder="Search">
                                                </div> 
                                                <div class="col-md-6 col-xs-6">
                                                    <select id="limit" placeholder="Records to display" class="form-control" onchange="resetTable()">
                                                        <option>5</option>
                                                        <option>10</option>
                                                        <option>20</option>
                                                        <option>50</option>
                                                        <option>100</option>
                                                    </select>
                                                </div>
                                            
                                            
                                            </div>
                                        </div>    
                                        <div class="col-md-6 col-xs-6">
                                            <h3 id="appFor"> ${appointmentsTitle} </h3>
                                        </div>
                                        <div class="col-md-6 col-xs-6">
                                            <a href="<%=Constants.DOWNLOAD_EXCEL_GET_URL %>?header=${appointmentsTitle}" class="btn btn-default pull-right" style="margin-top:10px">Download</a>
                                        </div>
                                        <div class="table-responsive your-order-table paginate">
                                            <table class="table" id = "appointments_table">
                                                <thead>
                                                    <tr class="page_header">
                                                        <th>
                                                            App Id
                                                            <span class="fa fa-sort"></span>
                                                        </th>
                                                        <th>
                                                            Test Details
                                                            <span class="fa fa-sort"></span>
                                                        </th>
                                                        <th>
                                                            Test Charge
                                                            <span class="fa fa-sort"></span>
                                                        </th>
                                                        <th>
                                                            Discount
                                                            <span class="fa fa-sort"></span>
                                                        </th>
                                                        <th>
                                                            Address
                                                            <span class="fa fa-sort"></span>
                                                        </th>
                                                        <th>
                                                            Status
                                                            <span class="fa fa-sort"></span>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="not_found"></tbody>
                                                <tbody id="found">
                                                	<c:forEach items="${appointments}" var="appointment">
                                                    <tr>
                                                        <th>${appointment.id}</th>
                                                        <td>
                                                            <div class="well order-detail-well">
                                                                <div class="row">
                                                                    <div class="col-md-12 col-xs-12">
                                                                        <div id="test_name_{{order.id}}" style="display:block">
                                                                        	<c:forEach items="${appointment.tests}" var="test" varStatus="i">
                                                                        		${test.name}
                                                                        		<c:if test="${i.index < (fn:length(appointment.tests) -1) }">
                                                                        			,
                                                                        		</c:if>
                                                                        	</c:forEach>
                                                                        </div>
                                                                        <h4>
                                                                            <i style="vertical-align:top;" class="fa fa-calendar"></i>
                                                                            <div style="display:inline-block;">
                                                                                <div><fmt:formatDate pattern="EEEEE" value="${appointment.date}"/> , ${appointment.slot.startTime} to ${appointment.slot.endTime}</div>
                                                                                <div>
                                                                                    <small><fmt:formatDate pattern="MMM, dd yyyy" value="${appointment.date}"/></small>
                                                                                </div>
                                                                            </div>
                                                                        </h4>
                                                                    </div>
                                                                    <div class="col-md-4 col-xs-4">
                                                                        <h6 class="reason">Name</h6>
                                                                        <p class="no-m">${appointment.user.firstName}</p>
                                                                    </div> 
                                                                    <div class="col-md-4 col-xs-4">
                                                                        <h6 class="reason">Contact</h6>
                                                                        <p class="no-m">${appointment.user.phone}</p>
                                                                    </div>
                                                                    <div class="col-md-4 col-xs-4">
                                                                        <h6 class="reason">Payment Type</h6>
                                                                        <p class="no-m">${appointment.payment.type}</p>
                                                                    </div> 
                                                                    <c:if test="${appointment.status.id == 1}">
                                                                    <div class="col-md-12 col-xs-12 m-t-10">
                                                                        <button style="text-transform:capitalize;" onclick="onUpload(${appointment.id})" class="btn btn-sm btn-default">Upload Report</button>
                                                                        <a href="<%=Constants.LAB_PREPARE_REPORT_GET_URL %>?appointmentId=${appointment.id}"  ><button style="text-transform:capitalize;" class="btn btn-sm btn-default">Prepare Report</button></a>
                                                                        <button style="text-transform:capitalize;" onclick="onCancel(${appointment.id})" class="btn btn-sm">Cancel</button>
                                                                    </div>
                                                                    </c:if>
                                                                    <c:if test="${appointment.status.id == 3}">
                                                                    <div class="col-md-12 col-xs-12 m-t-10">
																		<a href="<%=Constants.LAB_PREPARE_REPORT_GET_URL %>?appointmentId=${appointment.id}"  >
                                                                        <button style="text-transform:capitalize;" class="btn btn-sm btn-default">View Report</button>
                                                                        </a>	
                                                                        <a href="<%=Constants.LAB_INVOICE_GET_URL %>?appointmentId=${appointment.id}"  >
                                                                        <button style="text-transform:capitalize;" class="btn btn-sm btn-default">Invoice</button>
                                                                        </a>
																	</div>
																	</c:if>
																	<c:if test="${appointment.status.id == 4}">
																		<button style="text-transform:capitalize;" onclick="onUpload(${appointment.id})" class="btn btn-sm btn-default">Upload Report</button>
                                                                        <a href="<%=Constants.LAB_PREPARE_REPORT_GET_URL %>?appointmentId=${appointment.id}"  >
                                                                        <button style="text-transform:capitalize;" class="btn btn-sm btn-default">Complete Report</button>
                                                                        </a>
                                                        			</c:if>
                                                                </div>
                                                            </div>                                            
                                                        </td>
                                                        <td><h4>Rs. ${appointment.payment.amount}
                                                        	</h4>
                                                        </td>
                                                        <td><h4>Rs. ${appointment.payment.discount}
                                                        	</h4>
                                                        </td>
                                                        <td>
                                                        <c:if test="${appointment.address == null }">
                                                        	NA
                                                        </c:if>
                                                        <c:if test="${appointment.address != null }">
                                                        	<p id="address_{{order.id}}">${appointment.address.street},${appointment.address.landmark},${appointment.address.area},${appointment.address.zipCode}
                                                        	</p>
                                                        </c:if>
                                                        </td>
                                                        <td>
                                                        	<c:if test="${appointment.status.id == 1}">
                                                        		<span class="label label-info"><i class="fa fa-thumbs-o-up p-r-5"></i> Pending</span>
                                                        	</c:if>
                                                        	<c:if test="${appointment.status.id == 2}">
                                                        		<span class="label label-danger"><i class="fa fa-times p-r-5"></i> Cancelled</span>
                                                        	</c:if>
                                                        	<c:if test="${appointment.status.id == 3}">
                                                        		<span class="label label-success"><i class="fa fa-check p-r-5"></i> Completed</span>
                                                        	</c:if>
                                                        	<c:if test="${appointment.status.id == 4}">
                                                        		<span class="label label-warning"><i class="fa fa-cog p-r-5"></i> In-Process</span>
                                                        	</c:if>
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <ul class="pagination" id="pagination_list">
											</ul>
                                        </div>
                                   
                </div>
            </div>
            <!-- /.row -->
        </div>
    </div>

<!-- Modal -->
<div class="modal fade" id="cancel-popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form class="form-horizontal" method="post" action="<%=Constants.CANEL_APPOINTMENT_LAB_POST_URL %>">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Reason for Cancellation</h4>
      </div>
      <div class="modal-body">
            <fieldset>

            <!-- Form Name -->
            <!--<legend>Form Name</legend>-->

            <!-- Select Basic -->
            <div class="form-group">
              <label class="col-md-3 control-label" for="selectbasic">Reason</label>
              <div class="col-md-9">
                <select id="select_reason" name="status.cancelId" class="form-control" onchange="resetReason()">
                    <option id='reason_1' value="1">&nbsp;&nbsp;Customer was not available at residence</option>
                    <option id='reason_2' value="2">&nbsp;&nbsp;Customer changed his mind</option>
                    <option id='reason_3' value="3">&nbsp;&nbsp;Technician was not available</option>
                    <option id='reason_4' value="4">&nbsp;&nbsp;Other</option>                
                </select>
              </div>
            </div>

            <!-- Textarea -->
            <div class="form-group">
              <label class="col-md-3 control-label" for="cancel_reason">Description</label>
              <div class="col-md-9">                     
                <textarea class="form-control" id="cancel_reason" readonly placeholder="Please enter your cancellation reason" name="status.cancellationReason" style="height:200px"></textarea>
              </div>
            </div>
            <input type="hidden" id = "statusId" name="status.id" value="2"/>
			<input type="hidden" id = "appointmentId" name="id"/>
            </fieldset>
        
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-default js-cancelappointment" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
      </div>
  </div>
  </form>
</div> 
</div>
 <!-- Modal Strts-->
<div id="uploadFileModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Confirmation</h4>
            </div>
<!--                            <div class="modal-body" id="msg_area">
                <p>Do you want to upload report before changing status completed?</p>
                <p class="text-warning"><small>If you don't save, your changes will be lost.</small></p>
            </div>-->
            <div class="modal-body" id="file_upload_form">
                <div id="upload_error"></div>
                <form id="file_upload" enctype="multipart/form-data" action="<%=Constants.UPLOAD_REPORT_POST_URL%>" method="post">
                    <input type="hidden" name="id" id="report_appid">
                    <div class="form-group">
                        <label for="sel1">Select Test:</label>
                        <select class="form-control" id="appTests" name="tests[0].id">
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="sel1">Upload report for Test:</label>
                        <input id="file_to_upload" name="report" class="file" type="file" multiple data-min-file-count="1">
                    </div>
					<input type="hidden" id = "statusId" name="status.id" value="4"/>
                    <br>
                    <button type="submit" id="btn_file_upload" class="btn btn-primary">Upload</button>
                    <button type="reset" class="btn btn-default">Reset</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <div id="uploadedReports">
                                        	
                    </div>
                </form>

            </div>

<!--                            <div class="modal-footer">

                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>

                <button type="button" id="show_upload_form" class="btn btn-primary">Yes</button>

            </div>-->

            </div>
        </div>
    </div>


    
        <!-- /#page-wrapper -->

    <!-- /#wrapper -->
 <!-- Modal -->
<div class="modal fade" id="message-popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
        <h4 class="modal-title" id="myModalLabel">Confirm</h4>
      </div>
      <div class="modal-body" id="msg_body">
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default classControlWrapper"  id="clickYes">Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>
      
        
 <!-- Message Midal to diaplay -->       
<div class="modal fade" id="message-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                 <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
                <h4 class="modal-title" id="myModalLabel">Confirm</h4>
            </div>
            <div class="modal-body" id="msg_modal_body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default input-md classControlWrapper" data-dismiss="modal" id="checkMe">Check Appointment</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="clickMe">No</button>
            </div>
        </div>
    </div>
</div>
 
<!-- Modal -->
<div class="modal fade" id="message-slots" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
        <h4 class="modal-title" id="myModalLabel">Confirm</h4>
      </div>
      <div class="modal-body" id="msg_body_slots">
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default classControlWrapper"  id="clickYesSlots">Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div> 

<div id="model_for_prepare_Report" class="modal fade in" role="dialog" tabindex="-1" style="display: none; padding-right: 17px;">
	<div class="modal-dialog modal-lg">
	<div class="modal-content">
	<form method="post" action="<%=Constants.GENERATE_REPORT_POST_URL%>" id="report_form">
		<div class="modal-header">
			<button class="close" data-dismiss="modal" type="button">X</button>
			<h4 class="modal-title">Reports</h4>
		</div>
	<div class="modal-body">
		<div class="prepare_reports_model_body_head">
                    <div class="row">
                        <div class="col-md-4">
                            <label id ="name_lable"></label>
                            <br/>
                            <label id ="id_lable"></label>
                        </div>
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <label>Test Selected</label><br/>
                            <select id="tests_dropdown_list" onchange="onTestSelect()">
                            
                            </select>
                        </div>
                    </div>
                    <div class="prepare_reports_model_table">
                    <div id = "formData"></div>
                    <table class="table table-bordered">
                        <thead>
                            <th>Tests</th>
                            <th>Test Values</th>
                            <th>Units</th>
                            <th>Normal Values</th>
                        </thead>
                        <tbody id = "reports_table_body">
                            <!-- <tr>
                                <td>Glycosylated Haemoglobin HbA1c</td>
                                <td><input type="text" name="" required/></td>
                                <td>mm</td>
                                <td>10-30</td>
                            </tr>
                            <tr>
                                <td>XYZ test</td>
                                <td><input type="text" name="" required/></td>
                                <td>mm</td>
                                <td>0.5-2.2</td>
                            </tr>
                            <tr>
                                <td>ABC test</td>
                                <td><input type="text" name="" required/></td>
                                <td>mm</td>
                                <td>20-40</td>
                            </tr>
                            <tr>
                                <td>PQR test</td>
                                <td><input type="text" name="" required/></td>
                                <td>mm</td>
                                <td>10-30</td>
                            </tr>
                            <tr>
                                <td>ASD test</td>
                                <td><input type="text" name="" required/></td>
                                <td>mm</td>
                                <td>15-30</td>
                            </tr> -->
            
                        </tbody>
                    </table>
                </div>
               </div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" onclick="sendReport()">Send</button>
        <button type="submit" class="btn btn-sm btn-default">Export</button>
	</div>
</form>
</div>
</div>

</div>
<%@include file="lab_footer.jsp" %>

<script type="text/javascript">


</script>

</body>
