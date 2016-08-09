<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!-- jQuery Version 1.11.0 -->
    <script src="<c:url value="/resources/labcomponents/js/jquery-1.11.0.js"/>"></script>
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	
	<script src="<c:url value="/resources/js/paging.js"/>"></script> 

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/labcomponents/js/bootstrap.min.js"/>"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value="/resources/labcomponents/js/plugins/metisMenu/metisMenu.min.js"/>"></script>

    <!-- Date Picker js-->
    <script src="<c:url value="/resources/js/jquery-ui.js"/>"></script>
    <!--<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"/>"></script>-->
    <!-- Morris Charts JavaScript -->
    
    <!-- Custom Theme JavaScript -->
    <script src="<c:url value="/resources/labcomponents/js/sb-admin-2.js"/>"></script>
    <script src="<c:url value="/resources/js/external/jquery_validation/jquery.validate.min.js"/>"></script>
    <script src="<c:url value="/resources/js/internal/lab-forms-validation.js?ver=1001"/>"></script>
    <script src="<c:url value="/resources/labcomponents/js/lab-dashboard.js?ver=1000"/>"></script>
    <%-- <script type="text/javascript" src="<c:url value="/resources/js/pagination.js"/>"></script> --%>
    <script src="<c:url value="/resources/js/myPagination.js"/>"></script>

    <script>
        $(".fromCalendar").datepicker({
                dateFormat: 'yy-mm-dd',
                //maxDate: 0,
                changeMonth: true, 
                changeYear: true,
                autoclose: true,
                viewMode: "months" 
                // yearRange: "c-100:c+25"
          });
        $(".toCalendar").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true, 
                changeYear: true,
                autoclose: true,
                viewMode: "months" 
                // yearRange: "c-100:c+25"
          });
        
        function onCancel(appointmentId) {
        	$("#appointmentId").val(appointmentId);
        	$("#cancel-popup").modal('show');
        }

        function onUpload(appointmentId) {
        	
        	$("#report_appid").val(appointmentId);
        	getAppointment(appointmentId);
        	$("#uploadFileModal").modal('show');
        }
        
        function getAppointment(id) {
       	 $.ajax({
       	       	type : "POST",
       	           url : 'getAppointment',
       	           dataType: 'json',
       	           data: "appointmentId="+ id,
       	           success : function(app) {
       	        	   var appendString = "";
       	        	   var completedReports = "Uploaded Reports :";
       	        	   var i = 0;
       	        	   for(i = 0; i  < app.tests.length; i++) {
       	        		   if(app.tests[i].reportSent != 'Y' && app.tests[i].fileLocation == null) {
       	        			   appendString = appendString + "<option value='" + app.tests[i].id + "' >" + app.tests[i].name + "</option>";
       	        		   } else {
       	        			   completedReports = completedReports + "<a href='getTestReport?appointmentId=" + app.id  +"&testId=" + app.tests[i].id + "'>" + app.tests[i].name + "</a> , ";
       	        		   }
       	        		   
       	        	   }
       	        	   $("#appTests").html(appendString);
       	        	   $("#uploadedReports").html(completedReports);
       	           }
       	        	   
       	           });
       }

    </script>    
    
    <script type="text/javascript">
    
    $('#search').keyup(function()
    {
    	searchTable($(this).val());
    });
    
    function searchTable(inputVal)
    {
    	var table = $('#appointments_table');
    	table.find('tr').each(function(index, row)
    	{
    		var allCells = $(row).find('td');
    		if(allCells.length > 0)
    		{
    			var found = false;
    			allCells.each(function(index, td)
    			{
    				var regExp = new RegExp(inputVal, 'i');
    				if(regExp.test($(td).text()))
    				{
    					found = true;
    					return false;
    				}
    			});
    			if(found == true)$(row).show();else $(row).hide();
    		}
    	});
    }
    
    
     $(document).ready(function(){
    	 //$("#appointments_table").paging({limit:$("#limit").val()});
    	 paginateTable($("#limit").val(), 0);
 	}); 
     
     function resetTable() {
    	 //$("#appointments_table").paging({limit:$("#limit").val()});
    	 //location.reload(); 
    	 paginateTable($("#limit").val(), 0);
     }
     
     function resetReason() {
    	 if($("#select_reason").val() == 4) {
    		 $("#cancel_reason").removeAttr("readonly");
    	 } else {
    		 $("#cancel_reason").attr("readonly", true);
    	 }
     }
    
     function getAppointmentDetails(id) {
    	 title = $("#appFor").html();
    	 testNo = $("#tests_dropdown_list").val();
    	 if(testNo == null) {
    		 testNo = 0;
    	 }
    	 $.ajax({
 	       	type : "POST",
 	           url : 'getAppointmentDetails',
 	           dataType: 'json',
 	           data: "appointmentId="+ id + "&header=" + title,
 	           success : function(app) {
 	        	 $("#name_lable").text("Name :" + app.user.firstName);
 	        	 $("#id_lable").html("Appointment ID :<span id = 'rpt_app_id'>" + app.id + "</span>");
 	        	 var testsList = "";
 	        	 var i = 0;
 	        	 if(app.tests != null && app.tests.length > 0) {
 	        	 	for(i = 0;i<app.tests.length;i++) {
 	        	 		if(testNo ==  i) {
 	        	 			testsList = testsList + "<option value='" + i + "' selected>" + app.tests[i].name + "</option>";
 	        	 		} else {
 	        				testsList = testsList + "<option value='" + i + "'>" + app.tests[i].name + "</option>";
 	        	 		}
 	        	 	}
 	        	 	if($("#tests_dropdown_list").html(testsList) == '') {
 	        	 		$("#tests_dropdown_list").html(testsList);
 	        	 	}
 	        	 	var formData = "<input type='hidden' name='user.firstName' value='" + app.user.firstName + "'/>" + 
 	        	 	"<input type='hidden' name='id' value='" + app.id + "'/>" + 
 	        	 	"<input type='hidden' name='user.id' value='" + app.lab.id + "'/>" + 
 	        	 	"<input type='hidden' name='lab.name' value='" + app.lab.name + "'/>" + 
 	        	 	"<input type='hidden' name='lab.address' value='" + app.lab.address + "'/>" + 
 	        	 	"<input type='hidden' name='tests[" + testNo + "].name' value='" + app.tests[testNo].name + "'/>" +
 	        	 	"<input type='hidden' name='printRequired' value='N' id = 'is_send_mail'/>";
 	        	 	$("#formData").html(formData);
 	        	 	generateReportData(app,testNo);
 	           	}
 	        	 $("#model_for_prepare_Report").modal('show');
 	           },
 	           error: function(e){
 	           	alert("Error: " + e);
 	       	}
 	       }); 
    	 
     }
     
     /* function resetSlotType() {
    	alert("Here!");
    	window.location.href = window.location.href + "&slotType=" $("#slotType").val();
     } */
     
     function onTestSelect() {
    	 title = $("#appFor").html();
    	 testNo = $("#tests_dropdown_list").val();
    	 //alert(title + ":" + $("#rpt_app_id").text() + ":" + $("#tests_dropdown_list").val());
    	 getAppointmentDetails($("#rpt_app_id").text());
     }
     
     function sendReport() {
    	 $("#is_send_mail").val('Y');
    	 $("#report_form").submit();
     }
     
     function saveReport() {
    	 $("#is_send_mail").val('P');
    	 $("#report_form").submit();
     }
     
     
     function generateReportData(app,id) {
    	 var reportData = "";
  	 	if(app.tests[id].parameters != null && app.tests[id].parameters.length > 0){
  	 	
  	 		for(i = 0; i<app.tests[id].parameters.length;i++ ) {
  	 			reportData =  reportData + "<tr><td>" + app.tests[id].parameters[i].name + "</td>" +
                "<td><input type='text' name='tests[" + id +"].parameters[" + i +"].actualValue'/></td>" +
                "<input type='hidden' name='tests[" + id +"].parameters[" + i +"].name' value='" + app.tests[id].parameters[i].name + "'/>" +
                "<input type='hidden' name='tests[" + id +"].parameters[" + i +"].normalValue' value='" + app.tests[id].parameters[i].normalValue + "'/>" +
                "<input type='hidden' name='tests[" + id +"].parameters[" + i +"].unit' value='" + app.tests[id].parameters[i].unit + "'/>" +
                "<td>" +app.tests[id].parameters[i].unit + "</td>" +
                "<td>"; 
                if(app.tests[id].parameters[i].normalValue == null) {
                	reportData = reportData + "</td></tr>"
                } else {
                	reportData = reportData + app.tests[id].parameters[i].normalValue +"</td>";
                }
                "</tr>";
  	 		}
  	 		
  	 	} 
  	 	$("#reports_table_body").html(reportData);
     }
    </script>
<script src="<c:url value="/resources/js/external/file_input/fileinput.min.js"/>"></script>  
<script src="<c:url value="/resources/js/external/angular/angular.js"/>"></script>
<script src="<c:url value="/resources/js/external/angular/pagination/dirPagination.js"/>"></script>
<script src="<c:url value="/resources/js/internal/angular/lab-dashboard.js?ver=3001"/>"></script>

<link href="<c:url value="/resources/css/external/select2/select2.min.css"/>" rel="stylesheet" ></link>
<script src="<c:url value="/resources/js/external/select2/select2.min.js"/>"></script>


</body>
</html>