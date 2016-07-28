<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="en">
<head>
	

    <title>Top Medical Laboratory Packages and Test at most Affordable prices in Pune | HealthPlease.in</title>
	 <meta name="keywords" content="Affordable Pathlogy Test, Blood Sugar Test, Thyroid Test, Cholestrol Test">
    <meta name="description" content="Pathalogy Test Packages and tests in Top Diagnostic Labs at Affordable prices.Check Blood Sugar Diabettes,Thyroid Cholestrol at lowest prices. ">
	<!-- Latest compiled and minified CSS -->
    
<style type="text/css">
.classWithSBar{
margin-top: 100px;
margin-bottom: 100px;
text-align: center;
}
.classWithTopSBar{
  width: 100%;
  margin-top: -60px;
  margin-bottom: 0px;
  border-bottom: 2px solid #aaa;
  text-align: center;
  float: right;
}
.classWithTopSBar h3, .classWithTopSBar span{
  display: inline-block;
  font-size: 18px;
}
.classWithTopSBar select,
.classWithSBar select,{
  padding: 5px 10px;
  min-width: 100px;
  text-align: center;

}
.classWithResults{
 display: block;
}
.classWithNoResults{
  display: none;
}
</style>
</head>

<body>

 <body>
        <%@include file="user_header.jsp" %>
        
        <div class="container">
	        <div class="row">
	        	<div class="col-lg-3 col-md-3 col-xs-12">
	        	<h1 class="">Pricing</h1>
	        	</div>
	        <div class="col-lg-9 col-md-9 col-xs-12" style="margin-top:2%">
	        	<h4>Choose Lab to get test charges 
                  <span>
                    <select onChange="window.location.href=this.value">
                      <option value="pricing.php">select</option>
                      <option value=pricing.php?lab_id=4 >Agarwal's Pathology</opiton><option value=pricing.php?lab_id=5 >Ankur Pathology Lab</opiton><option value=pricing.php?lab_id=7 >Care First</opiton><option value=pricing.php?lab_id=1 >Dhanwantari Path Lab</opiton><option value=pricing.php?lab_id=8 >DTH Labs</opiton><option value=pricing.php?lab_id=3 >N M Medical</opiton><option value=pricing.php?lab_id=6 >PrimeX Health</opiton>                      
                    </select>

              </span> </h4>

	        </div>      
        </div> 
        <hr/>
        	<div class="row" style="margin-top:15%;margin-bottom:15%;">
        		<div class="col-md-3 col-lg-3 col-xs-12"style=""></div>
        		<div class="col-md-9 col-lg-9 col-xs-12" style="">
        			<h4>Choose Lab to get test charges 
                  <span>
                    <select onChange="window.location.href=this.value">
                      <option value="pricing.php">select</option>
                      <option value=pricing.php?lab_id=4 >Agarwal's Pathology</opiton><option value=pricing.php?lab_id=5 >Ankur Pathology Lab</opiton><option value=pricing.php?lab_id=7 >Care First</opiton><option value=pricing.php?lab_id=1 >Dhanwantari Path Lab</opiton><option value=pricing.php?lab_id=8 >DTH Labs</opiton><option value=pricing.php?lab_id=3 >N M Medical</opiton><option value=pricing.php?lab_id=6 >PrimeX Health</opiton>                      
                    </select>

              </span> </h4>
        		
        		</div>
        		
        	</div>
        
        </div>
        
   		<%@include file="user_footer.jsp" %>

</body>
</html>