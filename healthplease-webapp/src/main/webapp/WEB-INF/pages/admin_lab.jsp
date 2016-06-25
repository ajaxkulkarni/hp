

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
    <a id="addNewLab" href="javascript:void(0);" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Add New Lab</a>
</div>

<div class="clearfix"></div><br />
<!--Main div where content get loaded-->
<div class="" id="loadUser" name="loadUser">

</div>    
<!--Paging div will get content soon-->
<div class="" id="pagination" ng-controller="labsController">
  <table class="table table-bordered table-responsive">
    <tbody><tr>
        <td colspan="7" align="center">
            <div class="pagination-wrap">
               <form class="form-inline ng-pristine ng-valid">
                            <div class="form-group">
                                    <label>Search</label>
                                    <input ng-model="search" class="form-control ng-pristine ng-valid" placeholder="Search" type="text">
                            </div><br>
                            <div id="upload_error" class="form-group" style="display:none;">
                            </div>
                   
                    </form>
                <form class="ng-pristine ng-valid" id="updateLab" name="updateLab">
                    <table class="table table-striped table-hover">
                            <thead>
                                    <tr>
                                            <th ng-click="sort('lab_name')">Lab Id
                                                    <span class="glyphicon sort-icon glyphicon-chevron-down" ng-show="sortKey=='lab_name'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                            </th>
                                            <th ng-click="sort('lab_name')">Lab Name
                                                    <span class="glyphicon sort-icon glyphicon-chevron-down" ng-show="sortKey=='lab_name'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                            </th>
                                            <th ng-click="sort('lab_details')">Lab Location
                                                    <span class="glyphicon sort-icon ng-hide glyphicon-chevron-down" ng-show="sortKey=='lab_details'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                            </th>
                                            <!--<th ng-click="">Associate Location
                                                    <span class="glyphicon sort-icon" ></span>
                                            </th>-->
                                            <th ng-click="sort('lab_details')">Lab Email
                                                <span class="glyphicon sort-icon ng-hide glyphicon-chevron-down" ng-show="sortKey=='lab_details'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                            </th>
                                            <th ng-click="sort('mobile_no')">Lab Contact
                                                <span class="glyphicon sort-icon ng-hide glyphicon-chevron-down" ng-show="sortKey=='mobile_no'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                            </th>
                                            <th ng-click="sort('address')">Lab Address
                                                <span class="glyphicon sort-icon ng-hide glyphicon-chevron-down" ng-show="sortKey=='address'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                            </th>
                                            <th>Action
                                                    <span class="glyphicon sort-icon ng-hide glyphicon-chevron-down" ng-show="sortKey=='hobby'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                            </th>
                                    </tr>
                            </thead>
                            <tbody>
                                <!-- ngRepeat: lab in labs.data |filter:search --><!-- ngInclude: getTemplate(lab) --><tr class="ng-scope" ng-repeat="lab in labs.data |filter:search" ng-include="getTemplate(lab)">
                        <td class="ng-scope ng-binding">1</td>
                        <td class="ng-scope ng-binding">Dhanwantari Path Lab</td>
                        <td class="ng-scope ng-binding">Kalyani Nagar</td>
                        <td class="ng-scope ng-binding">yash.bharwani@healthplease.in</td>
                        <td class="ng-scope ng-binding">919890733740</td>
                        <td class="ng-scope ng-binding"></td>
                        <td class="ng-scope">
                            <button ng-click="editLab(lab)" class="btn btn-large btn-info">Edit</button>
                            <button ng-click="editAssociativeLocation(lab)" class="btn btn-large btn-warning">Service Locations</button>
                            <button ng-click="editAssociativeUsers(lab)" data-target="#myLabServiceUserModal" data-toggle="modal" class="btn btn-large btn-warning">Add User</button>
                        </td>
                     </tr><!-- end ngRepeat: lab in labs.data |filter:search --><!-- ngInclude: getTemplate(lab) --><tr class="ng-scope" ng-repeat="lab in labs.data |filter:search" ng-include="getTemplate(lab)">
                        <td class="ng-scope ng-binding">3</td>
                        <td class="ng-scope ng-binding">N M Medical</td>
                        <td class="ng-scope ng-binding">Viman Nagar</td>
                        <td class="ng-scope ng-binding">abhishek@nmmedical.com,abhishektaukari@gmail.com,yash.bharwani@healthplease.in,nmkalyaninagar@gmail.com</td>
                        <td class="ng-scope ng-binding">919960261594,919921708567,918928724104,919158324445</td>
                        <td class="ng-scope ng-binding"></td>
                        <td class="ng-scope">
                            <button ng-click="editLab(lab)" class="btn btn-large btn-info">Edit</button>
                            <button ng-click="editAssociativeLocation(lab)" class="btn btn-large btn-warning">Service Locations</button>
                            <button ng-click="editAssociativeUsers(lab)" data-target="#myLabServiceUserModal" data-toggle="modal" class="btn btn-large btn-warning">Add User</button>
                        </td>
                     </tr><!-- end ngRepeat: lab in labs.data |filter:search --><!-- ngInclude: getTemplate(lab) --><tr class="ng-scope" ng-repeat="lab in labs.data |filter:search" ng-include="getTemplate(lab)">
                        <td class="ng-scope ng-binding">4</td>
                        <td class="ng-scope ng-binding">Agarwal's Pathology</td>
                        <td class="ng-scope ng-binding">Viman Nagar</td>
                        <td class="ng-scope ng-binding">sagarwal1284@gmail.com,sush440@yahoo.com,yash.bharwani@healthplease.in,ms007kurle@gmail.com,patilnitin159@gmail.com</td>
                        <td class="ng-scope ng-binding">919890733740,919890672605,919923924509,919762405482</td>
                        <td class="ng-scope ng-binding">Shop No.10</td>
                        <td class="ng-scope">
                            <button ng-click="editLab(lab)" class="btn btn-large btn-info">Edit</button>
                            <button ng-click="editAssociativeLocation(lab)" class="btn btn-large btn-warning">Service Locations</button>
                            <button ng-click="editAssociativeUsers(lab)" data-target="#myLabServiceUserModal" data-toggle="modal" class="btn btn-large btn-warning">Add User</button>
                        </td>
                     </tr><!-- end ngRepeat: lab in labs.data |filter:search --><!-- ngInclude: getTemplate(lab) --><tr class="ng-scope" ng-repeat="lab in labs.data |filter:search" ng-include="getTemplate(lab)">
                        <td class="ng-scope ng-binding">5</td>
                        <td class="ng-scope ng-binding">Ankur Pathology Lab</td>
                        <td class="ng-scope ng-binding">Kharadi</td>
                        <td class="ng-scope ng-binding">ankurdiagnostics@gmail.com,yash.bharwani@healthplease.in,salunkheajay1150@gmail.com</td>
                        <td class="ng-scope ng-binding">919890733740,91927121674,919673990461,919673990463,919158004291,9049003011</td>
                        <td class="ng-scope ng-binding">Shop No 13-20,Ground floor Durwankur Society, Ashoka Nagar, Kharadi, Pune, Maharashtra 411028</td>
                        <td class="ng-scope">
                            <button ng-click="editLab(lab)" class="btn btn-large btn-info">Edit</button>
                            <button ng-click="editAssociativeLocation(lab)" class="btn btn-large btn-warning">Service Locations</button>
                            <button ng-click="editAssociativeUsers(lab)" data-target="#myLabServiceUserModal" data-toggle="modal" class="btn btn-large btn-warning">Add User</button>
                        </td>
                     </tr><!-- end ngRepeat: lab in labs.data |filter:search --><!-- ngInclude: getTemplate(lab) --><tr class="ng-scope" ng-repeat="lab in labs.data |filter:search" ng-include="getTemplate(lab)">
                        <td class="ng-scope ng-binding">6</td>
                        <td class="ng-scope ng-binding">PrimeX Health</td>
                        <td class="ng-scope ng-binding">Dhanori</td>
                        <td class="ng-scope ng-binding">yash.bharwani@healthplease.in,info@primex-health.com</td>
                        <td class="ng-scope ng-binding">917798533318,919890733740</td>
                        <td class="ng-scope ng-binding">Kishan Kunj, S No. 52/52C, Ground Floor Bhairav Nagar, Dhanori Road, Pune - 411015</td>
                        <td class="ng-scope">
                            <button ng-click="editLab(lab)" class="btn btn-large btn-info">Edit</button>
                            <button ng-click="editAssociativeLocation(lab)" class="btn btn-large btn-warning">Service Locations</button>
                            <button ng-click="editAssociativeUsers(lab)" data-target="#myLabServiceUserModal" data-toggle="modal" class="btn btn-large btn-warning">Add User</button>
                        </td>
                     </tr><!-- end ngRepeat: lab in labs.data |filter:search --><!-- ngInclude: getTemplate(lab) --><tr class="ng-scope" ng-repeat="lab in labs.data |filter:search" ng-include="getTemplate(lab)">
                        <td class="ng-scope ng-binding">7</td>
                        <td class="ng-scope ng-binding">Care First</td>
                        <td class="ng-scope ng-binding">Aundh</td>
                        <td class="ng-scope ng-binding">asawari.manjarekar@gmail.com,yash.bharwani@healthplease.in,info@carefirstdiagnostics.com</td>
                        <td class="ng-scope ng-binding">919867159705,919890733740,917276060135</td>
                        <td class="ng-scope ng-binding">Unit 202, Shree Capital, Near KFC</td>
                        <td class="ng-scope">
                            <button ng-click="editLab(lab)" class="btn btn-large btn-info">Edit</button>
                            <button ng-click="editAssociativeLocation(lab)" class="btn btn-large btn-warning">Service Locations</button>
                            <button ng-click="editAssociativeUsers(lab)" data-target="#myLabServiceUserModal" data-toggle="modal" class="btn btn-large btn-warning">Add User</button>
                        </td>
                     </tr><!-- end ngRepeat: lab in labs.data |filter:search --><!-- ngInclude: getTemplate(lab) --><tr class="ng-scope" ng-repeat="lab in labs.data |filter:search" ng-include="getTemplate(lab)">
                        <td class="ng-scope ng-binding">8</td>
                        <td class="ng-scope ng-binding">DTH Labs</td>
                        <td class="ng-scope ng-binding">Pimpale Saudagar</td>
                        <td class="ng-scope ng-binding">yash.bharwani@healthplease.in,drkanasenikhil@gmail.com,info@dthclinic.com</td>
                        <td class="ng-scope ng-binding">919890733740,919665538833,919975122237</td>
                        <td class="ng-scope ng-binding">D-15, Ganesham, Level-4, Nashik Phata Road,Pimple Saudagar, Pune - 411027</td>
                        <td class="ng-scope">
                            <button ng-click="editLab(lab)" class="btn btn-large btn-info">Edit</button>
                            <button ng-click="editAssociativeLocation(lab)" class="btn btn-large btn-warning">Service Locations</button>
                            <button ng-click="editAssociativeUsers(lab)" data-target="#myLabServiceUserModal" data-toggle="modal" class="btn btn-large btn-warning">Add User</button>
                        </td>
                     </tr><!-- end ngRepeat: lab in labs.data |filter:search -->
                            </tbody>
                    </table> 
                    </form>
                    <div id="labPagination"><ul class="pagination"><li><a href="javascript:void(0);" ng-click="showPageData(1)" data-page_no="1" style="color:red;" class="js-pageDisplay">1</a></li></ul></div>
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
                            <label for="call_back_email" class="classGColor">Email</label>
                            <div  class="input-group width100"><input type="text" name="lab_details" id="call_back_email" class="form-control" placeholder="Email" required></div>
                        </div>  
                         <div class="form-group">
                            <label for="call_back_email" class="classGColor">Location Contact(Separate by , if multiple 10 digit each)</label>
                            <div  class="input-group width100"><input type="text" name="lab_contact" id="call_back_email" class="form-control" placeholder="Contact" required></div>
                        </div> 
                         <div class="form-group">
                            <label for="call_back_email" class="classGColor">Location Address</label>
                            <div  class="input-group width100"><textarea type="text" name="lab_address" id="call_back_email" class="form-control" placeholder="Address" required></textarea></div>
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

