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
<title>Admin</title>
</head>
<body>

<%@include file="user_header.jsp" %>

<div id="main-div">
    <div>
        <div id="reports_summary" class="classTopHeading" style="background-color: #29BAE9;">
            <div class="classFullContainer">
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
                <!-- /.col-lg-12 -->
            </div>
        </div>

    <!--Add user start from here-->
    <div class="classFullContainer" id="addUser" name="addUser">
       <div class="row">
       		<%-- <%@include file="admin_header.jsp" %> --%>
            <div class="col-lg-10 col-md-10">
               <div class="page-header">
                    <h2 id="tables">Appointment Summary</h2>
                    <div id="download_excel" class="pull-right" style="margin-top: -30px; margin-right: 80px;">
                        <a id="back" name="back" value="" href="javascript:void(0)" class="btn btn-info btn-xs">
                            Back
                        </a>
                        <a id="get_excel" href="javascript:void(0)"  class="btn btn-info btn-xs">
                            <span class="glyphicon glyphicon-download-alt"></span> 
                            Download Excel
                        </a>
                        <input type="hidden" value="" id="report_for" name="report_for">
                        
                    </div>
                </div>
                <div class="bs-component">
                <table class='table table-bordered table-responsive' id="reports_header">
                <div id="msg" class="container"></div>
                      <tr>
                          <td colspan="2">Reports</td>
                                                       <td colspan="3">
                              <!--<a id="get_pdf" value="0" href="javascript:void(0)" class="btn btn-info btn-xs js-gen_report"><span class="glyphicon glyphicon-download-alt"></span> Download PDF</a>-->
                              <a id="get_excel" value="1" href="javascript:void(0)" class="btn btn-info btn-xs js-gen_report"><span class="glyphicon glyphicon-download-alt"></span> Download Excel</a>
                           <td>
                                                  </tr>
                      <tr>
                          <td>
                              <div class='input-group date'>
                                  <input type='text' id='fromdate' class="classDates form-control" placeholder="From" />
                                  <span class="input-group-addon">
                                      <span class="glyphicon glyphicon-calendar"></span>
                                  </span>
                              </div>
                          </td>
                          <td>
                              <div class='input-group date'>
                              <input type='text' id='todate' class="classDates form-control"  placeholder="To" />
                              <span class="input-group-addon">
                                  <span class="glyphicon glyphicon-calendar"></span>
                              </span>
                              </div>
                          </td>
                          <td>
                              <button type="button" class="btn btn-primary js-gen_report" ng-click="getRecord( $event )" name="btn-save" data-value="1">
                                 <span class="glyphicon glyphicon-plus"></span> Generate Report
                              </button>

                              <button type="button" class="btn btn-primary js-gen_report" name="btn-save" data-value="2">
                                 <span class="glyphicon glyphicon-plus"></span> Today Listing
                              </button>
                          </td>

                      </tr>

        </table>    
                        <form class="form-inline">
                            <div class="form-group">
                                <label>Search</label>m 
                                    <input type="text" id="search" class="form-control" placeholder="Search">
                                    <label >Record per page </label>
                                    <select id="limit" id="limit" class="form-control">
                                        <option>5</option>
                                        <option>10</option>
                                        <option>20</option>
                                        <option>50</option>
                                        <option>100</option>
                                    </select>
                            </div>
                        </form>
                        <table class="table table-striped table-hover">
                                <thead>
                                        <tr>    
                                                <th>Appointment<br/> ID
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='id'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Appointment<br/> Date
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='date'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Appointment<br/> Time
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='slot_time'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Test Name
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='test_name'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Test Charge
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='test_charge'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Lab Name
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='test_name'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Name
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='name'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Contact No
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='contact'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Address
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='address'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Email
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='username'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Gender
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='gender'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Doctor's Name
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='doctor'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Payment Mode
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='pay_mode'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Print <br/> Required
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='hardcopy'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
<!--                                                <th ng-click="sort('lab_name')">Lab Name
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='lab_name'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                </th>-->
                                                <th>Status
                                                        <span class="glyphicon sort-icon" ng-show="sortKey=='status'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
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
                                                <td width="0px">${appointment.user.contact}</td>
                                                <td>${appointment.user.address.street}</td>
                                                <td width="0px">${appointment.user.email}</td>
                                                <td width="0px">${appointment.user.gender}</td>
                                                <td width="0px">${appointment.doctorName}</td>
                                                <td width="0px">${appointment.payment.paymentType}</td>
                                                <td width="0px">${appointment.printRequired}</td>
                                               
                                                <!--<td width="0px">{{user.lab_name}}</td>-->
                                                <td width="0px">${appointment.status.name}</td>
                                                    <td colspan="2">
                                                    <a href="javascript:void(0)" id="process_app">
                                                        <i class="glyphicon glyphicon-ok"></i>
                                                    </a>
                                                    <a href="javascript:void(0)" class="btn btn-danger btn-mini" data-value="1" data-status="2">
                                                        <i class="glyphicon glyphicon-remove"></i>
                                                    </a>
                                                </td>
                                      </tr>
                                     </c:forEach>
                                </tbody>
                        </table> 
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
                                    <form id="file_upload" enctype="multipart/form-data" action="adminController.php">
                                        <input type="hidden" value="" name="report_appid" id="report_appid">
                                        <div class="form-group">
                                            <label for="sel1">Select Test:</label>
                                            <select class="form-control" id="test" name="test">
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="sel1">Upload report for Test:</label>
                                            <input id="file_to_upload" name="file_to_upload" class="file" type="file" multiple data-min-file-count="1">
                                        </div>

                                        <br>
                                        <button type="submit" id="btn_file_upload" class="btn btn-primary">Upload</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
    </div>  
</div>
<!-- <script src="js/external/angular/angular.js"></script>
<script src="js/external/angular/pagination/dirPagination.js"></script>
<script src="js/internal/angular/admin-dashboard.js?ver=3"></script>

<script src="js/external/file_input/fileinput.min.js"></script>  
<script src="js/external/file_input/fileinput_locale_es.js"></script>  
<script src="js/external/file_input/fileinput_locale_fr.js"></script>   -->
<script type="text/javascript">
		$(function(){
                        /*
                         * hide excel download initally
                         */
                        $("#download_excel").hide();
                        
                        $("#back").on( "click", function(){
                            $("#download_excel").hide();
                            $("#reports_header").show();
                        });
			/**
                        * Load Summary for admin
                        */
                        var d = new Date();
                        var month = d.getMonth() + 1;
                        var day = d.getDate();

                        var output = d.getFullYear() + '-' +
                            ((''+month).length<2 ? '0' : '') + month + '-' +
                            ((''+day).length<2 ? '0' : '') + day;
                        $.ajax({
                            type:"POST",
                            url:'adminController.php',
                            data: {
                                action:'load_summary',
                                date : output
                            },
                            success: function(response){
                                 var json = $.parseJSON( response );
                                 $('#total').html( json[0].total );
                                 $('#pending').html( json[0].pen );
                                 $('#cancel').html( json[0].can );
                                 $('#today').html( json[0].today );
                            }
                        });
                        
                   /**
                    * Added by vikas on 24-may-2015
                    * to generate reports
                    */

                  $( ".js-gen_report" ).on( "click", function() {
                        var type_of_report;
                        var $this = $( this );
                        var sdate = $('#fromdate').datepicker("getDate");
                        var edate = $('#todate').datepicker("getDate");

                        if (sdate > edate) {
                           $('#msg').html('<div class="alert alert-danger" style="width:600px">! Problem with date range</div>'); 
                           exit;
                        }

                        var $this = $( this );
                        var fromdate = generateDate( $( '#fromdate' ).val() );
                        var todate = generateDate( $( '#todate' ).val() );
                        var type = 0;

                        if( 2 === $this.data( "value" ) ) {
                            type = 1;
                            fromdate = 'n/a';
                            var fullDate = new Date()
                            //convert month to 2 digits
                            var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
                            todate = fullDate.getFullYear() + "-" + twoDigitMonth + "-" + fullDate.getDate() ;
                        }

                  if( 0 == $this.attr( 'value' ) ) {  type_of_report = 'get_pdf'; }
                  if( 1 == $this.attr( 'value' ) ) {  type_of_report = 'get_excel'; }

                $.ajax({
                        type: "POST",
                        url : "adminController.php",
                        data: { 
                              fromdate : fromdate,
                              todate : todate,
                              type :type,
                              action: 'generate_report',
                              type_of_report:type_of_report
                              },//only input
                        success: function(response){
                            if( 'get_excel' == type_of_report ) {
                                window.location.href = 'downloads/HealthPlease_2016-06-04.xls';
                            }
                        }
                    });
                  }); 
            
                    function generateDate( date ) {
                      var tempDate = date.split( '/' );
                      return tempDate[2] + '-' + tempDate[0] + '-' + tempDate[1];
                    }
        
          
        
        $("#file-0a").fileinput({
            'allowedFileExtensions' : ['jpg', 'png','gif','pdf'],
        });
        
        $( "#file_upload" ).on( "submit", function (e) {
            var formData = new FormData($(this)[0]);
            e.preventDefault();
            $("#btn_file_upload").html("<img src='images/loader.gif' width='25px'/>&nbsp;&nbsp;Uploading and Sending email...");
            $.ajax({
                url:'adminController.php?action=upload_report&testid='+  $('#test').find(":selected").attr('id'),
                data:formData,//only input
                type: 'POST',
                async: false,
                success: function ( data ) {
                    var obj = $.parseJSON( data );
                    $('#upload_error').show();
                    if ( 1 == obj.status ){
                        $("#btn_file_upload").html("Upload");
                        $('#upload_error').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                    } else {
                        $("#btn_file_upload").html("Upload");
                        $('#upload_error').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                    }
                },
                cache: false,
                contentType: false,
                processData: false
            });

            return false;
        });
        
        $( document ).on( "click", ".js-processapp",   function() {

              var $this = $( this );
//              $(this).html('<img src="images/loader.gif" id="idLoaderGif" class="classLoaderImg">..');
               $.ajax({
                      type: "POST",
                      url : "adminController.php",
                      data: { 
                            action : 'processapp',
                            id : $this.data( 'value' ),
                            status : $this.data( 'status' )

                            },//only input
                      success: function(response){
                          //alert(response);
                            if( response ) {

                                  var fromdate = generateDate( $( '#fromdate' ).val() );
                                  var todate = generateDate( $( '#todate' ).val() );

                                  $.ajax({      
                                      type: "POST",
                                      url : "adminController.php",
                                      data: { 
                                          fromdate : fromdate,
                                          todate : todate,
                                          action: 'gen_report'

                                      },//only input
                                      success: function(response){

                                                  $( '#showReportData' ).html( response );
                                      }
                                   });
                          }
                      }
              });
        }); 

            
   
		});        <!-- /#page-wrapper -->
        $(document).ready(function () {
          
          $('.classDates').datepicker({
              format: "dd-mm-yyyy"
          });  
      
      });
</script>


<%@include file="user_footer.jsp" %>

</body>
</html>