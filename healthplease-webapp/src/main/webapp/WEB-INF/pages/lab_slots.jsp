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
 <!-- Bootstrap Core CSS -->
   <%--  <link rel="stylesheet" href="<c:url value = "/resources/labcomponents/css/bootstrap.min.css"/>" >

    <!-- MetisMenu CSS -->
    <link href="labcomponents/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link rel="stylesheet" href="<c:url value ="/resources/labcomponents/css/plugins/timeline.css" />">
    
    <!-- DatePicker CSS -->
    <link rel="stylesheet" href="<c:url value ="/resources/css/jquery-ui.css" />">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value ="/resources/labcomponents/css/sb-admin-2.css" />">

    <!-- Morris Charts CSS -->
    <link rel="stylesheet" href="<c:url value ="resources/labcomponents/css/plugins/morris.css" />">

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="<c:url value = "resources/labcomponents/font-awesome-4.1.0/css/font-awesome.min.css"/>">
    
    <link rel="stylesheet" href="<c:url value = "resources/css/internal/form-validation.css" />">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
    .classLogoImg {
        margin-top: -13px;
        margin-left: 0px;
        width: 190px;
        padding: 3px 10px;
        box-shadow: 1px -2px 0px #F80, -1px -2px 0px #F80;
        background-color: #FFF;
    }
</style> --%>
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
                
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Slots Settings
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" id="slots">
                         <div id='outer_booking'><h2>Available Slots</h2>

	<p>
	The following slots are available on <span> <fmt:formatDate value="${slots[0].blockedDate}" pattern="MMM dd, yyyy"/></span>
	<input type="hidden" id="selectedDay" value="<fmt:formatDate value="${slots[0].blockedDate}" pattern="dd"/>"> 
	</p>
	Select All <input class="fields" type="checkbox" value="" name="" id = "selectAllChk" onclick="checkAll(this)">
	<form action="<%=Constants.BLOCK_SLOTS_POST_URL%>" method="post">
	<select id="slotType" name="slotType" onchange="resetSlots()">
		<c:choose>
			<c:when test="${slotType == 'Lab' }">
				<option value="<%=Constants.LAB_APP%>" selected>Lab Visit</option>
			</c:when>
			<c:when test="${slotType == 'Home' }">
				<option value="<%=Constants.HOME_APP%>" selected>Home Visit</option>
			</c:when>
			<%-- <c:otherwise>
				<option value="" selected>Both</option>
			</c:otherwise> --%>
		</c:choose>
		<option value="">Both</option>
		<option value="<%=Constants.HOME_APP%>">Home Visit</option>
		<option value="<%=Constants.LAB_APP%>">Lab Visit</option>
	</select>
	<table width='400' border='0' cellpadding='2' cellspacing='0' id='booking'>
		<tr>
			<th width='150' align='left'>Start</th>
			<th width='150' align='left'>End</th>
			<th width='150' align='left'>Book</th>
			<th width='110' align='left'>Available</th>			
		</tr>
		<tr>
			<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
		</tr>
		<c:forEach items="${slots}" var="slot">
			<tr>
				<td>${slot.startTime}</td>
				<td>${slot.endTime} </td>
				<td width="110" align="left">${slot.isBooked}</td>
				<td width="110" align="left">
					<c:choose>
					<c:when test="${slot.blocked}">
						<input class="fields" type="checkbox" value="${slot.id}" name="availableSlots">
					</c:when>
					<c:otherwise>
						<input class="fields" type="checkbox" value="${slot.id}" name="availableSlots" checked="checked">
					</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		</table>
		<input type="hidden" name="date" value='<fmt:formatDate value="${slots[0].blockedDate}" pattern="<%=Constants.DATE_FORMAT %>" />'>
		<div class="col-lg-6" style="margin-top: 20px;margin-left: -15px;">
			<button id="save" class="btn btn-primary" type="submit">Save</button>
		</div>
		</form>
		</div>
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    
    
		
    <!-- /#wrapper -->

<script type="text/javascript">

/* var check_array = [];
var unselectedList =  "";
var isChanged = 0;
var date = '';
var labid = ''; */


  function checkAll(bx) {
	  var cbs = document.getElementsByTagName('input');
	  for(var i=0; i < cbs.length; i++) {
	    if(cbs[i].type == 'checkbox') {
	      cbs[i].checked = bx.checked;
	    }
	  }
	}
	
	function resetSlots() {
		//alert( "Handler for .change() called." + $("#slotType").val());
		//alert(document.getElementById("slotType"));
		window.location.href = "getlabslots.htm?day=" + $("#selectedDay").val() + "&slotType=" + $("#slotType").val();
	}
	
	
/* $("#slotType").change(function() {
	  alert( "Handler for .change() called." );
	}); */

/* $(document).ready(function(){

    $( document ).on ( "click", ".fields", function(){
            var $this = $( this );
            dataval = $this.data('val');
            date = $this.data('date');
            labid = $this.data('labid');
            
            $('input[type=checkbox]').each(function () {
                if( false == this.checked )
                {
                    isChanged = 1;
                    unselectedList += $(this).val() + ",";  
                }
            });
            
            // Show the Selected Slots box if someone selects a slot
            if($("#outer_basket").css("display") == 'none') { 
                    $("#outer_basket").css("display", "block");
            }

            if(jQuery.inArray(dataval, check_array) == -1) {
                    check_array.push(dataval);
            } else {
                    // Remove clicked value from the array
                    check_array.splice($.inArray(dataval, check_array) ,1);	
            }

            slots=''; hidden=''; basket = 0;

            cost_per_slot = $("#cost_per_slot").val();
            //cost_per_slot = parseFloat(cost_per_slot).toFixed(2)

            for (i=0; i< check_array.length; i++) {
                    slots += check_array[i] + '\r\n';
                    hidden += check_array[i].substring(0, 8) + '|';
                    basket = (basket + parseFloat(cost_per_slot));
            }
            // Populate the Selected Slots section
            $("#selected_slots").html(slots);

            // Update hidden slots_booked form element with booked slots
            $("#slots_booked").val(hidden);		

            // Update basket total box
            basket = basket.toFixed(2);
            $("#total").html(basket);	

            // Hide the basket section if a user un-checks all the slots
            if(check_array.length == 0)
            $("#outer_basket").css("display", "none");

    });

    $( document ).on ( "click", "#save", function(){
        var $this = $("#currSlotData");
        date = $this.data('date');
        labid = $this.data('labid');
        $('input[type=checkbox]').each(function () {
            if( false == this.checked )
            {
                isChanged = 1;
                unselectedList += $(this).val() + ",";  
            }
        });
        if( isChanged == 0 ) {
            $('input[type=checkbox]').each(function () {
                if( true == this.checked )
                {
                    isChanged = 1;
                    unselectedList = "";  
                }
            });
        }
        $("#message-slots").modal('show');
        $("#msg_body_slots").html( "Are you sure you want to change slot/s setting for selected day?" );
    });
    
    $( document ).on ( "click", "#clickYesSlots", function(){
         if( isChanged == 1 ){
            var data = {};
            data["action"] = "set_lab_slots";
            data["date"] = date;
            data["lab_id"] = labid;
            data["unselectedList"] = unselectedList;
            
            $.ajax({
                    type:"POST",
                    url:"labController.html",
                    data:data,//only input
                    success: function(response){
                        var obj = $.parseJSON( response );
                        if ( 1 == obj.status ){
//                            alert(obj.msg);
                            window.location.href = window.location.href;
                        } else {
                            alert(obj.msg);
                        }
                    }
            });
        }
     });

    $( document ).on ( "click", ".classname", function(){
        msg = '';

        if($("#name").val() == '')
        msg += 'Please enter a Name\r\n';

        if($("#email").val() == '')
        msg += 'Please enter an Email address\r\n';

        if($("#phone").val() == '')
        msg += 'Please enter a Phone number\r\n';	

        if(msg != '') {
                alert(msg);
                return false;
        }
    });
    
    
            // Firefox caches the checkbox state.  This resets all checkboxes on each page load 
           // $('input:checkbox').removeAttr('checked');
});

// My settings for calendar starts from here
    $('#calendar').append($('#lhs').html());
    $('#lhs').remove();
    
    $('#slots').append($('#outer_booking').html());
    $('#outer_booking').remove();
    
    $('#slot_form').append($('#temp_slot_from').html());
    $('#temp_slot_from').remove();
    
    var buttonHtml = '<div class="col-lg-6" style="margin-top: 20px;margin-left: -15px;">\
                        <button type="button" class="btn btn-primary" id="save">Save</button>\
                    </div>';
    $('#slots').append(buttonHtml); */

    
</script>
            
   <%@include file="lab_footer.jsp" %>         
                   
  </body>
</html>  
