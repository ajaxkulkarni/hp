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
        <div class="">
          <div class="row">
            <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12">
                <h4>Choose Lab to get test charges 
                  <span></span>
                  	<form id="labsForm" action="<%=Constants.GET_PRICING_POST_URL %>" method="post">
                    <select name="id" onChange="getPricing()">
                    <c:if test="${lab != null }">
                    	<option value="${lab.id}">${lab.name}</option>
                    </c:if>
                      <option value="pricing.html">select</option>
                      <c:forEach items="${labs}" var="lab">
						<option value="${lab.id}">${lab.name}</option>
                      </c:forEach>
                    </select>
                    <input type="hidden" value="${lab.name}"/>
					</form>
				<!-- 	Search for Test :<input id="search" type="text"/> -->
              </h4>
                
            </div>
          </div>
        </div>
		 
        <div class="col-lg-12">
          <div class="row">      
           <h2 class="classSubHeading col-sm-12 col-md-12 col-lg-12">Packages</h2>  
           <div class="classWithResults">
          	<div class="row" id="packages_section">          
            <c:forEach items="${lab.tests}" var="test" >
            <c:if test="${test.testPackage == true }">
            <div class="col-lg-3 col-md-3 col-sm-3">
			<div class="classTestDetailTumbnail hvr-float-shadow js-show_test_details" data-value="${test.id}" >
			<h1><i class='fa fa-flask'></i>&nbsp;${test.name}<a target='_blank' class='pull-right' href='' title='click to search more information'><i class='fa fa-info-circle'></i></a></h1>
  			<p>
  			Test Fee: <strong><i class='fa fa-inr'>&nbsp;${test.price}</i></strong><br/>
 			Category: <strong>${test.category}</strong></p>
  			</div>
  			</div>
  			</c:if>
  			</c:forEach>
   		</div>
   </div>
		  
		  <div class="row" id="tests_section">
            <h2 class="classSubHeading col-sm-12 col-md-12 col-lg-12">Tests</h2>
             <c:forEach items="${lab.tests}" var="test">
             <c:if test="${test.testPackage == false }">
            <div class="col-lg-3 col-md-3 col-sm-3"><div class="classTestDetailTumbnail hvr-float-shadow js-show_test_details" data-value="${test.id}"><h1><i class='fa fa-flask'></i>
            &nbsp; ${test.name} 
            <a target='_blank' class='pull-right' href='https://www.google.co.in/search?q=+Platelet+To+Large+Cell+PLC+' title='click to search more information'><i class='fa fa-info-circle'></i></a></h1>
   			 <p>
    		Test Fee: <strong><i class='fa fa-inr'>&nbsp;${test.price}</i></strong><br/>
    		Category: <strong>${test.category}</strong></p>
    		</div>
    		</div>
    		</c:if>
    		</c:forEach>
   			</div>
          </div>     
          </div>
        </div>
           
        </div>
        <br/><br/>
     <br/><br/>
	  <br/><br/>
	   <br/><br/>
	    <br/><br/>
		 <br/></br>
		 
	<div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="modal_head"></h4>
                </div>
                <div class="modal-body" id="modal_body">
                <div class="control-group">
					<label class="control-label">Description</label>
					<div id="idDescription" class="controls readonly" style="padding-top:5px">
					</div>
				</div>
				<br>
				<div class="control-group" style="display: inline-block;">
					<label class="control-label">Fasting Info.</label>
					<div id="idFasting" class="controls readonly" style="padding-top:5px">  </div>
				</div>
				<div class="control-group" style="display: inline-block; float: right; margin-right: 150px;">
				<label class="control-label">Report Delivery Period</label>
				<div class="controls readonly" style="padding-top:5px"> 2 to 3 business days </div>
				</div>
				<div class="control-group">
				<p style="float: left; font-size: 16px;">Other Test/s</p>
				<br/>
				<table id="idChildTests" class="table table-bordered">
				</table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                </div>
            </div>
        </div>
    </div>
	</div>

    <script type="text/javascript">
    
    function getPricing() {
    	$("#labsForm").submit();
    }
    
    /* function getTestDetails(testId) {
    	alert(testId);
    	
    	$.ajax({
            type:"POST",
            url:'getTestDetails?testId=' + testId,
            success: function(response){
               //$("#modal_body").html(response);
               //$("#modal_head").html( $("#test_head").val() );
               
               $("#myModal").modal('show');
            }
  	 	}); 
    
    } */

    $(document).ready(function(){

        $(".js-show_test_details").click(function(){
            var $this = $( this );
            var test_id = $this.data('value');
            $.ajax({
                     type:"POST",
                     url:'getTestDetails?testId=' + test_id,
                     dataType: 'json',
                     success: function(test){
                        $("#modal_head").html(test.name);
                        $("#idDescription").text(test.description);
                        $("#idFasting").text("No Fasting required");
                        if('Y' == test.fastingInfo) {
                        	$("#idFasting").text("Fasting required");
                        }
                        if(test.childTests != null && test.childTests.length > 0) {
                        	var appendString = "<tbody><tr><th>Sr no.</th><th>Test Abbreviation</th><th>Test Name</th></tr>";
                            var i = 0;
                            for(i=0;i<test.childTests.length;i++) {
                            	appendString = appendString + "<tr>";
                            	appendString = appendString + "<td>" + (i+1) + "</td>";
                            	appendString = appendString + "<td>" + test.childTests[i].abbrevation + "</td>";
                            	appendString = appendString + "<td>" + test.childTests[i].name + "</td>";
                            	appendString = appendString + "</tr>";
                            }
                            appendString = appendString + "</table>";
                            $("#idChildTests").html(appendString);
                        }
                        $("#myModal").modal('show');
                     }
            }); 


        });

    });
    
    $('#search').keyup(function()
   	{
    	searchTest($(this).val(),"#packages_section");
    	searchTest($(this).val(),"#tests_section");
   	});
    
    function searchTest(inputVal,section)
    {
    	$(section).each(function(index)
    	{
    		var allDivs = $( this ).find('div');
    		allDivs.each(function(index, td)
        			{
    					var regExp = new RegExp(inputVal, 'i');
    					if(regExp.test($(this).text()))
        				{
    						$(this).show();
        				}
    					else 
    					{
    						$(this).hide();
    					} 
    					
        			});
    	});
    }

    </script>

   
            <!-- /.row -->
        <!-- </div>
        
        </div>
        <!-- /#page-wrapper -->
		<%@include file="user_footer.jsp" %>

</body>
</html>