<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
<head>
	

    <title>Book Diagnostic & Pathology Test like Thyroid, Sugar, Urine, Cholesterol, ECG and X-Ray. Pay for them Online. Sample Collected at home or in lab. EMR Storage Available.</title>

	
	<!-- Latest compiled and minified CSS -->
<body>

<%@include file="user_header.jsp" %>
	
	<br/>
	<br/>
	<div class="classTopHeading" style="background:#29BAE9;height: 110px;">
      <div class="container">
        <div class="row">
          <!--<div class="col-xl-3 col-lg-3 col-md-3  hidden-sm hidden-xs">
              <div class="text-center classUImgHolder">
                <img src="images/default-user.png" class="classAvatar avatar img-circle img-thumbnail" alt="avatar">
                <div class="classIContolHolder">
                  <h3 class="nameHolder"></h3>
                  <h6>Upload photo...</h6>
                  <input type="file" class="text-center center-block well well-sm" style="width: 225px;">
                </div>     
              </div>
           </div>-->
          <div class="col-xl-10 col-lg-10 col-md-10 col-sm-12 col-xs-12">
              <h1 class="page-header">Welcome &nbsp;<span class="nameHolder">${user.firstName}</span></h1>
            <ul id="tabs" class="nav nav-tabs" data-tabs="tabs" style="background:#29BAE9;border-radius: 5px 5px 0 0;">
              <li class="classTabColor active" id="idProfileTab"><a href="#profile" data-toggle="tab">Profile</a></li>
              <!--<li class="classTabColor" id="idBookTab"><a href="#book" data-toggle="tab">Book</a></li>-->
              <li class="classTabColor" id="idHistoryTab"><a href="#history" data-toggle="tab">History</a></li>
              <li class="classTabColor" id="idSettingTab"><a href="#settings" data-toggle="tab">Settings</a></li>
<li class="classTabColor" id="idRecentCheckupsTab"><a href="#id_recent_checkups" data-toggle="tab">Recent Checkups</a></li>
            </ul>          
          </div>
<div class="col-xl-2 col-lg-2 col-md-2  hidden-sm hidden-xs" style="margin-top: 2px;">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        
                        <div class="col-xs-12 text-right">
                          <div class="huge  pull-left  fa-2x" id="idTestCount"><!-- <i class="fa fa-info"> -->${fn:length(user.pendingAppointments)}<!-- </i> --></div>
                            
                            <div>Pending Appointments!</div>
                        </div>
                    </div>
                </div>

                <a href="#history" id="idGoToHistory" data-toggle="tab">
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
    <div id="msg" class="container">
    	<c:if test="${result != null && result != 'OK' }">
			<div class="alert alert-danger">${result}</div>
		</c:if>
		<c:if test="${result != null && result == 'OK' }">
			<div class="alert alert-success">Profile details updated successfully!</div>
		</c:if>
    </div>


<!--Add user start from here-->
<div class="classFullContainer classMinHeight" id="addUser" name="addUser"> 
  <div class="row">
     
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <!-- <input type="text" id="tabType">  -->
      <div id="content">
          <div id="my-tab-content" class="tab-content">
              <div class="tab-pane active" id="profile" onclick="onTabChange()">
				<%@include file="forms/edit_user_form.jsp" %>
              </div>
              <div class="tab-pane" id="history" onclick="onTabChange()">
                  <%@include file = "forms/user_history_form.jsp" %>
              </div>
              <div class="tab-pane" id="settings" onclick="onTabChange()">
      				<%@include file="forms/change_password_form.jsp" %>
              </div>
	      <div class="tab-pane" id="id_recent_checkups">
                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 col-xs-12">
                  <h3>Recent CheckUps</h3>
                  <span id="recent_check_up"></span>
                  	<c:forEach items="${user.appointments}" var="appointment">
                  		<c:if test="${appointment.status.id == 3 }">
                  		<div class="classROItem">
						<c:forEach items="${appointment.tests}" var="test" varStatus="i">
							${test.name}
							<c:if test="${i.index < (fn:length(appointment.tests) -1) }">
                            	,
                            </c:if>
						</c:forEach>
						<!-- <div class="pull-right">20</div>-->
						</div> 
						</c:if>
                  	</c:forEach>
                  <hr/>
                </div> 
              </div>
        </div>
     </div>
     </div> 
 
  </div>      
</div>
        <!-- /#page-wrapper -->
<script>
    $(document).ready(function(){
       $("#editAppointment").hide();
       $.ajax({
                type:"POST",
                url:'userController.html',
                data:{ action:'viewprofile',
                       id:
                    
                     },//only input
                success: function(response){
                    var obj = $.parseJSON( response );
                    $("#id").val(obj.id);
                    $("#username").val(obj.username);
//                    $("#password").val(obj.password);
//                    $("#password_again").val(obj.password);
                    $("#fname").val(obj.fname);
                    $("#mname").val(obj.mname);
                    $("#lname").val(obj.lname);
                    $("#add_street").val(obj.add_street);
                    $("#add_area").val(obj.add_area);
                    $("#add_landmark").val(obj.add_landmark);
                    $("#add_city").val(obj.add_city);
                    $("#add_zipcode").val(obj.add_zipcode);
                    $(".nameHolder").html(obj.name);
                    $("#contact").val(obj.contact);
                    $("#age").val(obj.age);
                    $("#dob").val(obj.dob);
                    if(obj.gender == "M"){ $('input:radio[name=gender]')[0].checked = true; } else { $('input:radio[name=gender]')[1].checked = true;  }
                   
                }
            });
        /**
        * get user History apoointments
         */    
            
        $.ajax({
                type:"POST",
                url:'userController.html',
                data:{ action:'appointHistory',
                       user_id:
                     },//only input
                success: function( response ){
                    $('#user_history').html( response );                    
                }
            });    
        
     /**
     * Get Recent check up information of user
     * added by vikas 03-jul-2015 
     */
     
     $.ajax({
                type:"POST",
                url:'userController.html',
                data:{ action:'getRecentCheckup',
                       user_id:
                     },//only input
                success: function( response ){
                    $('#recent_check_up').html( response );                    
                }
            });
            
       $.ajax({
                type:"POST",
                url:'userController.html',
                data:{ action:'getPendingTestCount',
                       user_id:
                     },//only input
                success: function( response ){
                    var obj = $.parseJSON( response );
                    $("#idTestCount").html(obj[0].cnt);                    
                }
            });      
     

      /**
       * Edit Appointment from user history
       */
            $(document).on("click", ".js-editappointment", function(){
                var $this = $(this);
                window.location.href = 'editAppointment.html?'+$this.data('value');
             });
        
	   /**
        * Delete appointment from user side
        */   
        $(document).on("click", ".js-cancelappointment", function(){
           var deleteUser = window.confirm('Are you sure, you want to cancel appointment?');

                if ( deleteUser ) {
                  var $this = $(this);
                    $.ajax({
                             type:"POST",
                             url:'appoinController.html',//?action=cancelapp&id='+ $( "#app_id" ).val() +'&status=2',//+$( "#status" ).val(),
                             data:$this.data('value')+'&status=2',
                             success: function(response){
                                 if( 1 == response ){ 
                                     alert( 'Your appointment is Cancelled successfully !' );
                                    // $('#info').html('<div class="alert alert-info"><strong>! Your appointment is Cancelled successfully !</div>');
                                     window.location.href = window.location.href;
                                 } else {
                                     $('#info').html('<div class="alert alert-danger"><strong>Sorry!</strong> Can\'t cancel your appointment right now. /div>');
                                 }
                             }
                         });
                }
           }); 	

	 /**
        * Update Appointment from user
        */    
       
            $(document).on("click", ".js-editappointment", function(){
                var $this = $(this);
               
               //alert("hii");return;
              $.ajax({
                       type:"POST",
                       url:'appoinController.html',
                       data:$this.data('value'),//only input
                       success: function(response){
                        
                           var obj = $.parseJSON( response );
                           $( "#location" ).val( obj[0][0].loc_id );
                           $( "#idApp" ).val( obj[0][0].date );
                           $( "#app_id" ).val( obj[0][0].id );
                           $( "#status" ).val( obj[0][0].status_id );
                           $('#test option[value="' + obj[1][0].test_id + '"]').prop('selected', true);
                           if ( 3 == obj[0][0].status_id ) {
                               $("#cancelAppoin").attr("disabled","disabled");
                               $("#status").attr("disabled","disabled");
                           }    
                           
                           $("#editAppointment").show();
                           $("#user_history").show();
                           
                           
                       }
                   });

           });
           
        /**
        * Delete appointment from user side
         */   
        $(document).on("click", "#cancelAppoin", function(){
                if ( 1 == $( "#status" ).val() ) { alert( "You are not authorised to set this setting" ); return; }

              $.ajax({
                       type:"POST",
                       url:'appoinController.html?action=cancelapp&id='+ $( "#app_id" ).val() +'&status='+$( "#status" ).val(),
                       success: function(response){
                           if( 1 == response ){ 
                               $('#info').html('<div class="alert alert-info"><strong>! Your appointment is Cancelled successfully !</div>');
                               window.location.href = window.location.href;
                           } else $('#info').html('<div class="alert alert-danger"><strong>Sorry!</strong> Can\'t cancel your appointment right now. /div>');
                       }
                   });

           });   

    /******
    * Actual updation of content starts here
     */
    $("#btn-upd").on("click", function(){
            var form=$("#form_upd_user");

            if ( false == form.valid() ) return;
            $("#btn-upd").html('<img src="images/loader.gif" id="idLoaderGif" class="classLoaderImg"> updating..');

            $.ajax({
                    type:"POST",
                    url:form.attr("action"),
                    data:form.serialize()+"&action=updprofile",//only input
                    success: function(response){
                        if( response == 1 ){
                            $('#msg').html('<div class="alert alert-info"><strong>WOW!</strong> Record was updated successfully <a href="login.html">HOME</a>!</div>');
                            $('#msg').show();
                            window.location.href = window.location.href;
                        } else {
                            $('#msg').html("<div class='alert alert-danger'><strong>SORRY!</strong> ERROR while updating record !<br>"+ response  +"</div>");
                            $('#msg').show();
                            $('#btn-upd').html('<span class="glyphicon glyphicon-edit"></span> Update');
                        }
                    }
            });
        });
        
       
/**
* to set appointment from user scrren
 */        
        $('#idAppointmentDate').change(function(){
                   $( "#idAppointmentDate" ).datepicker( "option", "dateFormat", "mm/dd/yy" );
                   var tempval = generateDate( $("#idAppointmentDate").val() );
                   $('#dbdate').val( tempval );
                   $( "#idAppointmentDate" ).datepicker( "option", "dateFormat", "dd/mm/yy" );

        }); 
        function generateDate( date ) {
            var tempDate = date.split( '/' );
            return tempDate[2] + '-' + tempDate[0] + '-' + tempDate[1];
        }
            $("#bookFromUserProfile").on( "click", function(){

          var sTestName = $("#idTest").val();
          var sLocationName = $("#idLocation").val();
          if(sTestName == "select"){
              $("#idTestErr").fadeIn(1500);
              $("#idTestErr").html("<label style='color:red;'>Please select your test</label>")
              $("#idTestErr").fadeOut(1500);
              return false;
          }
           if(sLocationName == "select"){
              $("#idLocationErr").fadeIn(1500);
              $("#idLocationErr").html("<label style='color:red;'>Please select location of test</label>")
              $("#idLocationErr").fadeOut(1500);
              return false;
          }

          var appointmentDate = $("#idAppointmentDate").val();
          if(appointmentDate == ""){
            $("#idAppDateErr").fadeIn(1500);
              $("#idAppDateErr").html("<label style='color:red;'>Please select date</label>")
              $("#idAppDateErr").fadeOut(1500);
             return false; 
          }

          var appTime  = $("#idAppTime").val();
          var appDetails = "";
          window.location.href="confirmAppointment.html?testName="+sTestName+"&locName="+sLocationName+"&appDate="+appointmentDate+"&appTime="+appTime+"&dbdate="+$('#dbdate').val();

    
    });

        
        
        
    });
    
    
   
</script>

<!--TAB Script For History code start-->
<script type="text/javascript">
  $(document).ready(function(){
    $("#idGoToHistory").click(function(){
      $("#idProfileTab").removeClass('active');
      $("#idBookTab").removeClass('active');
      $("#idHistoryTab").addClass('active');
      $("#idSettingTab").removeClass('active');
      
    });
  });

</script>
<!--TAB Script For History code end-->
<div class="classFooterWrapper">
<div class="container">
 <footer>
	<div id="idWelcomeMsg" class="modal fade" data-backdrop="static" style="width:60%;margin:auto;">
		<div class="modal-dialog" style="width:100%;">
			<div class="modal-content">
					<button type="button" class=" classWelcomeCloseButton close" data-dismiss="modal" aria-hidden="true">&times;</button>
				
	          <div class="modal-body" id="welcomeMessage">
	            <a href="http://www.healthplease.in"><img src="images/healthplease-welcome.jpg" width="100%" /></a>
	            </div>
	        </div>
	    </div>
	</div>
<div class="row">
    	<div class="col-sm-12 col-lg-5 col-md-5">
			<div class="fb-page" data-href="https://www.facebook.com/pages/Health-Please/1614865218755696" data-width="400" data-height="100" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" data-show-posts="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/pages/Health-Please/1614865218755696"><a href="https://www.facebook.com/pages/Health-Please/1614865218755696">Health Please</a></blockquote></div></div>	
	    </div>
		
        <div class="col-sm-12 col-lg-7 col-md-7 classFooterContactWrapper">
            <h3>Contact:</h3>
                  <p>
            	We wish you a happy time here at Health Please! <br/>
				You can <a id="callback" name="callback" href="javascript:void(0);" style="color:#46b8da;"><strong>Request a call back</strong></a> or call us on <a href="tel:7620012092" style="color:#46b8da;">+91 7620012092</a> if you wish to talk to us.<br/>
				You can also write to us at <a style="color:#46b8da;" href="Mailto:help@healthplease.in">help@healthplease.in</a> <br/>
				We will be glad to help you.<br/>
<!-- We wish you a happy time here at Health Please! <br/>In case you need help feel free to write to us at <a href="mailto:help@healthplease.in" target="_blank" style="color:#46b8da;text-decoration:none;"><strong>help@healthplease.in</strong></a> or
<a id="callback" name="callback" href="javascript:void(0);" style="color:#46b8da;"><strong>Request a call back.</strong></a> <br/>We will be glad to help you. -->
</p>
		</div>
		<div class="col-sm-12 col-lg-12 col-md-12 text-right classFooterSMIcon" style="margin-top: -35px;">
        	<span>Follow Us</span>&nbsp;:&nbsp;&nbsp;
			<a href="https://twitter.com/HealthPleaseOff" id="gh" target="_blank" title="Twitter">
				<span class="fa-stack fa-lg">
				  <i class="fa fa-twitter fa-stack-1x classMColor"></i>
				</span>
			</a>&nbsp;&nbsp;
			<a href="https://www.facebook.com/pages/Health-Please/1614865218755696" id="gh" target="_blank" title="Facebook">
				<span class="fa-stack fa-lg">
				  <i class="fa fa-facebook fa-stack-1x  classMColor"></i>
				</span>
			</a>
			
		</div>
	</div>

<div class="row">
		<div class="col-md-12 col-lg-12 col-sm-12">
			<ul class="nav navbar-left">
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="http://www.healthplease.in">
                        <i class="fa fa-home fa-fw"></i> Home
                    </a>                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="about.html">
                        <i class="fa fa-life-ring fa-fw"></i> About Us
                    </a>                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="support.html">
                        <i class="fa fa-cogs fa-fw"></i> Support
                    </a>                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="pricing.html">
                       <i class="fa fa-road fa-inr"></i> Pricing
                    </a>                    <!-- /.dropdown-messages -->
                </li> 
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="faqs.html">
                       <i class="fa fa-question fa-fw"></i> FAQs
                    </a>                    <!-- /.dropdown-messages -->
                </li> 
            </ul>

		</div>
	</div>

  </footer>    
</div>
</div> 

<div class="classPowerBy">
	<div class="container">
		<div class="row">
	    	<div class="col-sm-12 col-lg-6 col-md-6">
			<a href="privacy-policy.html">Privacy Policy</a>&nbsp;|&nbsp;
			<a href="terms-and-conditions.html">Terms and Conditions</a>&nbsp;|&nbsp;
			<a href="disclaimer.html">Disclaimer</a>&nbsp;
	    	</div>
	    	<div class="col-sm-12 col-lg-6 col-md-6 text-right">
	    		Proudly Powered by <a href="http://www.healthplease.in" target="_blank">HealthPlease.in</a>
	    	</div>
	    </div>
	</div>
</div>



<div id="fb-root"></div>

<script type="text/javascript">

$( document ).ready(function() {
    //alert("Here!");
});

function onTabChange() {
	//alert("Changed!");
	$("#tabType").val("Changed!");
}

</script>

</body>
</html>