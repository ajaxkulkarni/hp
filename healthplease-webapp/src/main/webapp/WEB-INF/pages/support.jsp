<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
	

    <title>Support | HealthPlease.in</title>
  <meta name="keywords" content="HealthPlease Contact, HealthPlease Support">
    <meta name="description" content="Find ways to contact HealthPlease.in. Email us at info[at]HealthPlease.in,  Like us on Facebook, Follow us on Twitter, Connect with us at LinkedIn. ">
    <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>">
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
                    <h3 class="page-header classHeaderText">Contact Us</h3>
           <div class="classSFormHolder" style="background-color:#eee;padding:3%;height:390px"> 
                    <div class="wrapper" style="padding:5%;">
                    	<div class="row" style="padding-top:4%;margin-top:2%;background-color:#fff;padding-left:6%;height:50px">
                    	<span><h5><i class="fa fa-phone" aria-hidden="true" style="margin:"></i> Phone: <a href="tel:7620012092" style="color:#46b8da;">+91 7620012092</a></h5></span>
                    	</div>
                    	<div class="row" style="padding-top:3%;margin-top:2%;background-color:#fff;padding-left:6%;height:50px">
                    	<span><h5><i class="fa fa-envelope" aria-hidden="true" style="margin:"></i> Customer Care: <a style="color:#46b8da;" href="Mailto:care@healthplease.in"> care@healthplease.in</a></h5></span>
                    	</div>
                    	<div class="row" style="margin-top:2%;padding-top:5%;padding-left:6%;height:50px;background-color:#fff">
                    	<a class="" id="callback" name="callback" href="javascript:void(0);" style="color:#46b8da;margin-top:5%">Request a call back</a></br>
                    	</div>
                    	<div class="row" style="border:;margin-top:2%;padding-top:5%;padding-left:6%;height:50px;background-color:#fff">
                    	<a class="" style="color:#46b8da;margin-left:;margin-top:" href="/hp/faq.htm">Frequently Asked Questions</a>
                    	</div>
                    	<div class="row" style="border:;margin-top:2%;padding-top:1%;height:50px;background-color:#fff">
                    	
                    		<div class="col-md-4" style="border:;padding-left:6%;height:50px">
                    		<h5>Follow Us: </h5>
                    		</div>
                    		<div class="col-md-2" style="border:;padding-right:5%;height:50px">
                    		<a href="https://twitter.com/HealthPleaseOff" id="gh" target="_blank" title="Twitter">
									<span class="fa-stack fa-lg">
									  <i class="fa fa-twitter fa-stack-1x classMColor"></i>
									</span>
								</a>&nbsp;&nbsp;
                    		</div>
                    		<div class="col-md-2">
					              
								  <a href="https://www.facebook.com/pages/Health-Please/1614865218755696" id="gh" target="_blank" title="Facebook">
									<span class="fa-stack fa-lg">
									  <i class="fa fa-facebook fa-stack-1x  classMColor"></i>
									</span>
									</a>
							</div>
							</div>
					</div>
								
                    		</div>
                       </div>
                    </div>
            </div>

	<%@include file="user_footer.jsp" %>
</body>
</html>