<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div id="page-wrappera" class="container">

           <style>
    input.error, textarea.error{
         border-color: #843534 !important;
       -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #ce8483 !important;
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #ce8483 !important;
          color:#555 !important;
    }
    
    .margin-top-10{
        margin-top: -10px;
    }
</style> 
<div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 classNoLPadding">
                    <h3 class="page-header classHeaderText">About Lab</h3>
                    <div class="classAboutPannel" style="position:relative;">
                    <a href="<%=Constants.PARTNER_LABS_GET_URL%>">                       
                       <div class="classAboutPanelWrapper">

                    <div class="classLabDetailWrapper">
                      </div>   

                        </div></a>
                    
                  </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <h3 class="page-header classHeaderText">Request A Check Up</h3>
                    <div class="classRequestPannel" style="position:relative;">
                     <div class="classSFormHolder">
                          <div class="classSupportForm">
                              <form id="request_from_index" class="classSupportPanal" action="">
                                <div class="form-group"> 
                                 <div class="input-group">           
                                      <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                      <input type="text" class="form-control" id="name" name="name" placeholder="Full name*" required minlength="3">
                                      <label for="name" style="float: right; margin-top: 3px; margin-right: -10px;"></label>
                                 </div> 
                                </div>

                                <div class="form-group"> 
                                 <div class="input-group">           
                                      <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                         <input type="email" class="form-control" id="email" name="email" placeholder="Your Email*" required>           
                                         <label for="email" style="float: right; margin-top: 3px; margin-right: -10px;"></label>
                                 </div> 
                                </div>

                                <div class="form-group"> 
                                 <div class="input-group">           
                                      <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                         <input type="text" class="form-control numeric" id="contact" name="contact" placeholder="Your Contact no.*" minlength=10 maxlength=10 required>           
                                         <label for="contact" style="float: right; margin-top: 3px; margin-right: -10px;"></label>
                                 </div> 
                                </div>

                                <div class="form-group"> 
                                 <div class="input-group">           
                                      <span class="input-group-addon"><i class="fa fa-pagelines"></i></span>
                                         <input type="text" class="form-control numeric" id="age" name="age" placeholder="Your Age*" minlength="2" required>           
                                         <label for="age" style="float: right; margin-top: 3px; margin-right: -10px;"></label>
                                 </div> 
                                </div>

                                <div class="form-group"> 
                                 <div class="input-group">           
                                      <span class="input-group-addon"><i class="fa fa-info "></i></span>
                                         <textarea class="form-control" id="query" name="query" placeholder="Your Health Issues" style="height: 100px;" ></textarea>
                                         <label for="query" style="float: right; margin-top: 3px; margin-right: -10px;"></label>
                                 </div> 
                                </div>
                                <input type="hidden" name="userMail" value="<%=Constants.MAIL_TYPE_REQUEST_CHECKUP%>"/>   
                                <input type="hidden" name="adminMail" value="<%=Constants.MAIL_TYPE_REQUEST_CHECKUP_LAB%>"/>  
                                <div class="row">
                                   <div class="col-lg-4 pull-right" >
                                      <button type="button" style="margin-left:-15px;" class="classBtnSubmit btn btn-info margin-top-10" id="idSupportSubmit">
                                      	<div id="pre_req_checkup">
                                      		Send
                                      	</div>
                                      	<div id="post_req_checkup" style="display:none">
                         				<img src="<c:url value="/resources/images/loader.gif"/>"  width='15px'/>
                         				&nbspSending...
                    					</div>
                                      </button>
                                   </div>
                                </div>  

                              </form>
                          </div>
                      </div>
                    </div>

                </div>
				<script>
                                    $('.numeric').keyup( function () {
                                        if (this.value != this.value.replace(/[^0-9\.]/g, '')) {
                                           this.value = this.value.replace(/[^0-9\.]/g, '');
                                        }
                                    });
                                    
					$('#idSupportSubmit').on("click", function(){
						if( false == $('#request_from_index').valid()) return;
						
						var fields=new Array();
				        var values = new Array();

				        fields = $('#request_from_index').serializeArray();
				        $.each(fields, function(index,element){
				          values.push(element.value);
				        });
					
						$("#post_req_checkup").show();
						$("#pre_req_checkup").hide();
						
						$.ajax({
								type: "POST",
								url : "requestCheckUp?values=" + values,
								success: function(response){
									$("#post_req_checkup").hide();
									$("#pre_req_checkup").show();
									if (response == 'OK' ){
										alert("Thank You for requesting a check up. Health Please executive will contact you soon");
                                        $("#idSupportSubmit").html("Send");
										$('#request_from_index').trigger("reset");
										//$('#upload_error').show();
										//$('#upload_error').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
									} else {
									alert("Error requesting check up. Please try again later..");
										//$('#upload_error').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
									}

			}
		});
					});
				</script>
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 classNoRPadding">
                    <h3 class="page-header classHeaderText">Stay Connected</h3>
                      <div class="classLearnPannel" style="position:relative;">
                       <a class="twitter-timeline" href="https://twitter.com/HealthPleaseOff" data-widget-id="616325476097765376">Tweets by @HealthPleaseOff</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                      
                      </div>
                
                </div>
                <!-- /.col-lg-12 -->
            </div>            <!-- /.row -->             
        </div>
        <!-- /#page-wrapper -->


</body>
</html>