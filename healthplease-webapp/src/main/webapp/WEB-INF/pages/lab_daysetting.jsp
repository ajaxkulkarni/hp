<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HealthPlease - Lab Slots</title>
 
</head>

<body>

    <div id="wrapper">

        <%@include file="lab_header.jsp" %>
		<link href="<c:url value="/resources/css/slots-style.css"/>" rel="stylesheet" type="text/css">

<!-- Right Side Panel Starts From HERE -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Slots</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
            	<c:if test="${result != null }">
                <div class="alert alert-success">
                	${result}
  				</div>
  				</c:if>
            </div>   
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Calendar
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" id="calendar">
                        <%@include file="forms/calendar.jsp" %>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
                
               <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Summary of Slots
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" id="slots">
                            <h4> Day wise Summary will load here  </h4>
                        </div>
                        <!-- /.panel-body -->
                    </div>
               </div>
	
	
    </div>
    </div>
    </div>
    
		
    <!-- /#wrapper -->


            
   <%@include file="lab_footer.jsp" %>         
                   
  </body>
</html>  
