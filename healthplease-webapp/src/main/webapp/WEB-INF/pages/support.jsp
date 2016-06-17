<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
	

    <title>Support | HealthPlease.in</title>

<body>
        <%@include file="user_header.jsp" %>
        
        <div class="classTopHeading">
        <div class="container">
            <div class="row">
            <div class="col-lg-12">
                <h1 class="">Support</h1>
            </div>
        </div>
            <!-- /.col-lg-12 -->
        </div>
    	</div>
        <div id="page-wrappera" class="container">
            
            <!-- /.row -->
          
              <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <h3 class="page-header classHeaderText">Stay Connected</h3>
                      <!-- <a class="twitter-timeline"  href="https://twitter.com/laxmikant" data-widget-id="363657744307343360">Tweets by @laxmikant</a>
            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
           -->
           <a class="twitter-timeline" href="https://twitter.com/HealthPleaseOff" data-widget-id="616325476097765376">Tweets by @HealthPleaseOff</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <h3 class="page-header classHeaderText">Ask your Query</h3>
                    
                        <div class="classSFormHolder">
                        <img src="<c:url value="/resources/images/2.jpg"/>" width="100%"/>
                        <div class="classSupportForm">
                            <form id="request_from_index" class="classSupportPanal" action="" method="GET">
                              
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
                                       <input type="text" class="form-control numeric" id="age" name="age" placeholder="Your Age" minlength="2" >           
                                       <label for="age" style="float: right; margin-top: 3px; margin-right: -10px;"></label>
                               </div> 
                              </div>

                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-info "></i></span>
                                       <textarea class="form-control" id="query" name="query" placeholder="Your Query*" style="height: 100px;" required></textarea>
                                       <label for="query" style="float: right; margin-top: 3px; margin-l: -10px;"></label>
                               </div> 
                              </div>
                              <div class="row">
                                 <div class="col-lg-4 pull-right" >
                                    <button type="button" style="margin-left:-15px;" class="classBtnSubmit btn btn-info margin-top-10" id="idSupportSubmit">Send</button>
                                 </div>
                              </div>  

                            </form>
                        </div>
                    </div>

                </div>
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <h3 class="page-header classHeaderText">What Is Health Please</h3>
                    <a class="embedly-card" href="http://labmedicineblog.com/">A blog for medical laboratory professionals</a>
<script async src="//cdn.embedly.com/widgets/platform.js" charset="UTF-8"></script>
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
            <!-- /.row -->
        <!-- </div>
        
        </div>
        <!-- /#page-wrapper -->
<!-- <script>
                    $('.numeric').keyup( function () {
                        if (this.value != this.value.replace(/[^0-9\.]/g, '')) {
                           this.value = this.value.replace(/[^0-9\.]/g, '');
                        }
                    });
                        $('#idSupportSubmit').on("click", function(){
                            if( false == $('#request_from_index').valid()) return;

                            $("#idSupportSubmit").html("<img src='images/loader.gif'  width='15px'/>&nbspSending...");
                                $.ajax({
                                                type: "POST",
                                                url : "adminController.html?action=requestcheckup&is_query=1",
                                                data: $('#request_from_index').serializeArray(),//only input
                                                success: function(response){
                                                var obj = $.parseJSON( response );
                                                        if ( 1 == obj.status ){
                                                                alert( obj.msg );
                                                                $("#idSupportSubmit").html("Send");
                                                                $('#request_from_index').trigger("reset");
                                                                //$('#upload_error').show();
                                                                //$('#upload_error').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                                                        } else {
                                                        alert( obj.msg );
                                                                //$('#upload_error').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                                                        }

                                                }
                            });
                        });
</script> -->
	<%@include file="user_footer.jsp" %>
</body>
</html>