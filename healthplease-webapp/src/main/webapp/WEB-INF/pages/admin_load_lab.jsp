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
    <title>Book online Pathology & Diagnostic Tests in Pune | HealthPlease.in</title>
   
</head>

<body>
<%@include file="user_header.jsp" %>


        <div class="classGoldenDivider"></div><link href="css/external/select2/select2.min.css" rel="stylesheet" >
<div class="classTopHeading">
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
<div class="container" id="addUser" name="addUser" ng-app="labsApp">
  <div class="row">
   <%@include file="admin_header.jsp" %> 
    <div class="col-lg-9 col-md-9">
      <div class="clearfix"></div>

<div id="msg" class="container"></div>

<div class="" id="div_add">
    <h3>Lab Listing</h3>
    <form action="<%=Constants.ADMIN_VIEW_LAB_DASHBOARD_POST_URL %>" method="post">
    <select id="lab" name="id">
     <option value="">Please Select One</option>
    <c:forEach items="${labs}" var="lab">
    	<option value="${lab.id}">${lab.name}</option>
    </c:forEach>
    </select>
   <!--  <a id="goToLab" href="javascript:void(0);" class="btn btn-large btn-info" id="add">&nbsp; Go To Lab Dashboard</a> -->
    <button id="goToLab" type="submit" class="btn btn-large btn-info" id="add">&nbsp; Go To Lab Dashboard</button>
    </form>
</div>

<div class="clearfix"></div><br />
<!--Main div where content get loaded-->
<div class="" id="loadUser" name="loadUser">

</div>    
<!--Paging div will get content soon-->
    </div> 
  </div>      
</div>
        <!-- /#page-wrapper -->
<script>
$(document).ready(function(){
       
        $("#goToLab").click(function(){
            var lab_id = $("#lab").val();
            window.location.href = 'lab-dashboard.php?lab_id='+lab_id;
        });

    });
</script>
<div id="myLabModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="modal_head">Add Labs</h4>
                </div>
                <div class="modal-body" id="modal_body">
                     <div id="err" class="form-group" style="display:none;"></div>
                    <form id="upload_form_lab" class="classMIBodyWrapper">
                        <div class="form-group">
                            <label for="call_back_name" class="classGColor">Name</label>
                            <div  class="input-group width100"><input type="text" class="form-control" id="call_back_name" name="lab_name" placeholder="Name"></div>
                        </div>
                        <div class="form-group width100">
                            <label for="call_back_number" class="classGColor">Lab Location</label><br/>
                            <select id="idLocation" class="width100" name="lab_location_id">
                                <option value='select'>Select Your Location</option>
                                <option value=7>&nbsp;&nbsp;Vishrantwadi</option><option value=8>&nbsp;&nbsp;Viman Nagar</option><option value=9>&nbsp;&nbsp;Shastri Nagar</option><option value=10>&nbsp;&nbsp;Kalyani Nagar</option><option value=11>&nbsp;&nbsp;Koregaon Park</option><option value=12>&nbsp;&nbsp;Koregaon Park ext.</option><option value=13>&nbsp;&nbsp;Tingre Nagar</option><option value=14>&nbsp;&nbsp;Dhanori</option><option value=15>&nbsp;&nbsp;Phule Nagar</option><option value=16>&nbsp;&nbsp;Bund Garden Road</option><option value=17>&nbsp;&nbsp;Dhole Patil Road</option><option value=18>&nbsp;&nbsp;Mangaldas Road</option><option value=19>&nbsp;&nbsp;Naylor Road</option><option value=20>&nbsp;&nbsp;Kondhwa</option><option value=21>&nbsp;&nbsp;Uday Baug</option><option value=22>&nbsp;&nbsp;Camp</option><option value=23>&nbsp;&nbsp;Mundhwa</option><option value=24>&nbsp;&nbsp;B T Kawade Road</option><option value=25>&nbsp;&nbsp;Wadgaonsheri</option><option value=26>&nbsp;&nbsp;Yerwada</option><option value=27>&nbsp;&nbsp;Chandan Nagar</option><option value=28>&nbsp;&nbsp;Kharadi</option><option value=29>&nbsp;&nbsp;Magarpatta</option><option value=30>&nbsp;&nbsp;Amanora</option><option value=31>&nbsp;&nbsp;Wagholi</option><option value=32>&nbsp;&nbsp;Hadapsar</option><option value=33>&nbsp;&nbsp;Keshav Nagar</option><option value=34>&nbsp;&nbsp;Deccan</option><option value=35>&nbsp;&nbsp;Lohegaon</option><option value=36>&nbsp;&nbsp;Dighi</option><option value=37>&nbsp;&nbsp;Manjari</option><option value=38>&nbsp;&nbsp;Aundh</option><option value=39>&nbsp;&nbsp;Baner</option><option value=40>&nbsp;&nbsp;Shivaji Nagar</option><option value=41>&nbsp;&nbsp;Bhosale Nagar</option><option value=42>&nbsp;&nbsp;Kothrud</option><option value=43>&nbsp;&nbsp;Pashan</option><option value=44>&nbsp;&nbsp;Pimpri</option><option value=45>&nbsp;&nbsp;Chinchwad</option><option value=46>&nbsp;&nbsp;Pimpale Saudagar</option><option value=47>&nbsp;&nbsp;Pimpale Nilakh</option><option value=48>&nbsp;&nbsp;Pimpale Gurav</option><option value=49>&nbsp;&nbsp;Boat Club Road</option><option value=50>&nbsp;&nbsp;Sus Road</option><option value=51>&nbsp;&nbsp;Balewadi</option><option value=52>&nbsp;&nbsp;Bavdhan</option><option value=53>&nbsp;&nbsp;Hinjewadi Phase 1</option><option value=54>&nbsp;&nbsp;Hinjewadi Phase 2</option><option value=55>&nbsp;&nbsp;Rahatani</option><option value=56>&nbsp;&nbsp;Wakad</option><option value=57>&nbsp;&nbsp;Sangvi</option><option value=58>&nbsp;&nbsp;Khadki</option><option value=59>&nbsp;&nbsp;Hinjewadi Phase 3</option>                              </select>
                        </div>
                        <div class="form-group">
                            <label for="call_back_email" class="classGColor">Location Detail</label>
                            <div  class="input-group width100"><input type="text" name="lab_details" id="call_back_email" class="form-control" placeholder="Email" required></div>
                        </div>    
                        <button type="button" id="request_form_lab" class="btn btn-primary">Submit</button>
	                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                    </form>
                    <p class="text-warning"><small></small></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-danger" data-dismiss="modal">Close</button>
                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                </div>
            </div>
        </div>
</div>

<div id="myLabServiceLocationModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="modal_head">Add Service Location</h4>
                </div>
                <div class="modal-body" id="modal_body">
                     <div id="ser_err" class="form-group" style="display:none;"></div>
                    <form id="service_form_lab" class="classMIBodyWrapper">
                        <div class="form-group">
                            <label for="call_back_name" class="classGColor" id="lab_name_service"></label>
                        </div>
                        <div class="form-group">
                            <label for="call_back_number" class="classGColor">Service Location/s</label><br/>
                            <input type="hidden" id="lab_id" name="lab_id" value="">
                            <select id="idLocationService" class="form-control" name="service_location_ids[]" multiple>
                                <option value=7>&nbsp;&nbsp;Vishrantwadi</option><option value=8>&nbsp;&nbsp;Viman Nagar</option><option value=9>&nbsp;&nbsp;Shastri Nagar</option><option value=10>&nbsp;&nbsp;Kalyani Nagar</option><option value=11>&nbsp;&nbsp;Koregaon Park</option><option value=12>&nbsp;&nbsp;Koregaon Park ext.</option><option value=13>&nbsp;&nbsp;Tingre Nagar</option><option value=14>&nbsp;&nbsp;Dhanori</option><option value=15>&nbsp;&nbsp;Phule Nagar</option><option value=16>&nbsp;&nbsp;Bund Garden Road</option><option value=17>&nbsp;&nbsp;Dhole Patil Road</option><option value=18>&nbsp;&nbsp;Mangaldas Road</option><option value=19>&nbsp;&nbsp;Naylor Road</option><option value=20>&nbsp;&nbsp;Kondhwa</option><option value=21>&nbsp;&nbsp;Uday Baug</option><option value=22>&nbsp;&nbsp;Camp</option><option value=23>&nbsp;&nbsp;Mundhwa</option><option value=24>&nbsp;&nbsp;B T Kawade Road</option><option value=25>&nbsp;&nbsp;Wadgaonsheri</option><option value=26>&nbsp;&nbsp;Yerwada</option><option value=27>&nbsp;&nbsp;Chandan Nagar</option><option value=28>&nbsp;&nbsp;Kharadi</option><option value=29>&nbsp;&nbsp;Magarpatta</option><option value=30>&nbsp;&nbsp;Amanora</option><option value=31>&nbsp;&nbsp;Wagholi</option><option value=32>&nbsp;&nbsp;Hadapsar</option><option value=33>&nbsp;&nbsp;Keshav Nagar</option><option value=34>&nbsp;&nbsp;Deccan</option><option value=35>&nbsp;&nbsp;Lohegaon</option><option value=36>&nbsp;&nbsp;Dighi</option><option value=37>&nbsp;&nbsp;Manjari</option><option value=38>&nbsp;&nbsp;Aundh</option><option value=39>&nbsp;&nbsp;Baner</option><option value=40>&nbsp;&nbsp;Shivaji Nagar</option><option value=41>&nbsp;&nbsp;Bhosale Nagar</option><option value=42>&nbsp;&nbsp;Kothrud</option><option value=43>&nbsp;&nbsp;Pashan</option><option value=44>&nbsp;&nbsp;Pimpri</option><option value=45>&nbsp;&nbsp;Chinchwad</option><option value=46>&nbsp;&nbsp;Pimpale Saudagar</option><option value=47>&nbsp;&nbsp;Pimpale Nilakh</option><option value=48>&nbsp;&nbsp;Pimpale Gurav</option><option value=49>&nbsp;&nbsp;Boat Club Road</option><option value=50>&nbsp;&nbsp;Sus Road</option><option value=51>&nbsp;&nbsp;Balewadi</option><option value=52>&nbsp;&nbsp;Bavdhan</option><option value=53>&nbsp;&nbsp;Hinjewadi Phase 1</option><option value=54>&nbsp;&nbsp;Hinjewadi Phase 2</option><option value=55>&nbsp;&nbsp;Rahatani</option><option value=56>&nbsp;&nbsp;Wakad</option><option value=57>&nbsp;&nbsp;Sangvi</option><option value=58>&nbsp;&nbsp;Khadki</option><option value=59>&nbsp;&nbsp;Hinjewadi Phase 3</option>                              </select>
                        </div>
                        <button type="button" id="btn_service_form_lab" class="btn btn-primary">Update</button>
	                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                    </form>
                    <p class="text-warning"><small></small></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                </div>
            </div>
        </div>
</div>

<div id="myLabServiceUserModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="modal_head">Add Service Location</h4>
                </div>
                <div class="modal-body" id="modal_body">
                     <div id="usr_err" class="form-group" style="display:none;"></div>
                    <form id="user_form_lab" class="classMIBodyWrapper">
                        <div class="form-group">
                            <label for="call_back_name" class="classGColor" id="user_name_service"></label>
                        </div>
                        <div class="form-group width100">
                            <label for="call_back_number" class="classGColor">User Emails</label><br/>
                            <input type="hidden" id="user_lab_id" name="user_lab_id" value="">
                            <select id="idUserService" class="form-control width100" name="user_ids[]" multiple>
                                <option value=1>&nbsp;&nbsp;vikas.sharma6572@gmail.com</option><option value=2>&nbsp;&nbsp;bharwani.yash@gmail.com</option><option value=3>&nbsp;&nbsp;laxmikantkillekar@gmail.com</option><option value=5>&nbsp;&nbsp;jain_akhil1988@yahoo.com</option><option value=6>&nbsp;&nbsp;vibhormalviya@gmail.com</option><option value=7>&nbsp;&nbsp;nslsdksdjsddjcbdcbl@gmail.com</option><option value=8>&nbsp;&nbsp;yash.bharwani@healthplease.in</option><option value=9>&nbsp;&nbsp;tastymealindia@gmail.com</option><option value=10>&nbsp;&nbsp;monika01bhargava@yahoo.com</option><option value=11>&nbsp;&nbsp;luckyabhisek2@gmail.com</option><option value=12>&nbsp;&nbsp;akshaywega@gmail.com</option><option value=13>&nbsp;&nbsp;sales@shatkone.com</option><option value=14>&nbsp;&nbsp;care@healthplease.in</option><option value=15>&nbsp;&nbsp;rajpune12345agopal_iyengar@rediffmail.com</option><option value=16>&nbsp;&nbsp;ankushnikampune@gmail.com</option><option value=17>&nbsp;&nbsp;pavan4pf@gmail.com</option><option value=18>&nbsp;&nbsp;ingle.vijayshree@gmail.com</option><option value=19>&nbsp;&nbsp;hiteshambwani@gmail.com</option><option value=20>&nbsp;&nbsp;samirr@gmail.com</option><option value=21>&nbsp;&nbsp;nmkalyaninagar@gmail.com</option><option value=22>&nbsp;&nbsp;hemantcpawar7@gmail.com</option><option value=23>&nbsp;&nbsp;Vijay1.Singh@paytm.Com</option><option value=24>&nbsp;&nbsp;amol.pujari@hager.co.in</option><option value=25>&nbsp;&nbsp;nachare.reena8@gmail.com</option><option value=26>&nbsp;&nbsp;reena.nachare@scispl.com</option><option value=27>&nbsp;&nbsp;dhananjay.pawar@scispl.com</option><option value=28>&nbsp;&nbsp;pallavi.tangle@gmail.com</option><option value=29>&nbsp;&nbsp;asikchi@gmail.com</option><option value=30>&nbsp;&nbsp;debarshi.chakraborty@outlook.com</option><option value=31>&nbsp;&nbsp;dhodia_ramesh@rediffmail.com</option><option value=32>&nbsp;&nbsp;dhanashreetawhare@gmail.com</option><option value=33>&nbsp;&nbsp;tawharedhanashree@gmail.com</option><option value=34>&nbsp;&nbsp;pandu.n.09@gmail.com</option><option value=35>&nbsp;&nbsp;shwk86@yahoo.com</option><option value=36>&nbsp;&nbsp;harshadmathure@gmail.com</option><option value=37>&nbsp;&nbsp;mathurepallavi@gmail.com</option><option value=38>&nbsp;&nbsp;a.abhinab@outlook.com</option><option value=39>&nbsp;&nbsp;koreanand@gmail.com</option><option value=40>&nbsp;&nbsp;ankurdiagnostics@gmail.com</option><option value=41>&nbsp;&nbsp;saurabh.shelgaonkar@gmail.com</option><option value=42>&nbsp;&nbsp;shubhankarkanase@instamates.in</option><option value=43>&nbsp;&nbsp;ajinkyashiva@gmail.com</option><option value=44>&nbsp;&nbsp;toashishvarma@gmail.com</option><option value=45>&nbsp;&nbsp;jaemstijoe@yahoo.com</option><option value=46>&nbsp;&nbsp;augustripples@gmail.com</option><option value=47>&nbsp;&nbsp;info@primex-health.com</option><option value=48>&nbsp;&nbsp;koreanand@yahoo.com</option><option value=49>&nbsp;&nbsp;karanjkarkunal13@gmail.com</option><option value=50>&nbsp;&nbsp;ajinkyakulkarni1491@yahoo.com</option><option value=51>&nbsp;&nbsp;yash07cool@gmail.com</option><option value=52>&nbsp;&nbsp;patilnitin159@gmail.com</option><option value=53>&nbsp;&nbsp;benithisrael@hotmail.com</option><option value=54>&nbsp;&nbsp;crk_structural@gmail.com</option><option value=55>&nbsp;&nbsp;info@carefirstdiagnostics.com</option><option value=56>&nbsp;&nbsp;yogesh1990kore@gmail.com</option><option value=57>&nbsp;&nbsp;makarand.more@gmail.com</option>                              </select>
                        </div>
                        <button type="button" id="btn_user_lab" class="btn btn-primary">Update</button>
	                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                    </form>
                    <p class="text-warning"><small></small></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                </div>
            </div>
        </div>
</div>
</div>
    <!-- /#wrapper -->
<%@include file="user_footer.jsp" %>
</body>

</html>

