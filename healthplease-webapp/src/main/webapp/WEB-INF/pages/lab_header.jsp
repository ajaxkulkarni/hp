<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/labcomponents/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value="/resources/labcomponents/css/plugins/metisMenu/metisMenu.min.css"/>" rel="stylesheet">
    
    <link href="<c:url value="/resources/css/external/file_input/fileinput.css"/>" rel="stylesheet" type="text/css">

    <!-- Timeline CSS -->
    <link href="<c:url value="/resources/labcomponents/css/plugins/timeline.css"/>" rel="stylesheet">
    
    <!-- DatePicker CSS -->
    <link href="<c:url value="/resources/css/jquery-ui.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/labcomponents/css/sb-admin-2.css"/>" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<c:url value="/resources/labcomponents/css/plugins/morris.css"/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/labcomponents/font-awesome-4.1.0/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    
    <link href="<c:url value="/resources/css/internal/form-validation.css"/>" rel="stylesheet" type="text/css">
    
<link href="http://fonts.googleapis.com/css?family=Droid+Serif" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    

<style>
    .classLogoImg {
     /*   margin-top: -13px; */
     
     margin:auto;
/*         margin-left: 0px; */
        width: 200px;
    /*     padding: 3px 10px; */
    border: 1px #f80 solid;
      /*   box-shadow: 1px -2px 0px #F80, -1px -2px 0px #F80; */
        background-color: #FFF;
    }

.paging-nav {
  text-align: right;
  padding-top: 2px;
}

.paging-nav a {
  margin: auto 1px;
  text-decoration: none;
  display: inline-block;
  padding: 1px 7px;
  background: #91b9e6;
  color: white;
  border-radius: 3px;
}

.paging-nav .selected-page {
  background: #187ed5;
  font-weight: bold;
}

.paging-nav {
  width: 400px;
  margin: 0 auto;
  font-family: Arial, sans-serif;
}
</style>

</head>
<body>
<div class="row" style="height:110px;">
	<div class="col-md-3">
	  <a class="navbar-brand" href="http://www.healthplease.in/"><img src="<c:url value="/resources/images/LOGO-2.png"/>" class="classLogoImg"/></a>
	</div>
	<div class="col-md-6" >
	  <img src="getLabLogo?logoPath=${user.lab.logo}"  />
	</div>
	<div class="col-md-3">
	 <ul class="nav navbar-top-links navbar-right">
                
                <li class="dropdown">
                    <div class="sidebar-nav navbar-collapse">
                        <input type="hidden" id="lab_id" name="lab_name" value="1">
                        <h3> ${user.lab.name} </h3>
                    </div>
                 
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${user.firstName} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<%=Constants.LAB_HOME_URL_GET%>"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="<%=Constants.LAB_SETTINGS_GET_URL%>"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="<%=Constants.LOGOUT_GET_URL%>"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
              
            </ul>
	
	</div>
</div>
 <!-- Navigation 
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                 <div class="row">
                <div class="col-md-4" >
                <a class="navbar-brand" href="http://www.healthplease.in/"><img src="<c:url value="/resources/images/LOGO-2.png"/>" class="classLogoImg"/></a>
                </div>
                <div class="col-md-offset-4 col-md-4">
                 <img src="getLabLogo?logoPath=${user.lab.logo}" class="classLogoImg" />
                 </div>
                </div> 
            </div>
             /.navbar-header

            <ul class="nav navbar-top-links navbar-right">
                
                <li class="dropdown">
                    <div class="sidebar-nav navbar-collapse">
                        <input type="hidden" id="lab_id" name="lab_name" value="1">
                        <h3> ${user.lab.name} </h3>
                    </div>
                    /.dropdown-user 
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${user.firstName} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<%=Constants.LAB_HOME_URL_GET%>"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="<%=Constants.LAB_SETTINGS_GET_URL%>"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="<%=Constants.LOGOUT_GET_URL%>"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
                 /.dropdown
            </ul>
             /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation" style="margin-top:-35px">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <!-- /input-group -->
                        </li>
                         <li>
                            <a class="active" href="<%=Constants.LAB_HOME_URL_GET%>"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                             <ul class="nav nav-second-level ">
                                <li>
                                    <a class="" href="<%=Constants.LAB_HOME_URL_GET%>">All</a>
                                </li>
                                 <li>
                                    <a class="" href="<%=Constants.LAB_HOME_URL_GET%>?appType=Doc">Doctor Visit</a>
                                </li>
                                 <li>
                                    <a class="" href="<%=Constants.LAB_HOME_URL_GET%>?appType=Lab">Lab Visit</a>
                                </li>
                                 <li>
                                    <a class="" href="<%=Constants.LAB_HOME_URL_GET%>?appType=Home">Home Visit</a>
                                </li>
                                
                            </ul>
                        </li>
                        <li>
                            <a class="" href="<%=Constants.BOOK_APPOINTMENT_LAB_GET_URL%>"><i class="fa fa-calendar fa-fw"></i> Book an Appointment</a>
                        </li>
                        <li>
                            <a href="javascript:void(0);"><i class="fa fa-bar-chart-o fa-fw"></i> Availability<!-- <span class="fa arrow"></span> --></a>
                            <ul class="nav nav-second-level ">
                                <li>
                                    <a class="" href="<%=Constants.LAB_DAYS_GET_URL%>">Day</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="" href="<%=Constants.SLOTS_GET_URL%>"><i class="fa fa-table fa-fw"></i> Slots</a>
                        </li>
                         <li>
                            <a class="" href="<%=Constants.LAB_TESTS_GET_URL%>"><i class="fa fa-table fa-fw"></i> Tests</a>
                        </li>
                        <li>
                            <a class="" href="<%=Constants.LAB_SETTINGS_GET_URL%>"><i class="fa fa-cogs fa-fw"></i> Settings</a>
                        </li>
                        <li>
                            <a class="" href="<%=Constants.LAB_USERS_GET_URL%>"><i class="fa fa-cogs fa-fw"></i> User</a>
                        </li>
                         <li>
                             <a href="<%=Constants.LOGOUT_GET_URL%>"><i class="fa fa-sign-out fa-fw"></i> Log Out</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        
</body>
</html>