<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | HealthPlease.in</title>
</head>
<body>

<%@include file="user_header.jsp" %>
<link href="<c:url value="/resources/css/external/file_input/fileinput.css"/>" rel="stylesheet" type="text/css">

<div id="main-div">
        <div id="reports_summary" class="classTopHeading" style="background-color: #29BAE9;">
            <div class="classFullContainer">
                <div class="row" style="margin-top:10px">
                 <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <h1 class="page-header">Welcome <span class="nameHolder"> ${user.firstName}  </span></h1>
                    </div>
                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-xs-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-thumbs-up fa-2x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="today">${fn:length(user.todaysAppointments)}</div>
                                    <div>Today's Appointments</div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=Constants.ADMIN_HOME_GET_URL%>">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-pending">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-thumbs-o-down fa-2x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="pending">${fn:length(user.pendingAppointments)}</div>
                                    <div>Pending Appointments</div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=Constants.ADMIN_HOME_PENDING_APPS_URL_GET%>" id="pending_app">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-today">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-2x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                     <div class="huge" id="total">${fn:length(user.appointments)}</div>
                                    <div>Total Appointments</div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=Constants.ADMIN_HOME_TOTAL_URL_GET %>" id="total_app" >
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-cancel">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-thumbs-o-down fa-2x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="cancel">${fn:length(user.cancelledAppointments)}</div>
                                    <div style="font-size: 13px;">Cancelled Appointments</div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=Constants.ADMIN_HOME_CANCELLED_URL_GET%>" id="cancel_app" >
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            	</div>
            	</div>
                </div>

                </div>
                <!-- /.col-lg-12 -->
            </div>
    </div>

    <!--Add user start from here-->
    <div class="classFullContainer" id="addUser" name="addUser">
       <div class="row">
       		<%@include file="admin_header.jsp" %>
            <div class="col-lg-10 col-md-10">
               <div class="page-header">
                    <h2 id="tables">Appointment Summary</h2>
                    <div id="download_excel" class="pull-right" style="margin-top: -30px; margin-right: 80px;">
                        <a id="back" href="#" class="btn btn-info btn-xs">
                            Back
                        </a>
                        <a id="get_excel" href="<%=Constants.ADMIN_DOWNLOAD_EXCEL_GET_URL%>?header=${appointmentsTitle}"  class="btn btn-info btn-xs">
                            <span class="glyphicon glyphicon-download-alt"></span> 
                            Download Excel
                        </a>
                        <input type="hidden" value="" id="report_for" name="report_for">
                        
                    </div>
                </div>
                <div class="bs-component">
                <form action="<%=Constants.ADMIN_GET_APPOINTMENTS_FOR_DATES_POST_URL%>" method="post">
                <table class='table table-bordered table-responsive' id="reports_header">
                <div id="msg" class="container"></div>
                      <tr>
                          <td colspan="2">Reports</td>
                                                       <td colspan="3">
                              <!--<a id="get_pdf" value="0" href="javascript:void(0)" class="btn btn-info btn-xs js-gen_report"><span class="glyphicon glyphicon-download-alt"></span> Download PDF</a>-->
                              <a id="get_excel" href="<%=Constants.ADMIN_DOWNLOAD_EXCEL_GET_URL%>?header=${appointmentsTitle}" class="btn btn-info btn-xs js-gen_report"><span class="glyphicon glyphicon-download-alt"></span> Download Excel</a>
                           <td>
                                                  </tr>
                      <tr>
                          <td>
                              <div class='input-group date'>
                                  <input type='text' id='fromdate' name="date1" class="classDates form-control" placeholder="From" />
                                  <span class="input-group-addon">
                                      <span class="glyphicon glyphicon-calendar"></span>
                                  </span>
                              </div>
                          </td>
                          <td>
                              <div class='input-group date'>
                              <input type='text' id='todate' name="date2"  class="classDates form-control"  placeholder="To" />
                              <span class="input-group-addon">
                                  <span class="glyphicon glyphicon-calendar"></span>
                              </span>
                              </div>
                          </td>
                          <td>
                              <button type="submit" class="btn btn-primary js-gen_report" name="btn-save">
                                 <span class="glyphicon glyphicon-plus"></span> Generate Report
                              </button>

                              <button type="button" class="btn btn-primary js-gen_report" name="btn-save">
                                 <span class="glyphicon glyphicon-plus"></span> Today Listing
                              </button>
                          </td>

                      </tr>

        			</table>
        			</form>    
                        <form class="form-inline">
                            <div class="form-group">
                                <label>Search</label>
                                    <input type="text" id="search" class="form-control" placeholder="Search">
                                    <label >Record per page </label>
                                    <select id="limit" id="limit" class="form-control"  onchange="resetTable()">
                                        <option>5</option>
                                        <option>10</option>
                                        <option>20</option>
                                        <option>50</option>
                                        <option>100</option>
                                    </select>
                            </div>
                        </form>
                        <table id="appointments_table" class="table table-striped table-hover paginate">
                                <thead>
                                         <tr class="page_header">
                                                <th>Appointment<br/> ID
                                                </th>
                                                <th>Appointment<br/> Date
                                                </th>
                                                <th>Appointment<br/> Time
                                                </th>
                                                <th>Test Name
                                                </th>
                                                <th>Test Charge
                                                </th>
                                                <th>Lab Name
                                                </th>
                                                <th>Name
                                                </th>
                                                <th>Contact No
                                                </th>
                                                <th>Address
                                                </th>
                                                <th>Email
                                                </th>
                                                <th>Gender
                                                </th>
                                                <th>Doctor's Name
                                                </th>
                                                <th>Payment Mode
                                                </th>
                                                <th>Print <br/> Required
                                                </th>
<!--                                                <th ng-click="sort('lab_name')">Lab Name
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='lab_name'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>-->
                                                <th>Status
                                                </th>
                                               	<th align="center" colspan="2">Action</th>
                                               	</tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${appointments}" var="appointment">
                                        <tr>
                                                <td width="50px">${appointment.id}</td>
                                                <td width="50px">${appointment.date}</td>
                                                <td width="50px">${appointment.slot.startTime} - ${appointment.slot.endTime}</td>
                                                <td width="0px">
                                                <c:forEach items="${appointment.tests}" var="test">
                                                	${test.name} ,
                                                </c:forEach>
                                                </td>
                                                <td width="0px">${appointment.lab.price}</td>
                                                <td width="0px">${appointment.lab.name}</td>
                                                <td width="50px">${appointment.user.firstName}</td>
                                                <td width="0px">${appointment.user.phone}</td>
                                                <td>
                                                <c:if test="${appointment.address == null }">
                                                	NA
                                                </c:if> 
                                                <c:if test="${appointment.address != null }">
                                                	${appointment.address}
                                                </c:if>
                                                </td>
                                                <td width="0px">${appointment.user.email}</td>
                                                <td width="0px">${appointment.user.gender}</td>
                                                <td width="0px">${appointment.doctorName}</td>
                                                <td width="0px">${appointment.payment.type}</td>
                                                <td width="0px">${appointment.printRequired}</td>
                                               
                                                <!--<td width="0px">{{user.lab_name}}</td>-->
                                                <td width="0px">${appointment.status.name}</td>
                                                 <td colspan="2">
                                                    <c:if test="${appointment.status.id == 1 || appointment.status.id == 4 }">
                                                    <a id="process_app" class="btn btn-success btn-mini" onclick="onUpload(${appointment.id})">
														<i class="glyphicon glyphicon-ok"></i>
													</a>
													<a class="btn btn-danger btn-mini" onclick="onCancel('${appointment.id}','${appointment.lab.id}')">
														<i class="glyphicon glyphicon-remove"></i>
													</a>
													</c:if>
                                                </td>
                                      </tr>
                                     </c:forEach>
                                </tbody>
                        </table> 
                        <ul class="pagination" id="pagination_list">
						</ul>
                    <!-- Modal Strts-->
                    <div id="myModal" class="modal fade" data-backdrop="static">

                        <div class="modal-dialog">

                            <div class="modal-content">

                                <div class="modal-header">

                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                                    <h4 class="modal-title">Confirmation</h4>

                                </div>
                                <div class="modal-body" id="file_upload_form">
                                    <div id="upload_error"></div>
                                    <form id="file_upload" enctype="multipart/form-data" action="<%=Constants.ADMIN_UPLOAD_REPORT_POST_URL %>" method="post">
                                        <input type="hidden" value="" name="id" id="report_appid">
                                        <div class="form-group">
                                            <label for="sel1">Select Test:</label>
                                            <select class="form-control" id="appTests" name="testId">
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
                                </div>
                            </div>
                        </div>
                        <!--Modal ends here-->
                    </div>
                </div>
        </div>
        </div>

<!-- Modal -->
<div class="modal fade" id="cancel-popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form class="form-horizontal" method="post" action="<%=Constants.ADMIN_CANCEL_APPOINTMENT_POST_URL %>">
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
			<input type="hidden" id = "labId" name="lab.id"/>
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


<!-- Working scripts -->


<%@include file="user_footer.jsp" %>
<script src="<c:url value="/resources/js/paging.js"/>"></script> 
<script src="<c:url value="/resources/js/myPagination.js"/>"></script> 
<script src="<c:url value="/resources/js/external/file_input/fileinput.min.js"/>"></script>
<script type="text/javascript">

function getAppointment(id) {
	 $.ajax({
	       	type : "POST",
	           url : 'getAppointment',
	           dataType: 'json',
	           data: "appointmentId="+ id,
	           success : function(app) {
	        	   var appendString = "";
	        	   var completedReports = "Uploaded Reports :";
	        	   var i = 0;
	        	   for(i = 0; i  < app.tests.length; i++) {
	        		   if(app.tests[i].reportSent != 'Y' && app.tests[i].fileLocation == null) {
	        			   appendString = appendString + "<option value='" + app.tests[i].id + "' >" + app.tests[i].name + "</option>";
	        		   } else {
	        			   completedReports = completedReports + "<a href='getTestReport?appointmentId=" + app.id  +"&testId=" + app.tests[i].id + "'>" + app.tests[i].name + "</a> , ";
	        		   }
	        		   
	        	   }
	        	   $("#appTests").html(appendString);
	        	   $("#uploadedReports").html(completedReports);
	           }
	        	   
	           });
}

$(document).ready(function () {
	
	$(document).ready(function(){
		paginateTable($("#limit").val(), 0);
	}); 

	
    $('.classDates').datepicker({
    	dateFormat: "yy-mm-dd",
        changeMonth : true
    });  

});

function onCancel(appointmentId,labId) {
	$("#appointmentId").val(appointmentId);
	$("#labId").val(labId)
	$("#cancel-popup").modal('show');
}

function onUpload(appointmentId) {
	
	$("#report_appid").val(appointmentId);
	getAppointment(appointmentId);
	$("#myModal").modal('show');
}

function resetTable() {
	 //$("#appointments_table").paging({limit:$("#limit").val()});
	 paginateTable($("#limit").val(), 0);
	 //location.reload(); 
}

$('#search').keyup(function()
	    {
	    	searchTable($(this).val());
	    });
	    
	    function searchTable(inputVal)
	    {
	    	var table = $('#appointments_table');
	    	table.find('tr').each(function(index, row)
	    	{
	    		var allCells = $(row).find('td');
	    		if(allCells.length > 0)
	    		{
	    			var found = false;
	    			allCells.each(function(index, td)
	    			{
	    				var regExp = new RegExp(inputVal, 'i');
	    				if(regExp.test($(td).text()))
	    				{
	    					found = true;
	    					return false;
	    				}
	    			});
	    			if(found == true)$(row).show();else $(row).hide();
	    		}
	    	});
	    }

</script>

</body>
</html>