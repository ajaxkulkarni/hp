<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div id="page-wrappera" class="container">
            
            <!-- /.row -->
            <div class="row">
                <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <div class="classHighLightBox">
                        
                    </div>
                </div>
            </div>
              <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <h3 class="page-header classHeaderText">Partner Labs</h3>
                    <a href="<%=Constants.PARTNER_LABS_GET_URL%>"> 
                    <div class="classSFormHolder" >
                        <img src="<c:url value="/resources/images/1.jpg"/>" width="100%"/>
                      <!--   <div class="classSupportForm">
                            <div class="classLabDetailWrapper">
                                
                            </div>             
                        </div> -->
                       </div>
                      </a>
                </div>
               
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <h3 class="page-header classHeaderText">Ask your Query</h3>
                    
                    <div class="classSFormHolder">
                        <img src="<c:url value="/resources/images/3.jpg"/>" width="100%"/>
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
                                       <input type="text" class="form-control numeric" id="age" name="age" placeholder="Your Age*" minlength="2" required>           
                                       <label for="age" style="float: right; margin-top: 3px; margin-right: -10px;"></label>
                               </div> 
                              </div>

                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-info "></i></span>
                                       <textarea class="form-control" id="query" name="query" placeholder="Your Health Issues" style="height: 100px;" required></textarea>
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
                <!-- /.col-lg-12 -->
            </div>
        </div>

</body>
</html>