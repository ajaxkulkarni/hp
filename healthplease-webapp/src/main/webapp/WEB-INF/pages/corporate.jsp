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
          <title>Corporate Plans | HealthPlease.in</title>
        <style>
				.cardheader{
				position:relative;
				text-align:center;
				left:0px;
				top:0px;
				background-color:
				
				}
				.cardbody{
				text-align:left;
				margin:10%;
				}
				.cardfooter{
				position:absolute;
				top:80%;
				bottom:0%;
				left:10%;
				}
				.card{
				margin:2%;
				background-color:#fff;
				box-shadow: 0px 2px 5px grey;
				padding:1%;
				text-align:centre;
				border-radius:5px;
				
				}
				
				
    	</style>
</head>

<body>
<%@include file="user_header.jsp" %>


<div class="row">
	<div class="col-sm-12">
		<div class ="card" style="height:100px">
		<div class="cardheader">
		<h1>Request Packages</h1>
		</div>
		</div>
	</div>



</div>

<div class="row"> 
 <div class="col-sm-4" style=""></div>
  <div class="col-sm-4" style="">
  <div class ="card" style="height:450px">
		<div class="cardheader" >
		<h1>Select Packages</h1>
		</div>
		  <div style="margin:5%;">
			<div class="form-group">
			  <label for="sel1"style="margin-top:5%">Select City:</label>
			  <select class="form-control" id="sel1">
			    <option>Pune</option>
			    <option>Pune</option>
			    <option>Pune</option>
			    <option>Pune</option>
			  </select>
			  
			   <label for="sel1"style="margin-top:5%">Select Corporate:</label>
			  <select class="form-control" id="sel1">
			    <option>ABC</option>
			    <option>XYZ</option>
			   
			  </select>
			  
			  <label for="sel1"style="margin-top:5%">Select Lab:</label>
			  <select class="form-control" id="sel1">
			    <option>Lab1</option>
			    <option>Lab1</option>
			    <option>Lab1</option>
			    <option>Lab1</option>
			  </select>
			  
			  <button type="button" class="btn btn-primary " style="margin-top:10%">Submit</button>
			  
            </div>
		 	
		  </div>
		</div>
  
  </div>
   <div class="col-sm-4" style=""></div>
  </div> 
  
  

   <div class="row">
   <div class="col-sm-12" style="">
      <div class ="card" style="height:none; margin:none">
		<div class="cardheader">
		<h1>Packages</h1>
		</div>
		<div class="panel-group">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" href="#collapse1">Package</a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse">
      <div class="panel-body">
      		<table class="table table-bordered">
				<thead>
					<th>Test Name</th>
					<th>Remarks</th>
				</thead>
      </table>
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">select</button>
      </div>
      <div class="panel-footer">Panel Footer</div>
    </div>
  </div>
</div>
  </div>
 </div> 
 </div> 
 
   <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Our representative will get in touch soon</h4>
        </div>
        <div class="modal-body">
        
        	<form role="form">
			  <div class="form-group">
			    <label for="name">Name:</label>
			    <input type="string" class="form-control" id="name">
			  </div>
			  <div class="form-group">
			    <label for="email">Company Email:</label>
			    <input type="email" class="form-control" id="email">
			  </div>
			  <div class="form-group">
			    <label for="pwd">Mobile No.:</label>
			    <input type="number" class="form-control" id="mobile">
			  </div>
			  <button type="submit" class="btn btn-default"style="margin-top:5%">Submit</button>
			</form>
          
        </div>
        
      </div></div></div>
      

<!--    <div class="row"  > -->
<!--     <div class="col-sm-4" style="border:solid"> -->
<!--      <div class="dropdown" style="margin-left:25%;margin-top:10%;margin-bottom:10%"> -->
<!--   <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">City -->
<!--   <span class="caret"></span></button> -->
<!--   <ul class="dropdown-menu"> -->
<!--     <li><a href="#">City</a></li> -->
<!--     <li><a href="#">City</a></li> -->
<!--     <li><a href="#">City</a></li> -->
<!--      <li><a href="#">City</a></li> -->
<!--       <li><a href="#">City</a></li> -->
<!--        <li><a href="#">City</a></li> -->
<!--   </ul> -->
<!-- </div> -->
<!--     </div> -->
<!--     <div class="col-sm-4" style="border:none"> -->
<!--      <div class="dropdown" style="margin-left:25%;margin-top:10%;margin-bottom:10%"> -->
<!--   <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Corporate -->
<!--   <span class="caret"></span></button> -->
<!--   <ul class="dropdown-menu"> -->
<!--     <li><a href="#">Corporate</a></li> -->
<!--     <li><a href="#">Corporate</a></li> -->
<!--     <li><a href="#">Corporate</a></li> -->
<!--     <li><a href="#">Corporate</a></li> -->
<!--     <li><a href="#">Corporate</a></li> -->
<!--     <li><a href="#">Corporate</a></li> -->
<!--   </ul> -->
<!-- </div> -->
<!--     </div> -->
<!--     <div class="col-sm-4"style="border:none"> -->
<!--     <div class="dropdown" style="margin-left:25%;margin-top:10%;margin-bottom:10%"> -->
<!--   <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Lab -->
<!--   <span class="caret"></span></button> -->
<!--   <ul class="dropdown-menu"> -->
<!--     <li><a href="#">Lab</a></li> -->
<!--     <li><a href="#">Lab</a></li> -->
<!--    <li><a href="#">Lab</a></li> -->
<!--    <li><a href="#">Lab</a></li> -->
<!--    <li><a href="#">Lab</a></li> -->
<!--    <li><a href="#">Lab</a></li> -->
<!--   </ul> -->
<!-- </div> -->
<!--     </div> -->
<!--   </div> -->
  
  
<!--    <div class="row" > -->
<!--     <div class="col-sm-6"style="border:none"> -->
<!--     <ul class="list-group"style="margin-left:20%"> -->
<!--   <li class="list-group-item"><h2>Basic Package @Rs. 999/- 33% off</h2></li> -->
<!--   <li class="list-group-item"><h4>Teat Name</h4></li> -->
<!--    <li class="list-group-item"><h4>Teat Name</h4></li> -->
<!--     <li class="list-group-item"><h4>Teat Name</h4></li> -->
<!--      <li class="list-group-item"><h4>Teat Name</h4></li> -->
<!--       <li class="list-group-item"><h4>Teat Name</h4></li> -->
<!--        <li class="list-group-item"><h4>Teat Name</h4></li> -->
       
</ul>
      
   
<!-- <div class="row"> -->
<!-- <div class="col-sm-4"style="border:none"></div> -->
<!-- <div class="col-sm-4"style="border:none"> -->
<!-- <button type="button" class="btn btn-primary" style="margin-left:20%">Book Now</button> -->
<!-- </div> -->
<!-- <div class="col-sm-4"style="border:none"></div> -->
<!-- </div> -->
<!--     </div> -->
    
<!--   <div class="col-sm-6"style="border:none"> -->
<!-- <ul class="list-group"style="margin-left:20%"> -->
<!--   <li class="list-group-item"><h2>Basic Package + Diagnostic</br>@Rs. 1500/- 31% off</h2></li> -->
<!--   <li class="list-group-item"><h4>Teat Name</h4></li> -->
<!--    <li class="list-group-item"><h4>Teat Name</h4></li> -->
<!--     <li class="list-group-item"><h4>Teat Name</h4></li> -->
<!--      <li class="list-group-item"><h4>Teat Name</h4></li> -->
<!--       <li class="list-group-item"><h4>Teat Name</h4></li> -->
<!--        <li class="list-group-item"><h4>Teat Name</h4></li> -->
<!-- </ul> -->
  
  
<!-- <div class="row"> -->
<!-- <div class="col-sm-4"style="border:none"></div> -->
<!-- <div class="col-sm-4"style="border:none"> -->
<!-- <button type="button" class="btn btn-primary" style="margin-left:20%">Book Now</button> -->
<!-- </div> -->
<!-- <div class="col-sm-4"style="border:none"></div> -->
<!-- </div> -->
<!--     </div> -->
    
<!--   </div> -->
<!--   </div> -->
  
  
  

<%@include file="user_footer.jsp" %>
</body>

</html>