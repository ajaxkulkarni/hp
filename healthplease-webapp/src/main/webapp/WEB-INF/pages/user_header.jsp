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
  <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>">
    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/bootstrap/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/dialog.css"/>" rel="stylesheet"/>
   
   <!--Adde by vikas for validation error custom messages on form 31-may-2015 -->
 <%--    <link href="<c:url value="/resources/css/internal/form-validation.css"/>" rel="stylesheet"> --%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
      <script src="<c:url value="/resources/bootstrap/js/jquery-1.11.2.min.js"/>"></script>
        <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery-ui.js"/>"></script>

        <!-- Steps Plugin CSS -->
       <link href="<c:url value="/resources/css/smart_wizard.css"/>" rel="stylesheet" type="text/css">
       <script type="text/javascript" src="<c:url value="/resources/js/jquery.smartWizard.js"/>"></script>
   
 <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/jquery-ui.css"/>" rel="stylesheet">

    <!-- Code Added by vikas on 23-May-2015 -->
    <!-- Used to display combobox values runtime -->
    <link href="<c:url value="/resources/css/external/select2/select2.min.css"/>" rel="stylesheet" ></link>
    <script src="<c:url value="/resources/js/external/select2/select2.min.js"/>"></script>
    
  	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<!--Google Analytics Tracking Code Start-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-66916464-1', 'auto');
  ga('send', 'pageview');

</script>
<!--Google Analytics Tracking Code End-->


<script type="text/javascript">

/* $( document ).ready(function() {
	  // Handler for login message.
	  var td = $("#idPasswordErr");
	  
        if(td.html().length > 1) {
        	$('#idLoginModal').modal('show');
        }
	  
	}); */

 
$(function(){
    $('.classSmoothScroll').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
        && location.hostname == this.hostname) {
            var $target = $(this.hash);        
            $target = $target.length && $target || $('[name=' + this.hash.slice(1) +']');
            if ($target.length) {
              var targetOffset = $target.offset().top - $(".classFixedHeader").outerHeight(true);
                // var targetOffset = $target.offset().top;
                $('html,body').animate({scrollTop: targetOffset}, 1000);
                return false;
            }
        }
    });
});

function doScroll(){
    if (window.name) window.scrollTo(0, window.name);
}

</script>

    <!-- Code Additon ends here by vikas on 23-May-2015 -->
     <link href="<c:url value="/resources/css/style.css?ver=5"/>" rel="stylesheet"></link>
     <!-- Timeline CSS -->
    
</head>

<body>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var $_Tawk_API={},$_Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/567db03243462c597a64a31f/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
    <!-- <div id="wrapper"> -->
        <div style="background:#A4DBF4;">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-xs-12 col-md-12 col-lg-12 col-xl-12">
                        <!-- Navigation -->
                        <nav class="navbar navbar-default navbar-static-top classCustomNavBar" role="navigation" style="margin-bottom: 0">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="http://www.healthplease.in/"><img src="<c:url value="/resources/images/ie_logo.png"/>" class="classLogoImg"/></a>
                            </div>
                                                        <!-- /.navbar-header -->
                            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                                <ul class="nav navbar-top-links navbar-right">
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="<%=Constants.HOME_GET_URL%>">
                                            <i class="fa fa-home fa-fw"></i> Home
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="<%=Constants.ABOUT_US_GET_URL%>">
                                            <i class="fa fa-life-ring fa-fw"></i> About Us
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                  
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="<%=Constants.PRICING_GET_URL%>">
                                           <i class="fa fa-inr fa-fw"></i> Pricing
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                      <li class="dropdown">
                                        <a class="dropdown-toggle"  href="<%=Constants.LAB_PARTNER_GET_URL%>">
                                            <i class="fa fa-cogs fa-fw"></i> Lab App
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="<%=Constants.CORPORATE_PARTNER_GET_URL%>">
                                           <i class="fa fa-building fa-fw"></i> Corporate
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                                                        <!-- /.dropdown -->
                                    
                                    <!-- /.dropdown -->
                                    <c:if test="${user.group.id == 2 || user.group.id == 4}">
                                    <li class="dropdown">
                                      <a class="dropdown-toggle"  href="<%=Constants.ADMIN_HOME_GET_URL%>">
                                           <i class="fa fa-tachometer fa-fw"></i>
                                           Dashboard
                                      </a>
                                    </li>
                                    </c:if>
                                    	
                                    
                                        <li> 
                                        <c:choose>
                                     			<c:when test="${user.firstName == null }">
                                     				 <a  href="<%=Constants.REGISTER_USER_GET_URL%>" ><i class="fa fa-user fa-fw"></i> Sign Up </a> 	
                                     			</c:when>
                                     			<c:otherwise>
                                     			 	<a  href="<%=Constants.USER_HOME_GET_URL%>" ><i class="fa fa-user fa-fw"></i> ${user.firstName} </a> 
                                     			</c:otherwise>
                                     		</c:choose>
                                        </li>                                        
                                     
                                     <li class="dropdown">
                                     		<c:choose>
                                     			<c:when test="${user.firstName == null }">
                                     				<a  href="#idLoginModal" class="dropdown-toggle" data-toggle="modal"  data-keyboard="false" data-backdrop="false" data-target="#idLoginModal" ><i class="fa fa-sign-in fa-fw"></i> Login </a>
                                     			</c:when>
                                     			<c:otherwise>
                                     				<a  href="<%=Constants.LOGOUT_GET_URL%>" ><i class="fa fa-sign-in fa-fw"></i> Logout </a>
                                     			</c:otherwise>
                                     		</c:choose>
                                     		
                                        
                                        <!-- /.dropdown-user -->
                                    </li>
                                     
                                    <!-- /.dropdown -->
                                </ul>
                            </div>
                            <!-- /.navbar-top-links -->

                            
                            <!-- /.navbar-static-side -->
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="classGoldenDivider"></div>

</body>
</html>