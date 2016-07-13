<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div id='lhs'>
    <div id='outer_calendar'>
	<table border='0' cellpadding='0' cellspacing='0' id='calendar'>
        <tr id='week'>
        <td align='left'><a href="previousmonth.htm?view=${labView}">&laquo;</a></td>
        <td colspan='5' id='center_date'>${cal.monthName}, ${cal.year}</td>    
        <td align='right'><a href="nextmonth.htm?view=${labView}">&raquo;</a></td>
    </tr>
    <tr><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th><th>Sun</th></tr>
    <c:forEach items="${cal.weeks}" var="week">
    	<tr>
    	<c:choose>
    		<c:when test="${week.monday == null || week.monday.active == 'P'}">
    			<td width='21' valign='top' class='past'>${week.monday.day}</td>
    		</c:when>
    		<c:when test="${week.monday.active == 'B'}">
    			<td width='21' valign='top' class='past'>
    			${week.monday.day}
    			<div style="height: 10px;margin-top: -16px;">
					<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.monday.day})" title="Active this day"> 
					<i class="fa fa-check"></i>
					</a>
				</div>
				</td>
    		</c:when>  
    		<c:when test="${week.monday.active == 'A'}">
    			<td width='21' valign='top'>
    			<a href="getlabslots.htm?day=${week.monday.day}" class='green' title='Please click to view bookings'>${week.monday.day}</a>  
    			<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.monday.day})"> 
                  <i class="fa fa-times" title="Block day"></i>
                </a>
                </td>
    		</c:when>
    	</c:choose>
    	<c:choose>
    		<c:when test="${week.tuesday == null || week.tuesday.active == 'P'}">
    			<td width='21' valign='top' class='past'>${week.tuesday.day}</td>
    		</c:when>
    		<c:when test="${week.tuesday.active == 'B'}">
    			<td width='21' valign='top' class='past'>
    			${week.tuesday.day}
    			<div style="height: 10px;margin-top: -16px;">
					<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.tuesday.day})"  title="Active this day"> 
					<i class="fa fa-check"></i>
					</a>
				</div>
				</td>
    		</c:when>  
    		<c:when test="${week.tuesday.active == 'A'}">
    			<td width='21' valign='top'>
    			<a href="getlabslots.htm?day=${week.tuesday.day}" class='green' title='Please click to view bookings'>${week.tuesday.day}</a>  
    			<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.tuesday.day})" > 
                  <i class="fa fa-times" title="Block day"></i>
                </a>
                </td>
    		</c:when>
    	</c:choose>
    	<c:choose>
    		<c:when test="${week.wednesday == null || week.wednesday.active == 'P'}">
    			<td width='21' valign='top' class='past'>${week.wednesday.day}</td>
    		</c:when>
    		<c:when test="${week.wednesday.active == 'B'}">
    			<td width='21' valign='top' class='past'>
    			${week.wednesday.day}
    			<div style="height: 10px;margin-top: -16px;">
					<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.wednesday.day})"  title="Active this day"> 
					<i class="fa fa-check"></i>
					</a>
				</div>
				</td>
    		</c:when>  
    		<c:when test="${week.wednesday.active == 'A'}">
    			<td width='21' valign='top'>
    			<a href="getlabslots.htm?day=${week.wednesday.day}" class='green' title='Please click to view bookings'>${week.wednesday.day}</a>  
    			<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.wednesday.day})" > 
                  <i class="fa fa-times" title="Block day"></i>
                </a>
                </td>
    		</c:when>
    	</c:choose>
    	<c:choose>
    		<c:when test="${week.thursday == null || week.thursday.active == 'P'}">
    			<td width='21' valign='top' class='past'>${week.thursday.day}</td>
    		</c:when>
    		<c:when test="${week.thursday.active == 'B'}">
    			<td width='21' valign='top' class='past'>
    			${week.thursday.day}
    			<div style="height: 10px;margin-top: -16px;">
					<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.thursday.day})"  title="Active this day"> 
					<i class="fa fa-check"></i>
					</a>
				</div>
				</td>
    		</c:when>  
    		<c:when test="${week.thursday.active == 'A'}">
    			<td width='21' valign='top'>
    			<a href="getlabslots.htm?day=${week.thursday.day}" class='green' title='Please click to view bookings'>${week.thursday.day}</a>  
    			<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.thursday.day})" > 
                  <i class="fa fa-times" title="Block day"></i>
                </a>
                </td>
    		</c:when>
    	</c:choose>
    	<c:choose>
    		<c:when test="${week.friday == null || week.friday.active == 'P'}">
    			<td width='21' valign='top' class='past'>${week.friday.day}</td>
    		</c:when>
    		<c:when test="${week.friday.active == 'B'}">
    			<td width='21' valign='top' class='past'>
    			${week.friday.day}
    			<div style="height: 10px;margin-top: -16px;">
					<a href="javascript:void(0);" class="js-active_day_slot"  title="Active this day" onclick="confirmActivate(${week.friday.day})"> 
					<i class="fa fa-check"></i>
					</a>
				</div>
				</td>
    		</c:when>  
    		<c:when test="${week.friday.active == 'A'}">
    			<td width='21' valign='top'>
    			<a href="getlabslots.htm?day=${week.friday.day}" class='green' title='Please click to view bookings'>${week.friday.day}</a>  
    			<a href="javascript:void(0)" class="js-active_day_slot" onclick="confirmBlock(${week.friday.day})" >
                  <i class="fa fa-times" title="Block day"></i>
                </a>
                </td>
    		</c:when>
    	</c:choose>
    	<c:choose>
    	<c:when test="${week.saturday == null || week.saturday.active == 'P'}">
    			<td width='21' valign='top' class='past'>${week.saturday.day}</td>
    		</c:when>
    		<c:when test="${week.saturday.active == 'B'}">
    			<td width='21' valign='top' class='past'>
    			${week.saturday.day}
    			<div style="height: 10px;margin-top: -16px;">
					<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.saturday.day})"  title="Active this day"> 
					<i class="fa fa-check"></i>
					</a>
				</div>
				</td>
    		</c:when>  
    		<c:when test="${week.saturday.active == 'A'}">
    			<td width='21' valign='top'>
    			<a href="getlabslots.htm?day=${week.saturday.day}" class='green' title='Please click to view bookings'>${week.saturday.day}</a>  
    			<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.saturday.day})" > 
                  <i class="fa fa-times" title="Block day"></i>
                </a>
                </td>
    		</c:when>
    	</c:choose>
    	<c:choose>
    	<c:when test="${week.sunday == null || week.sunday.active == 'P'}">
    			<td width='21' valign='top' class='past'>${week.sunday.day}</td>
    		</c:when>
    		<c:when test="${week.sunday.active == 'B'}">
    			<td width='21' valign='top' class='past'>
    			${week.sunday.day}
    			<div style="height: 10px;margin-top: -16px;">
					<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.sunday.day})"  title="Active this day"> 
					<i class="fa fa-check"></i>
					</a>
				</div>
				</td>
    		</c:when>  
    		<c:when test="${week.sunday.active == 'A'}">
    			<td width='21' valign='top'>
    			<a href="getlabslots.htm?day=${week.sunday.day}" class='green' title='Please click to view bookings'>${week.sunday.day}</a>  
    			<a href="javascript:void(0);" class="js-active_day_slot" onclick="confirmBlock(${week.sunday.day})" > 
                  <i class="fa fa-times" title="Block day"></i>
                </a>
                </td>
    		</c:when>
    	</c:choose>
    	</tr>
    
    </c:forEach>
    <tr></tr>
    </table>
	</div>
	<!-- Close outer_calendar DIV -->
	<div class="modal fade" id="message-popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
        <h4 class="modal-title" id="myModalLabel">Confirm</h4>
      </div>
      <div class="modal-body" id="msg_body">
      </div>
      <div class="modal-footer">
      	<form action="<%=Constants.BLOCK_DATE_GET_URL %>">
      		<input type="hidden" name="day" id="blockDay">
      		<input type="hidden" name="labView" id="" value="${labView}">
        	<button type="submit" class="btn btn-default classControlWrapper"  id="clickYes">Yes</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </form>
      </div>
    </div>
  </div>
</div>
</div>
<script type="text/javascript">

function confirmBlock(day) {
	$("#blockDay").val(day);
	$("#message-popup").modal('show');
	
}

function confirmActivate(day) {
	$("#blockDay").val(day);
}

</script>

</body>
</html>