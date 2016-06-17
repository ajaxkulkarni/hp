var app = angular.module('labsApp', ['angularUtils.directives.dirPagination']);

app.controller('labsController',function($scope, $http){
	$scope.labs = [];
        $http.post('labController.php?action=loadAll')
            .success(function(result, status, headers, config) {
                $scope.labs = { data : result , selected : {}};
        	$http.get("labController.php?action=labPagination").success(function(response){ 
                    $('#labPagination').html(response);
                    
                });
            // this callback will be called asynchronously
            // when the response is available
            })
            .error(function(data, status, headers, config) {
                alert(data);
                // called asynchronously if an error occurs
                // or server returns response with an error status.
              });
	
	$scope.sort = function(keyname){
		$scope.sortKey = keyname;   //set the sortKey to the param passed
		$scope.reverse = !$scope.reverse; //if true make it false and vice versa
	}
        
        // gets the template to ng-include for a table row / item
        $scope.getTemplate = function (lab) {
            if (lab.id === $scope.labs.selected.id) return 'edit';
            else return 'display';
        };
        
        $scope.editLab = function (lab) {
            $scope.labs.selected = angular.copy(lab);
        };
        
        $scope.editAssociativeLocation = function (lab) {
          //  $( ".select2.select2-container" ).addClass( "width100" );
            $("#myLabServiceLocationModal").modal('show');
            var selectedValues = new Array();
            var str  = lab.associate_location;
            selectedValues = str.split(",");
            if( selectedValues.length === 0 ) 
                $('#btn_service_form_lab').html("Add");
//            selectedValues[0] = 10;
//            selectedValues[1] = 11;
            $("#idLocationService").select2("val", selectedValues);
            $('#lab_name_service').html(lab.lab_name);
            $('#lab_id').val(lab.id);
        };
        
        $scope.editAssociativeUsers = function (lab) {
          //  $( ".select2.select2-container" ).addClass( "width100" );
          //  $("#myLabServiceLocationModal").modal('show');
            $('#user_lab_id').val(lab.id);
            var selectedValues = new Array();
            var str  = lab.associate_users;
            selectedValues = str.split(",");
            if( selectedValues.length === 0 ) 
                $('#btn_user_lab').html("Add");
//            selectedValues[0] = 10;
//            selectedValues[1] = 11;
            $("#idUserService").select2("val", selectedValues);
            $('#user_name_service').html(lab.lab_name);
        };
        
        $scope.saveLab = function (idx) {
            var form = $('#updateLab');console.log(form);
            $("#saveLab").html("<img src='images/loader.gif' width='25px'/>");
            $.ajax({
                url:'labController.php?action=updLab',
                data:form.serialize(),//only input
                type: 'POST',
                async: false,
                success: function ( data ) {
                    var obj = $.parseJSON( data );
                    $('#upload_error').show();
                    if ( 1 == obj.status ){
                        $("#saveLab").html("Save");
                        $('#upload_error').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                        $http.get("labController.php?action=loadAll&page=1").success(function(response){ 
                                $scope.labs = { data : response , selected : {}};
                        });
                        $http.get("labController.php?action=labPagination&page=1").success(function(response){ 
                            $('#labPagination').html(response);
                        });
                    } else {
                        $("#saveLab").html("Save");
                        $('#upload_error').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                    }
                }
             
            });
            $scope.labs.data[idx] = angular.copy($scope.labs.selected);
            $scope.reset();
        };

        $scope.reset = function () {
            $scope.labs.selected = {};
        };
        
       
       $(document).on('click', '.js-pageDisplay', function(){
            var page = $(this).data('page_no');    
            $http.get("labController.php?action=loadAll&page="+page).success(function(response){ 
                    $scope.labs = { data : response , selected : {}};
            });
            $http.get("labController.php?action=labPagination&page="+page).success(function(response){ 
                        $('#labPagination').html(response);
            });
       });
       
       
        $(document).on('click', '#request_form_lab', function(){
            var form = $('#upload_form_lab');
            $("#request_form").html("<img src='images/loader.gif' width='25px'/>");
            $.ajax({
                url:'labController.php?action=addLab',
                data:form.serialize(),//only input
                type: 'POST',
                async: false,
                success: function ( data ) {
                    var obj = $.parseJSON( data );
                    $('#err').show();
                    if ( 1 == obj.status ){
                        $("#request_form").html("Save");
                        $('#err').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                        $http.get("labController.php?action=loadAll&page=1").success(function(response){ 
                                $scope.labs = { data : response , selected : {}};
                        });
                        $http.get("labController.php?action=labPagination&page=1").success(function(response){ 
                            $('#labPagination').html(response);
                        });
                    } else {
                        $("#request_form").html("Save");
                        $('#err').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                    }
                }
             
            });   
       });
       
       $(document).on('click', '#btn_service_form_lab', function(){
            var form = $('#service_form_lab');
            $("#btn_service_form_lab").html("<img src='images/loader.gif' width='25px'/>&nbsp;Updating...");
            $.ajax({
                url:'labController.php?action=addServiceLocation',
                data:form.serialize(),//only input
                type: 'POST',
                async: false,
                success: function ( data ) {
                    var obj = $.parseJSON( data );
                    $('#ser_err').show();
                    if ( 1 == obj.status ){
                        $("#btn_service_form_lab").html("Update");
                        $('#ser_err').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                        $http.get("labController.php?action=loadAll&page=1").success(function(response){ 
                                $scope.labs = { data : response , selected : {}};
                        });
                        $http.get("labController.php?action=labPagination&page=1").success(function(response){ 
                            $('#labPagination').html(response);
                        });
                    } else {
                        $("#request_form").html("Save");
                        $('#ser_err').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                    }
                }
             
            });   
       });
       
       $(document).on('click', '#btn_user_lab', function(){
            var form = $('#user_form_lab');
            $("#btn_user_lab").html("<img src='images/loader.gif' width='25px'/>&nbsp;Updating...");
            $.ajax({
                url:'labController.php?action=addUserForLab',
                data:form.serialize(),//only input
                type: 'POST',
                async: false,
                success: function ( data ) {
                    var obj = $.parseJSON( data );
                    $('#usr_err').show();
                    if ( 1 == obj.status ){
                        $("#btn_user_lab").html("Update");
                        $('#usr_err').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                        $http.get("labController.php?action=loadAll&page=1").success(function(response){ 
                                $scope.labs = { data : response , selected : {}};
                        });
                        $http.get("labController.php?action=labPagination&page=1").success(function(response){ 
                            $('#labPagination').html(response);
                        });
                    } else {
                        $("#user_form_lab").html("Save");
                        $('#usr_err').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                    }
                }
             
            });   
       });
       
    
        $scope.getRecord = function( obj ) {
            $.each(values.split(","), function(i,e){
                $("#strings option[value='" + e + "']").prop("selected", true);
            });
        }
//        $scope.loadTestForApp = function( appid, email, contact, name, test_name ){
//            // Simple json request example :
//
//            $.getJSON( 'adminController.php?action=get_test&appid='+appid+'&email='+email+'&contact='+contact, function( data ) {
//                var html = '';
//                var htmlInputs = '';
//                $.each( data, function( key, val ) {
//                    html += "<option id='" + data[key]['test_id'] + "'>" + data[key]['test_name'] + "</option>";
//                });        
//                
//                $( "#test" ).html( html );
//                
//                htmlInputs = '<input type="hidden" name="email" value="'+ email +'">';
//                htmlInputs += '<input type="hidden" name="contact" value="'+ contact +'">';
//                htmlInputs += '<input type="hidden" name="name" value="'+ name +'">';
//                htmlInputs += '<input type="hidden" name="test_name" value="'+ test_name +'">';
//                
//                $( "#test" ).append( htmlInputs );
//                $( "#report_appid").val( appid );
//            });
//
//            
//			$('#upload_error').hide();
//			$('#file_upload').trigger("reset");
//            $("#myModal").modal('show');
//        } 
//$scope.loadReport = function( event, title, type ){
//                var report = 0;
//                var command = event;
//                if( 'excel' == event ) {
//                    report = 1;
//                    command = $("#report_for").val();
//                } else {
//                    $("#report_for").val(event);
//                } 
//                  $http.post('adminController.php?action=random&command='+ command +'&report='+report+'&date='+getDate())
//                    .success(function(data, status, headers, config) {
//                        $scope.users = data;
//                        if( 1 == report )
//                            window.location.href = 'downloads/HealthPlease_'+ getDate() +'.xls';
//                    // this callback will be called asynchronously
//                    // when the response is available
//                    })
//                    .error(function(data, status, headers, config) {
//                        alert(data);
//                        // called asynchronously if an error occurs
//                        // or server returns response with an error status.
//                      });
//                  
//                  $("#reports_header").hide();
//                  $("#download_excel").show();
//        }
//        
         //declare an empty array
//	$http.get("mock.json").success(function(response){ 
//		$scope.users = response;  //ajax request to fetch data into $scope.data
//	});
});

function generateDate( date ) {
            var tempDate = date.split( '/' );
            return tempDate[2] + '-' + tempDate[0] + '-' + tempDate[1];
}

var getDate = (function() {
  function addZ(n) {
    return n<10? '0'+n : ''+n;
  }
  return function() {
    var d = new Date();
    return d.getFullYear()+'-'+addZ(d.getMonth()+1)+'-'+addZ(d.getDate());
  }
}());