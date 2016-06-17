var app = angular.module('angularTable', ['angularUtils.directives.dirPagination']);

app.controller('listdata',function($scope, $http){
	$scope.users = []; //declare an empty array
//	$http.get("mock.json").success(function(response){ 
//		$scope.users = response;  //ajax request to fetch data into $scope.data
//        });
	
	$scope.sort = function(keyname){
		$scope.sortKey = keyname;   //set the sortKey to the param passed
		$scope.reverse = !$scope.reverse; //if true make it false and vice versa
	}
        
        $scope.getRecord = function( obj ) {
                var type_of_report;
                var $this = $( this );
                var sdate = $('#fromdate').datepicker("getDate");
                var edate = $('#todate').datepicker("getDate");
               
                if (sdate > edate) {
                   $('#msg').html('<div class="alert alert-danger" style="width:600px">! Problem with date range</div>'); 
                   exit;
                }
                
                var $this = $( this );
                var fromdate = generateDate( $( '#fromdate' ).val() );
                var todate = generateDate( $( '#todate' ).val() );
                var type = 0;
                
                if( 2 == $this.data( "value" ) ) {
                    type = 1;
                    fromdate = 'n/a';
                    var fullDate = new Date()
                    //convert month to 2 digits
                    var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
                    todate = fullDate.getFullYear() + "-" + twoDigitMonth + "-" + fullDate.getDate() ;
                }
              
            if( 0 == $this.attr( 'value' ) ) {  type_of_report = 'get_pdf'; }
            if( 1 == $this.attr( 'value' ) ) {  type_of_report = 'get_excel'; }
            
            // Simple POST request example :
            
            $http.post('adminController.php?action=gen_report',{ 
                              fromdate : fromdate,
                              todate : todate,
                              type :type,
                              action: 'gen_report',
                              type_of_report:type_of_report
                              })
            .success(function(data, status, headers, config) {
                  $scope.users = data;
                // this callback will be called asynchronously
                // when the response is available
              })
            .error(function(data, status, headers, config) {
                alert(data);
                // called asynchronously if an error occurs
                // or server returns response with an error status.
              });
        }
        $scope.getProperAddress = function( address, appid ){
                  $("#address_"+appid).html( address );
        }
        $scope.loadTestForApp = function( appid, email, contact, name, test_name ){
            // Simple json request example :

            $.getJSON( 'adminController.php?action=get_test&appid='+appid+'&email='+email+'&contact='+contact, function( data ) {
                var html = '';
                var htmlInputs = '';
                $.each( data, function( key, val ) {
                    html += "<option id='" + data[key]['test_id'] + "'>" + data[key]['test_name'] + "</option>";
                });        
                
                $( "#test" ).html( html );
                
                htmlInputs = '<input type="hidden" name="email" value="'+ email +'">';
                htmlInputs += '<input type="hidden" name="contact" value="'+ contact +'">';
                htmlInputs += '<input type="hidden" name="name" value="'+ name +'">';
                htmlInputs += '<input type="hidden" name="test_name" value="'+ test_name +'">';
                
                $( "#test" ).append( htmlInputs );
                $( "#report_appid").val( appid );
            });

            
			$('#upload_error').hide();
			$('#file_upload').trigger("reset");
            $("#myModal").modal('show');
        } 
        $scope.loadReport = function( event, title, type ){
                var report = 0;
                var command = event;
                if( 'excel' == event ) {
                    report = 1;
                    command = $("#report_for").val();
                } else {
                    $("#report_for").val(event);
                } 
                  $http.post('adminController.php?action=random&command='+ command +'&report='+report+'&date='+getDate())
                    .success(function(data, status, headers, config) {
                        $scope.users = data;
                        if( 1 == report )
                            window.location.href = 'downloads/HealthPlease_'+ getDate() +'.xls';
                    // this callback will be called asynchronously
                    // when the response is available
                    })
                    .error(function(data, status, headers, config) {
                        alert(data);
                        // called asynchronously if an error occurs
                        // or server returns response with an error status.
                      });
                  
                  $("#reports_header").hide();
                  $("#download_excel").show();
        }
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