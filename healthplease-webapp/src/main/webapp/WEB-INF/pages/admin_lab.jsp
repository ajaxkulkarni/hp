
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     <title>Admin Lab | HealthPlease.in</title>
     <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>">
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
        <div id="msg" class="container">
        	<c:if test="${result == 'OK'}">
        		<div class="alert alert-success">
        			Record updated successfully!
        		</div>
        	</c:if>	
        	<c:if test="${result != 'OK' && result != null}">
        		<div class="alert alert-danger">
        			${result}
        		</div>
        	</c:if>
        </div>


<!--Add user start from here-->
<div class="container" id="addUser" name="addUser" ng-app="labsApp">
  <div class="row">
      <%@include file="admin_header.jsp" %> 
      
          <div class="col-lg-9 col-md-9">
      <div class="clearfix"></div>

<div id="msg" class="container"></div>

<div class="" id="div_add">
    <a id="addNewLab" href="javascript:void(0);" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Add New Lab</a>
	<br/>
	Upload Test Labs :
	<form action="<%=Constants.ADMIN_UPLOAD_TEST_LABS_POST_URL %>" method="post" enctype="multipart/form-data">
		<input type="file" id="file" name="file" placeholder="Search"/>
		<br/>
		<button type="submit" class="btn btn-large btn-info"><i class="glyphicon glyphicon-plus"></i> &nbsp; Upload</button>
	</form>
</div>

<div class="clearfix"></div><br />
<!--Main div where content get loaded-->
<div class="" id="loadUser" name="loadUser">

</div>    
<!--Paging div will get content soon-->
<div class="" id="pagination">
  <table class="table table-bordered table-responsive">
    <tbody><tr>
        <td colspan="7" align="center">
            <div class="pagination-wrap">
               <form class="form-inline ng-pristine ng-valid">
                            <div class="form-group">
                                    <label>Search</label>
                                    <input class="form-control ng-pristine ng-valid" placeholder="Search" type="text">
                            </div><br>
                            <div id="upload_error" class="form-group" style="display:none;">
                            </div>
                   
                    </form>
                    <table class="table table-striped table-hover">
                            <thead>
                                    <tr>
                                    		<th>Sr. No.
                                            </th>
                                            <th>Lab Id
                                            </th>
                                            <th>Lab Name
                                            </th>
                                            <!-- <th>Lab Location
                                            </th> -->
                                            <th>Associate Location
                                            	<span class="glyphicon sort-icon" ></span>
                                            </th>
                                            <th>Lab Email
                                            </th>
                                            <th>Lab Contact
                                            </th>
                                            <th>Lab Address
                                            </th>
                                            <th>Lab Discount
                                            </th>
                                            <th>Lab Users
                                            </th>
                                            <th>Action
                                            </th>
                                    </tr>
                            </thead>
                            <tbody>
                        <c:forEach items="${labs}" var="lab" varStatus="i">
                         <tr>
                         <form action="<%=Constants.ADMIN_EDIT_LAB_POST_URL%>" method="post">
                        <td>${i.index + 1}</td>
                        <td>${lab.id}</td>
                        <td id="labNameT${lab.id}">${lab.name}</td>
                        <td id="labAreaT${lab.id}">${lab.area.name}</td>
                        <td id="labEmailT${lab.id}">${lab.email}</td>
                        <td id="labPhoneT${lab.id}">${lab.contact}</td>
                        <td id="labAddrT${lab.id}">${lab.address}</td>
                        <td id="labDiscountT${lab.id}">${lab.discount}</td>
                        <td id="labUsersT${lab.id}">
                        	<c:forEach items="${lab.users}" var="user">
                        		${user.email},
                        	</c:forEach>
                        </td>
                        <td id="labName${lab.id}" style="display:none">
                        	<input type="hidden" name="id" value="${lab.id}"/>
                        	<input type="text" name="name" value="${lab.name}"/>
                        </td>
                        <td id="labArea${lab.id}" style="display:none">
                        	<select name="area.id">
                        		<option value="${lab.area.id}" selected>${lab.area.name}</option>
                        		<c:forEach items="${locations}" var="loc">
                        			<option value="${loc.id}">${loc.name}</option>
                        		</c:forEach>
                        	</select>
                        </td>
                        
                        <td id="labEmail${lab.id}" style="display:none"><input type="text" name="email" value="${lab.email}"/></td>
                        <td id="labPhone${lab.id}" style="display:none"><input type="text" name="contact" value="${lab.contact}"/></td>
                        <td id="labAddr${lab.id}" style="display:none"><input type="text" name="address" value="${lab.address}"/></td>
                        <td id="labDiscount${lab.id}" style="display:none"><input type="text" name="discount" value="${lab.discount}"/></td>
                        <td id="labUsers${lab.id}" style="display:none">
                        	<input type="text" name="labUsers" value="<c:forEach items="${lab.users}" var="user">${user.email},</c:forEach>"/>
                        </td>
                        <td id="labEdit${lab.id}" style="display:none"><button type="submit" class="btn btn-large btn-info">Save</button></td>
                        </form>
                        <td id="labEditT${lab.id}" class="ng-scope">
                            <button class="btn btn-large btn-info" onclick="editButtons(${lab.id})">Edit</button>
                            <a href="<%=Constants.ADMIN_MAP_LAB_LOCATIONS_GET_URL%>?labId=${lab.id}" class="btn btn-large btn-warning">Service Locations</a>
                            <a href="<%=Constants.ADMIN_LAB_TESTS_GET_URL%>?labId=${lab.id}" class="btn btn-large btn-warning">Tests</a>
                            <button class="btn btn-large btn-warning" onclick="addUser(${lab.id})">Add User</button>
                        </td>
                        </tr>
                        </c:forEach>
                     </tbody>
                    </table> 
                    <input type="hidden" id="previousLabId">
                    <div id="labPagination"><ul class="pagination"><li><a href="javascript:void(0);" ng-click="showPageData(1)" data-page_no="1" style="color:red;" class="js-pageDisplay">1</a></li></ul></div>
               
            </div>
        </td>
    </tr>
    </tbody></table>
                    <div id="labPagination"></div>
                <!--
                    <dir-pagination-controls
                            max-size="5"
                            direction-links="true"
                            boundary-links="true">
                    </dir-pagination-controls>-->
                     <script type="text/ng-template" id="display">
                        <td>{{lab.id}}</td>
                        <td>{{lab.lab_name}}</td>
                        <td>{{lab.location_name}}</td>
                        <td>{{lab.lab_email}}</td>
                        <td>{{lab.mobile_no}}</td>
                        <td>{{lab.address}}</td>
                        <td>
                            <button ng-click="editLab(lab)" class="btn btn-large btn-info">Edit</button>
                            <button ng-click="editAssociativeLocation(lab)" class="btn btn-large btn-warning">Service Locations</button>
                            <button ng-click="editAssociativeUsers(lab)" data-target="#myLabServiceUserModal" data-toggle="modal" class="btn btn-large btn-warning">Add User</button>
                        </td>
                     </script>
                     
                     <!-- In edit mode section -->
                    <script type="text/ng-template" id="edit">
                       
                        <td><input type="text" ng-model="labs.selected.id" name="id" readonly/></td>
                        <td><input type="text" ng-model="labs.selected.lab_name" name="lab_name"/></td>
                        <td><select id="idLocation" class="form-control" ng-model="labs.selected.lab_location_id" name="lab_location_id">
                            <option value='select'>Select Your Location</option>
                            <option value=7>&nbsp;&nbsp;Vishrantwadi</option><option value=8>&nbsp;&nbsp;Viman Nagar</option><option value=9>&nbsp;&nbsp;Shastri Nagar</option><option value=10>&nbsp;&nbsp;Kalyani Nagar</option><option value=11>&nbsp;&nbsp;Koregaon Park</option><option value=12>&nbsp;&nbsp;Koregaon Park ext.</option><option value=13>&nbsp;&nbsp;Tingre Nagar</option><option value=14>&nbsp;&nbsp;Dhanori</option><option value=15>&nbsp;&nbsp;Phule Nagar</option><option value=16>&nbsp;&nbsp;Bund Garden Road</option><option value=17>&nbsp;&nbsp;Dhole Patil Road</option><option value=18>&nbsp;&nbsp;Mangaldas Road</option><option value=19>&nbsp;&nbsp;Naylor Road</option><option value=20>&nbsp;&nbsp;Kondhwa</option><option value=21>&nbsp;&nbsp;Uday Baug</option><option value=22>&nbsp;&nbsp;Camp</option><option value=23>&nbsp;&nbsp;Mundhwa</option><option value=24>&nbsp;&nbsp;B T Kawade Road</option><option value=25>&nbsp;&nbsp;Wadgaonsheri</option><option value=26>&nbsp;&nbsp;Yerwada</option><option value=27>&nbsp;&nbsp;Chandan Nagar</option><option value=28>&nbsp;&nbsp;Kharadi</option><option value=29>&nbsp;&nbsp;Magarpatta</option><option value=30>&nbsp;&nbsp;Amanora</option><option value=31>&nbsp;&nbsp;Wagholi</option><option value=32>&nbsp;&nbsp;Hadapsar</option><option value=33>&nbsp;&nbsp;Keshav Nagar</option><option value=34>&nbsp;&nbsp;Deccan</option><option value=35>&nbsp;&nbsp;Lohegaon</option><option value=36>&nbsp;&nbsp;Dighi</option><option value=37>&nbsp;&nbsp;Manjari</option><option value=38>&nbsp;&nbsp;Aundh</option><option value=39>&nbsp;&nbsp;Baner</option><option value=40>&nbsp;&nbsp;Shivaji Nagar</option><option value=41>&nbsp;&nbsp;Bhosale Nagar</option><option value=42>&nbsp;&nbsp;Kothrud</option><option value=43>&nbsp;&nbsp;Pashan</option><option value=44>&nbsp;&nbsp;Pimpri</option><option value=45>&nbsp;&nbsp;Chinchwad</option><option value=46>&nbsp;&nbsp;Pimpale Saudagar</option><option value=47>&nbsp;&nbsp;Pimpale Nilakh</option><option value=48>&nbsp;&nbsp;Pimpale Gurav</option><option value=49>&nbsp;&nbsp;Boat Club Road</option><option value=50>&nbsp;&nbsp;Sus Road</option><option value=51>&nbsp;&nbsp;Balewadi</option><option value=52>&nbsp;&nbsp;Bavdhan</option><option value=53>&nbsp;&nbsp;Hinjewadi Phase 1</option><option value=54>&nbsp;&nbsp;Hinjewadi Phase 2</option><option value=55>&nbsp;&nbsp;Rahatani</option><option value=56>&nbsp;&nbsp;Wakad</option><option value=57>&nbsp;&nbsp;Sangvi</option><option value=58>&nbsp;&nbsp;Khadki</option><option value=59>&nbsp;&nbsp;Hinjewadi Phase 3</option>                          </select>
                        </td>
                        <td><input type="text" ng-model="labs.selected.lab_email" name="lab_email"/></td>
                        <td><input type="text" ng-model="labs.selected.mobile_no" name="mobile_no"/></td>
                        <td><input type="text" ng-model="labs.selected.address" name="address"/></td>
                        <td>
                            <button id="saveLab" ng-click="saveLab($index)" class="btn btn-large btn-info">Save</button>
                            <button ng-click="reset()" class="btn btn-large btn-danger">Cancel</button>
                        </td>
                    </script>
           
        </td>
    </tr>
    </table>    </div> 
</div>
<script src="js/external/angular/angular.js"></script>
<script src="js/external/angular/pagination/dirPagination.js"></script>
<script src="js/internal/angular/admin-labs.js?ver="4035></script>

<script src="js/external/select2/select2.min.js"></script>

   
       

<!--Add user start from here
<div class="" id="addUser" name="addUser">

<form method='post' id="form_add_user" action="locationController.php">
 
    <table class='table table-bordered'>
 
        <tr>
            <td>Location Name</td>
            <input type='hidden' name='id' id="id" class='form-control' value="">
            <td><input type='text' name='location_name' id='location_name' class='form-control' value="" required ></td>
        </tr>
 
        <tr>
       
        <td colspan="2">
            <div id="submituser" class="pull-left">
               <button type="button" class="btn btn-primary" name="btn-save" id="submit">
                   <span class="glyphicon glyphicon-plus"></span> Create New Record
               </button>  
                <a href="location.php" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; Back to index</a>
            </div>
            <div id="edituser" class="pull-left">
                &nbsp;<button type="button" class="btn btn-primary" name="btn-update" id="btn-update">
                <span class="glyphicon glyphicon-edit"></span>  Update this Record
                </button>
                <a href="location.php" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; CANCEL</a>
            </div> 
        
        </td>
            
         
         
        </tr>
 
    </table>
</form>
</div> -->
    </div> 
  </div>      
</div>
        <!-- /#page-wrapper -->
<script>
$(document).ready(function(){
        $( "#idLocationService" ).select2( {
            placeholder: "Please select your test/s"
        });
        
       $( "#idUserService" ).select2( {
            placeholder: "Please select user to associate with lab"
        });
        
         $( "#idLocation" ).select2( {
            placeholder: "Please select lab address"
        }); 


      $("#idLocationService").select2({ width: 'resolve' });       
      $("#idUserService").select2({ width: 'resolve' });   
      $("#idLocation").select2({ width: 'resolve' });  
       
        $("#addNewLab").click(function(){
//            var $this = $( this );
//            var test_id = $this.data('value');
//            /******
//             * deletion is start from here 
//             */ 
//            $.ajax({
//                     type:"POST",
//                     url:'testController.php',
//                     data:"action=getTestDetails&test_id="+test_id,//only input,//only input
//                     success: function(response){
//                        $("#modal_body").html(response);
//                        $("#modal_head").html( $("#test_head").val() );
//                     }
//            });
//
            $("#myLabModal").modal('show');

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
                    <form id="upload_form_lab" class="classMIBodyWrapper" action="<%=Constants.ADMIN_EDIT_LAB_POST_URL %>" method="post">
                        <div class="form-group">
                            <label for="call_back_name" class="classGColor">Name</label>
                            <div  class="input-group width100"><input type="text" class="form-control" id="call_back_name" name="name" placeholder="Name"></div>
                        </div>
                        <!-- <div class="form-group width100">
                            <label for="call_back_number" class="classGColor">Lab Location</label><br/>
                            <select id="idLocation" class="width100" name="lab_location_id">
                                <option value='select'>Select Your Location</option>
                                <option value=7>&nbsp;&nbsp;Vishrantwadi</option><option value=8>&nbsp;&nbsp;Viman Nagar</option><option value=9>&nbsp;&nbsp;Shastri Nagar</option><option value=10>&nbsp;&nbsp;Kalyani Nagar</option><option value=11>&nbsp;&nbsp;Koregaon Park</option><option value=12>&nbsp;&nbsp;Koregaon Park ext.</option><option value=13>&nbsp;&nbsp;Tingre Nagar</option><option value=14>&nbsp;&nbsp;Dhanori</option><option value=15>&nbsp;&nbsp;Phule Nagar</option><option value=16>&nbsp;&nbsp;Bund Garden Road</option><option value=17>&nbsp;&nbsp;Dhole Patil Road</option><option value=18>&nbsp;&nbsp;Mangaldas Road</option><option value=19>&nbsp;&nbsp;Naylor Road</option><option value=20>&nbsp;&nbsp;Kondhwa</option><option value=21>&nbsp;&nbsp;Uday Baug</option><option value=22>&nbsp;&nbsp;Camp</option><option value=23>&nbsp;&nbsp;Mundhwa</option><option value=24>&nbsp;&nbsp;B T Kawade Road</option><option value=25>&nbsp;&nbsp;Wadgaonsheri</option><option value=26>&nbsp;&nbsp;Yerwada</option><option value=27>&nbsp;&nbsp;Chandan Nagar</option><option value=28>&nbsp;&nbsp;Kharadi</option><option value=29>&nbsp;&nbsp;Magarpatta</option><option value=30>&nbsp;&nbsp;Amanora</option><option value=31>&nbsp;&nbsp;Wagholi</option><option value=32>&nbsp;&nbsp;Hadapsar</option><option value=33>&nbsp;&nbsp;Keshav Nagar</option><option value=34>&nbsp;&nbsp;Deccan</option><option value=35>&nbsp;&nbsp;Lohegaon</option><option value=36>&nbsp;&nbsp;Dighi</option><option value=37>&nbsp;&nbsp;Manjari</option><option value=38>&nbsp;&nbsp;Aundh</option><option value=39>&nbsp;&nbsp;Baner</option><option value=40>&nbsp;&nbsp;Shivaji Nagar</option><option value=41>&nbsp;&nbsp;Bhosale Nagar</option><option value=42>&nbsp;&nbsp;Kothrud</option><option value=43>&nbsp;&nbsp;Pashan</option><option value=44>&nbsp;&nbsp;Pimpri</option><option value=45>&nbsp;&nbsp;Chinchwad</option><option value=46>&nbsp;&nbsp;Pimpale Saudagar</option><option value=47>&nbsp;&nbsp;Pimpale Nilakh</option><option value=48>&nbsp;&nbsp;Pimpale Gurav</option><option value=49>&nbsp;&nbsp;Boat Club Road</option><option value=50>&nbsp;&nbsp;Sus Road</option><option value=51>&nbsp;&nbsp;Balewadi</option><option value=52>&nbsp;&nbsp;Bavdhan</option><option value=53>&nbsp;&nbsp;Hinjewadi Phase 1</option><option value=54>&nbsp;&nbsp;Hinjewadi Phase 2</option><option value=55>&nbsp;&nbsp;Rahatani</option><option value=56>&nbsp;&nbsp;Wakad</option><option value=57>&nbsp;&nbsp;Sangvi</option><option value=58>&nbsp;&nbsp;Khadki</option><option value=59>&nbsp;&nbsp;Hinjewadi Phase 3</option>                              </select>
                        </div> -->
                        <div class="form-group">
                            <label for="call_back_email" class="classGColor">Email</label>
                            <div  class="input-group width100"><input type="text" name="email" id="call_back_email" class="form-control" placeholder="Email" required></div>
                        </div>  
                         <div class="form-group">
                            <label for="call_back_email" class="classGColor">Location Contact(Separate by , if multiple 10 digit each)</label>
                            <div  class="input-group width100"><input type="text" name="contact" id="call_back_email" class="form-control" placeholder="Contact" required></div>
                        </div> 
                         <div class="form-group">
                            <label for="call_back_email" class="classGColor">Location Address</label>
                            <div  class="input-group width100"><textarea type="text" name="address" id="call_back_email" class="form-control" placeholder="Address" required></textarea></div>
                        </div> 
                        <button type="submit" id="request_form_lab" class="btn btn-primary">Submit</button>
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
                    <h4 class="modal-title" id="modal_head">Add User</h4>
                </div>
                <div class="modal-body" id="modal_body">
                     <div id="usr_err" class="form-group" style="display:none;"></div>
                    <form id="user_form_lab" class="classMIBodyWrapper" action="<%=Constants.ADMIN_EDIT_LAB_USERS_POST_URL %>" method="post">
                        <div class="form-group">
                            <label for="call_back_name" class="classGColor" id="user_name_service"></label>
                        </div>
                        <div class="form-group width100">
                            <label for="call_back_number" class="classGColor">User Emails : ${lab.users}</label><br/>
                            <input type="hidden" id="user_lab_id" name="id" value="">
                            <select id="idUserService" class="form-control width100" style="width:100%" name="userIds" multiple>
                            	<%-- <c:forEach items="${lab.users}" var="user">
                            		<option value="${user.email}" selected>&nbsp;&nbsp;${user.email}</option>
                            	</c:forEach> --%>
                            	<c:forEach items="${users}" var="user">
                            		<option value="${user.email}">${user.email}</option>
                            	</c:forEach>
                             </select>
                            </div>
                        <button type="submit" id="btn_user_lab" class="btn btn-primary">Update</button>
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

<script type="text/javascript">

function editButtons(labId) {
	
	var prev = $("#previousLabId").val();
	if(prev != null && prev != '') {
		$("#labNameT" + prev).show();
		$("#labAreaT" + prev).show();
		$("#labPhoneT" + prev).show();
		$("#labEmailT" + prev).show();
		$("#labAddrT" + prev).show();
		$("#labEditT" + prev).show();
		$("#labDiscountT" + prev).show();
		$("#labUsersT" + prev).show();
		
		$("#labName" + prev).hide();
		$("#labArea" + prev).hide();
		$("#labPhone" + prev).hide();
		$("#labEmail" + prev).hide();
		$("#labAddr" + prev).hide();
		$("#labDiscount" + prev).hide();
		$("#labUsers" + prev).hide();
		$("#labEdit" + prev).hide();
	}
	
	$("#labNameT" + labId).hide();
	$("#labAreaT" + labId).hide();
	$("#labPhoneT" + labId).hide();
	$("#labEmailT" + labId).hide();
	$("#labAddrT" + labId).hide();
	$("#labDiscountT" + labId).hide();
	$("#labUsersT" + labId).hide();
	$("#labEditT" + labId).hide();
	
	$("#labName" + labId).show();
	$("#labArea" + labId).show();
	$("#labPhone" + labId).show();
	$("#labEmail" + labId).show();
	$("#labAddr" + labId).show();
	$("#labDiscount" + labId).show();
	$("#labUsers" + labId).show();
	$("#labEdit" + labId).show();
	
	$("#previousLabId").val(labId);
}

function addUser(labId) {
	$("#user_lab_id").val(labId);
	
	
	$.ajax({
       	type : "POST",
           url : 'getLabUsers',
           dataType: 'json',
           data: "labId="+ labId,
           success : function(users) {
        	   var i = 0;
        	   var appendString = "";
        	   for(i = 0; i  < users.length; i++) {
        		   /* $('#idUserService').append(
        			        $("<option></option>")
        			          .attr("value", users[i].email)
        			          .attr("selected",true)
        			          .text(users[i].email)
        			    );  */   
        			    //var text1 = 'Two';
        			    $("#idUserService option").filter(function() {
        			        //may want to use $.trim in here
        			        return $(this).text() == users[i].email; 
        			    }).prop('selected', true);
        		   //appendString = appendString + "<option value='" + users[i].email + "' selected='selected'>" + users[i].email + "</option>";
        	   }
        	   //$('#idUserService').html($("#idUserService").html() + appendString);
        	   //$('#idUserService').val(users[0].email);
        	   //alert($('#idUserService').val());
        	   $("#myLabServiceUserModal").modal('show');
           }
        	   
           });
	
	//alert("Here!");
}

</script>
</body>

</html>

