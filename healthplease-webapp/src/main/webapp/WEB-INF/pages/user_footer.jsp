<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

    <!-- /#wrapper -->
<div class="classFooterWrapper">
<div class="container">
 <footer>


 <!-- Welcome Modal Strts-->
 <script type="text/javascript">
 	$(document).ready(function(){
 		$("#idWelcomeMsg").modal('show');
 	});
 </script>
 <style type="text/css">
.classWelcomeCloseButton{
    width: 40px;
    z-index: 9999;
    position: absolute;
    right: -26px;
    color: #FFFFFF;
    background-color: #005490;
    opacity: 1;
    box-shadow: none;
    padding: 5px;
} 
 </style>


	  <!-- Modal Strts-->
	<div id="call_back_modal" class="modal fade" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<h4 class="modal-title classMIHeaderWrapper classMBg classWColor" >Please provide us with the below details to reach our convenience team</h4>
				</div>

	          <div class="modal-body" id="file_upload_form">
	                <div id="upload_error"></div>
	                <form id="upload_form" class="classMIBodyWrapper" action="adminController.php">
	                        <div class="form-group">
							<label for="call_back_name" class="classGColor">Name</label>
							<div  class="input-group"> 
								<div class="input-group-addon"><i class="fa fa-user"></i></div>
								<input type="text" pattern="[A-Za-z]{3}" class="form-control" id="call_back_name" name="name" placeholder="Name" required>
							</div>
							</div>
							<div class="form-group">
							<label for="call_back_number" class="classGColor">Contact No.</label>
							<div  class="input-group"> <div class="input-group-addon">+91</div><input type="text" name="number" class="form-control numeric" id="call_back_number" placeholder="Contact No" required ></div>
							</div>
                            <div class="form-group">
							<label for="call_back_email" class="classGColor">Email.</label>
							<div  class="input-group"> <div class="input-group-addon"><i class="fa fa-envelope"></i></div><input type="email" name="email" id="call_back_email" class="form-control" placeholder="Email" required></div>
							</div>  
							<input type="hidden" name="userMail" value="<%=Constants.MAIL_TYPE_REQUEST_CALLBACK%>"/>   
                            <input type="hidden" name="adminMail" value="<%=Constants.MAIL_TYPE_REQUEST_CALLBACK_LAB%>"/>    
							<button type="button" id="request_form" class="btn btn-primary">
								<div id="pre_submit">Submit</div>
								<div id="post_submit" style="display:none"><img src="<c:url value="/resources/images/loader.gif"/>"  width='15px'/>&nbspSending...</div>
							</button>
	                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                </form>

	            </div>
	        </div>
	    </div>
	</div>	
                        <!--Modal ends here-->
    <div class="row">
    	<div class="col-sm-12 col-lg-5 col-md-5">
			<div class="fb-page" data-href="https://www.facebook.com/pages/Health-Please/1614865218755696" data-width="400" data-height="100" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" data-show-posts="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/pages/Health-Please/1614865218755696"><a href="https://www.facebook.com/pages/Health-Please/1614865218755696">Health Please</a></blockquote></div></div>	
	    </div>
		
        <div class="col-sm-12 col-lg-7 col-md-7 classFooterContactWrapper">
            <h3>Contact:</h3>
                  <p>
            	We wish you a happy time here at Health Please! <br/>
				You can <a id="callback" name="callback" href="javascript:void(0);" style="color:#46b8da;"><strong>Request a call back</strong></a> or call us on <a href="tel:7620012092" style="color:#46b8da;">+91 7620012092</a> if you wish to talk to us.<br/>
				You can also write to us at <a style="color:#46b8da;" href="Mailto:care@healthplease.in">care@healthplease.in</a> <br/>
				We will be glad to help you.<br/>
<!-- We wish you a happy time here at Health Please! <br/>In case you need help feel free to write to us at <a href="mailto:care@healthplease.in" target="_blank" style="color:#46b8da;text-decoration:none;"><strong>care@healthplease.in</strong></a> or
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
                    <a class="dropdown-toggle"  href="<%=Constants.ABOUT_US_GET_URL%>">
                        <i class="fa fa-life-ring fa-fw"></i> About Us
                    </a>                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="<%=Constants.SUPPORT_GET_URL%>">
                        <i class="fa fa-cogs fa-fw"></i> Support
                    </a>                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="<%=Constants.PRICING_GET_URL%>">
                       <i class="fa fa-road fa-inr"></i> Pricing
                    </a>                    <!-- /.dropdown-messages -->
                </li> 
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="<%=Constants.FAQ_GET_URL%>">
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
			<a href="<%=Constants.PRIVACY_GET_URL%>">Privacy Policy</a>&nbsp;|&nbsp;
			<a href="<%=Constants.TERMS_GET_URL%>">Terms and Conditions</a>&nbsp;|&nbsp;
			<a href="<%=Constants.DISCLAIMER_GET_URL%>">Disclaimer</a>&nbsp;
	    	</div>
	    	<div class="col-sm-12 col-lg-6 col-md-6 text-right">
	    		Proudly Powered by <a href="http://www.healthplease.in" target="_blank">HealthPlease.in</a>
	    	</div>
	    	<input type="hidden" id="root_url" value="<%=Constants.ROOT_URL%>">
	    </div>
	</div>
</div>



<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4&appId=1570780249867940";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));



$('#callback').on("click", function(){
$('#upload_error').hide();
	$("#call_back_modal").modal('show');
});
$('.numeric').keyup( function () {
                                        if (this.value != this.value.replace(/[^0-9\.]/g, '')) {
                                           this.value = this.value.replace(/[^0-9\.]/g, '');
                                        }
                                    });

$('#request_form').on("click", function(){
	
	if( false == $('#upload_form').valid() ) return;
        //$("#request_form").html("<img src='../../resources/assets/images/loader.gif'  width='15px'/>&nbspSending...");
        $("#pre_submit").hide();
        $("#post_submit").show();
        var fields=new Array();
        var values = new Array();

        fields = $("#upload_form").serializeArray();
        $.each(fields, function(index,element){
          values.push(element.value);
        });
        
	$.ajax({
			type: "POST",
			url : "requestCallBack?values=" +values,
			success: function(response){
                    if ( response== 'OK' ){
					    $('#upload_form').trigger("reset");
                                            //$("#request_form").html("Submit");
                                            $("#pre_submit").show();
                                            $("#post_submit").hide();
					    $('#upload_error').show();
                        $('#upload_error').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>Thank you for requesting callback. Health please executive will contact you soon</div>');
						setTimeout(function(){
						  $("#call_back_modal").modal('hide')
						}, 5000);
                    } else {
						$('#upload_error').show();
                                                $("#request_form").html("Submit");
                        $('#upload_error').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>Error in request!</div>');
                    }

			}
		});
  });
  
function isValidEmailAddress(emailAddress) {
    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
    return pattern.test(emailAddress);
};  
  
  
function onLogin() {
	var form = $('#form_login');
	/* form.submit(); */
	if(!form.valid()) {
		return;
	}
	if(!isValidEmailAddress($("#username").val())) {
		 $('#idMsgLogin').html("<div class='alert alert-danger'>Please enter a valid email address</div>");
		return;
	}
	//alert("username=" + $("#username").val()  + "&password=" + $("#password").val() + "&slotId=" + $("#idSlot").val());
	var slotId = 0;
	$("#pre_login").hide();
	$("#post_login").show();
	if($("#idSlot").val() != '') {
		slotId = $("#idSlot").val();
	}
	var gotoPage = "";
	if(window.location.href.search("Corporate") > 0) {
		gotoPage = window.location.href;
	}
	$.ajax({
		type: "POST",
		url : "loginAjax?username=" +$("#username").val() + "&password=" + $("#password").val() + "&slotId=" + slotId + "&gotoPage=" + gotoPage,
		success: function(response){
				$("#post_login").hide();
				$("#pre_login").show();
                if (response == $("#root_url").val() ||  response.search(".htm") > 0 || response.search("Corporate") > 0 ){
					window.location.href = response;
                } else {
                    $('#idMsgLogin').html("<div class='alert alert-danger'>" + response + "</div>");
                }
		}
	});
	
}

function onForgotPassword() {
	var form = $('#forgot_pwd_form');
	if(!form.valid()) {
		return;
	}
	$("#forgot_post_submit").show();
	$("#forgot_pre_submit").hide();
	$.ajax({
		type: "POST",
		url : "forgotPassword?email=" +$("#recover_email").val(),
		success: function(response){
			$("#forgot_pre_submit").show();
			$("#forgot_post_submit").hide();
            if ( response != 'OK' ){
            	$('#msg_pwd').html("<div class=\"alert alert-danger\">" + response  +"</div>");
            } else {
                $('#msg_pwd').html("<div class=\"alert alert-info\"><strong>Temporary</strong> password is sent on your email-id</div>");
            }

		}
	});  
	
}
  
</script>




    <!--  updated by vikas 31-may-2015-->
    <script src="<c:url value="/resources/js/external/jquery.cookie.js"/>"></script>
    <script src="<c:url value="/resources/js/external/jquery_validation/jquery.validate.min.js"/>"></script>
    <script src="<c:url value="/resources/js/internal/js-form-validation.js"/>"></script>
    <script src="<c:url value="/resources/js/internal/js_combine.js?ver=125"/>"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="<c:url value="/resources/js/internal/jquery.inputlimiter.1.3.1.js"/>"></script>
       

<!-- Login form modal code start --> 
<div class="modal fade " id="idLoginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false" backdrop='true' data-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center" id="exampleModalLabel">Login</h4>
        <div id="idMsgLogin" class="msg"></div>
      </div>
      <div class="modal-body">
           <div id="msg_login" class="msg">
           </div>
        <form method='post' id="form_login">
     
        <table class='table table-bordered'>
     
            <tr>
                <td>Email</td>
                <td><input type='email' name="user.email" id='username' class='form-control' value="" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" ></td>
            </tr>
            <tr><td colspan="2" id="idUsernameErr"></td></tr>
     
            <tr>
                <td>Password</td>
                <td><input type='password' name="user.password" id='password' class='form-control' value="" required></td>
            </tr>
            <%-- <tr><td colspan="2" id="idPasswordErr">	${result}</td></tr> --%>
     		<input type="hidden" name="slot.id" id="idSlot" value=""/>
         
            <tr>
          	<td><!-- <input type='hidden' name='token'  class='form-control' value="c64025074738e214cd25016d0ebc533c" > --></td>
            <td colspan="2">
                <div id="submituser">
                   <button type="button" class="btn btn-primary" name="btn-save" id="idLoginSubmit" onclick="onLogin()">
                       	<div id = "pre_login">
                       		<span class="glyphicon glyphicon-plus"></span> Login
                       	</div>
                        <div id="post_login" style="display:none">
                         	<img src="<c:url value="/resources/images/loader.gif"/>"  width='15px'/>
                         	&nbspLoading...
                    	</div>  
                   </button>
                   <a href="<%=Constants.REGISTER_USER_GET_URL%>" id="register_link" class="signupid btn btn-large btn-success">Register Me &nbsp;<i class="glyphicon glyphicon-forword"></i> </a>
                </div>
                      
            </td>
                
             
             
            </tr>
     
        </table>
    </form>
      </div>
      <div class="modal-footer">
        <div class="form-group">
          <div class="col-md-12 control"> 
                  Forgot password?
                  <a class="btn btn-info btn-xs forgetPasswordid" id="" href="#idForgetPasswordModal">
                  Click Here
              </a>
             
          </div>
      </div>    
      </div>
    </div>
  </div>
</div>
<!-- Login modal form code end-->

<!-- Forget form modal code start -->
<div class="modal fade " id="idForgetPasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center" id="exampleModalLabel">Forgot Password</h4>
        <div id="" class="msg"></div>
      </div>
      <div class="modal-body">
      	<div id="msg_pwd">
      	<!-- <div class="alert alert-info">
			<strong>Temporary!</strong>
			password is send on your email-id
			</div>
		</div> -->
		</div>
		<form id="forgot_pwd_form">
        <table class='table table-bordered'>
            <tr>
                <td>Email</td>
                <td><input type='email' name='email' id='recover_email' class='form-control' value="" required ></td>
            </tr>
     
            <tr>
            <!-- <input type='hidden' name='token'  class='form-control' value="90d853ab39494fa499c81a91276b854d" /> --></td>
              <td colspan="2">
                  <div id="submituser">
                     <button type="button" class="btn btn-primary" name="btn-save" onclick="onForgotPassword()">
                         <div id="forgot_pre_submit"><span class="glyphicon glyphicon-plus"></span> 
                         	Send
                         </div>
                         <div id="forgot_post_submit" style="display:none">
                         	<img src="<c:url value="/resources/images/loader.gif"/>"  width='15px'/>
                         	&nbspSending...
                         </div>
                     </button>  
                     <a href="#" id="id" class="btn btn-large btn-danger" data-dismiss="modal"><i>Cancel</i> </a>
                  </div>
                        
              </td>
            </tr>
        </table>
        </form>
      </div>
      <div class="modal-footer">
        <div class="form-group">
          <div class="col-md-12 control"> 
                  New User Registration 
              <a class="btn btn-info btn-xs signupid" id="" href="<%=Constants.REGISTER_USER_GET_URL%>">
              <!-- <a class="btn btn-info btn-xs" id="loginid" href="#idLoginModal" data-toggle="modal" data-keyboard="false" data-target="#idLoginModal"> -->
                  Click Here
              </a>
             
          </div>
      </div>    
      </div>
      
    </div>
  </div>
</div>

</body>
</html>