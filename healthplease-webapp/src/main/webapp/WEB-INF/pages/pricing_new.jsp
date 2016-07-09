<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="en">
<head>
	

    <title>Top Medical Laboratory Packages and Test at most Affordable prices in Pune | HealthPlease.in</title>

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
        
          <div class="classTopHeading">
        <div class="container">
            <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <!-- <h1 class="">Pricing<span class="pull-right classHLFont">All the tests marked with an asterisk are sent outside Dhanwantari Lab for testing.</span></h1> -->
                <h1 class="">Pricing</h1>
            </div>
        </div>
        </div>
        </div>
        
        <div class="row">
        	<div class="col-md-3"></div>
        	<div class="col-md-6" style="padding-top:5%;padding-bottom:10%;">	
        	
            <div class="row">
            <div class="col-md-6" style="padding-top:10%;padding-bottom:10%;padding-left:2%;">	
        	<h3>Choose Lab to get test charges</h3>
        	</div>
        	 <div class="col-md-6" style="padding-top:13%;padding-bottom:10%;padding-left:-1%;">	
        	<form id="labsForm" action="<%=Constants.GET_PRICING_POST_URL %>" method="post">
                    <select name="id" onChange="getPricing()" style="width:150px;height:28px;">
                    <c:if test="${lab != null }">
                    	<option value="${lab.id}" >${lab.name}</option>
                    </c:if>
                      <option value="pricing.html" >select</option>
                      <c:forEach items="${labs}" var="lab">
						<option value="${lab.id}">${lab.name}</option>
                      </c:forEach>
                    </select>
                    <input type="hidden" value="${lab.name}"/>
					</form>
					</div>
			</div>
			</div>
        	<div class="col-md-3"></div>
		</div>        
        
        
   		<%@include file="user_footer.jsp" %>

</body>
</html>