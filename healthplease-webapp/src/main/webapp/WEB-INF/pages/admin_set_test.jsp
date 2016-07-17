<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
          <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
          <title>Book Diagnostic & Pathology Test like Thyroid, Sugar, Urine, Cholesterol, ECG and X-Ray. Pay for them Online. Sample Collected at home or in lab. EMR Storage Available.</title>
        
</head>

<body>
<%@include file="user_header.jsp" %>

        <div class="classGoldenDivider"></div>        <div class="classTopHeading">
        <div class="container">
            <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Welcome <span class="nameHolder">Admin</span></h1>
            </div>
        </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
        <div id="msg" class="container"></div>


<!--Add user start from here-->
<div class="container" id="addUser" name="addUser">
  <div class="row">
         <%@include file="admin_header.jsp" %> 
    
    <div class="col-lg-9 col-md-9">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Lab Settings
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-3">
                               <div class="form-group input-group">
                                   <a href="set_tests.php?lab_id=1" class="btn btn-primary">Set Test</a>
                               </div>
                            </div>     
                            <div class="col-lg-3">
                               <div class="form-group input-group">
                                  <button type="submit" class="btn btn-primary">Set Location</button>
                               </div>
                            </div>
                            <div class="col-lg-3">
                               <div class="form-group input-group">
                                   <button type="submit" class="btn btn-primary">Set Charges</button>
                               </div>
                            </div>
                            <div class="col-lg-3">
                               <div class="form-group input-group">
                                   <button type="submit" class="btn btn-primary">Generate</button>
                               </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12">
                <h4>Choose Lab to get test charges 
                  <span>
                    <select onChange="window.location.href=this.value">
                      <option value="pricing.php">select</option>
                      <option value=set_tests.php?lab_id=4 >Agarwal's Pathology</opiton><option value=set_tests.php?lab_id=5 >Ankur Pathology Lab</opiton><option value=set_tests.php?lab_id=7 >Care First</opiton><option value=set_tests.php?lab_id=1 >Dhanwantari Path Lab</opiton><option value=set_tests.php?lab_id=8 >DTH Labs</opiton><option value=set_tests.php?lab_id=3 >N M Medical</opiton><option value=set_tests.php?lab_id=6 >PrimeX Health</opiton>                      
                    </select>

              </span> </h4>
                
            </div>
          </div>
        <div class="row">
            <form action="demo_form.asp" method="get">
                <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Is Selected</th>
                                <th>Test Name</th>
                                <th>Test Charge</th>
                                <th>Report Delivery days</th>
                            </tr>
                        </thead>
                        <tbody>
                            <input type="hidden" id="lab_id" value=""/>                            
                        </tbody>
                </table> 
                <input type="submit" value="Submit">
            </form>
        </div>
    </div>  
  </div>      
</div>
        <!-- /#page-wrapper -->
   <script type="text/javascript">

    $(document).ready(function(){

       $('.checkbox').change(function() {
        if($(this).is(":checked")) {
            var $this = $( this );
            var test_id = $this.val()
            
             //create a table data
            var tableData = $('<td><input type="text" id="test_'+test_id+'"></td>');
            $("#"+test_id).append(tableData); //append the table data to the last created
            var returnVal = confirm("Are you sure?");
            $(this).attr("checked", returnVal);
        } else {
            alert("Hii");
            var $this = $( this );
            var test_id = $this.val()
            $("#test_"+test_id).remove(); //append the table data to the last created
        }
        $('#textbox1').val($(this).is(':checked'));        
    });

    });

    </script>

</div>
    <!-- /#wrapper -->
<%@include file="user_footer.jsp" %>
</body>

</html>