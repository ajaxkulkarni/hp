<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
          <title>Book Diagnostic & Pathology Test like Thyroid, Sugar, Urine, Cholesterol, ECG and X-Ray. Pay for them Online. Sample Collected at home or in lab. EMR Storage Available.</title>
    <meta name="keywords" content="Book Online Path Test, Book online diagnostic test, Blood Sugar test">
    <meta name="description" content="Book your online Pathology Lab test and test packages and have sample picked from home. Online Payment option and save reports for future reference.">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<%@include file="user_header.jsp" %>


        <div class="classSliderHolder">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                          <div class="radio classOSRBut" id="idOSRHolder">
                            <label><input type="radio" id="idBookYourself" name="bookApp" checked value="0">Book for Yourself</label>
                          </div>
                    </div>      
                    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                          <div class="radio classORBut" id="idORHolder">
                            <label><input type="radio" id="idBookOther" name="bookApp" value="1">Book for Other</label>
                          </div>                
                    </div>                     
                </div>    
                                  
 

<script type="text/javascript">
   
    $(document).ready(function(){
      // Smart Wizard 
      $('#wizard').smartWizard({transitionEffect:'slide'});
     
    });
    
</script>


<%@include file="forms/book_appointment_self_form.jsp" %>

<script type="text/javascript">   
    $(document).ready(function(){
      // Smart Wizard 
      $('.classwizard').smartWizard({transitionEffect:'slide'});
      $("#pLoction").select2({ width: 'resolve' });       
      $("#idLabs").select2({ width: 'resolve' });   
      $("#pAppTime").select2({ width: 'resolve' });   
      

      ///$('#wizard').smartWizard({transitionEffect:'slide'});
     
    });


</script>
<%@include file="forms/book_appointment_other_form.jsp" %>
                
</div>

</div>

<%@include file="forms/request_checkup.jsp" %>
<%@include file="user_footer.jsp" %>


</body>

</html>