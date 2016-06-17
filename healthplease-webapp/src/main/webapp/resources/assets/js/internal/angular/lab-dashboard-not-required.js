var app = angular.module('orderTable', ['angularUtils.directives.dirPagination']);

    app.controller('listorder',function( $scope, $http ){
            $scope.orders = []; //declare an empty array
            var d = new Date();
            var todate = d.getFullYear() + '-' + ( d.getMonth() + 1 ) + '-' + d.getDate(); 
            var lab_id = $( "#lab_id" ).val();
            $scope.appid = '';
            $scope.cancelReason = '';
            $scope.cancelReasonId = '';
            $scope.CancelOtherId = 4;
            
         
            
            $( "#found" ).show();
            $( "#not_found" ).hide();
            $http.get( '', { params:{  action : 'load_appointment' ,
                                                        todate : todate,
                                                        fromdate:'n/a',
                                                        lab_id:lab_id,
                                                        random:random_int() } })
                 .success(function(response){
                   //  alert(response);return;
                    // alert(response);return;
                     var obj = angular.fromJson( response );
                      if( obj.id == 0 ){
                          $( "#not_found" ).html("<tr><td colspan='7'>No records found...</td></tr>");
                          $( "#found" ).hide();
                          $( "#not_found" ).show();
                          return;
                      }
                      
                    $scope.orders = response;  //ajax request to fetch data into $scope.data
            });
            
            // Load Summary of appointemnt
            $.ajax({
                type:"POST",
                url:'labController.php',
                data: {
                    action:'load_summary',
                    lab_id : lab_id,
                    todate : todate
                },
                success: function(response){
                     var json = $.parseJSON( response );
                     var total = isNaN( parseInt( json[0].total ) ) ? 0 : json[0].total;
                     var pen = isNaN( parseInt( json[0].pen ) ) ? 0 : json[0].pen;
                     var can = isNaN( parseInt( json[0].can ) ) ? 0 : json[0].can;
                     var today = isNaN( parseInt( json[0].today ) ) ? 0 : json[0].today;
                     
                     $('#total').html( total );
                     $('#pending').html( pen );
                     $('#cancel').html( can );
                     $('#today').html( today );
                }
            });
            
            
            $scope.sort = function(keyname){
                    $scope.sortKey = keyname;   //set the sortKey to the param passed
                    $scope.reverse = !$scope.reverse; //if true make it false and vice versa
            }
            
            $scope.rangeReport = function( title ){
                $( "#found" ).show();
                $( "#not_found" ).hide();
                $("#appFor").html( title );
                var sdate = $('.fromCalendar').datepicker("getDate");
                var edate = $('.toCalendar').datepicker("getDate");

                if (sdate > edate) {
                    alert('Problem with date range provided'); 
                    return;
                }

                var fromdate = giveMeDbDate( $( ".fromCalendar" ).val() );
                var calTodate = giveMeDbDate( $( ".toCalendar" ).val() );
                
                
                
                $http.get( 'labController.php', { params:{  action : 'load_appointment' ,
                                                      fromdate : fromdate,
                                                      todate: calTodate,
                                                      lab_id : lab_id,
                                                      random : random_int() } })
                .success(function(response){
                  //  alert(response);return;
                   // alert(response);return;
                    var obj = angular.fromJson( response );
                     if( obj.id == 0 ){
                         $( "#not_found" ).html("<tr><td colspan='7'>No records found...</td></tr>");
                         $( "#found" ).hide();
                         $( "#not_found" ).show();
                         return;
                         return;
                     }

                   $scope.orders = response;  //ajax request to fetch data into $scope.data
                });
                
            }
            
             //Load PENDING. Total, cancel
            $scope.getExcel = function( ){
                $http.get( 'labController.php', { params:{  action : 'getExcel' ,
                                                       data : JSON.stringify( $scope.orders ),
                                                       lab_id : lab_id,
                                                       random : random_int() } })
                 .success(function(response){
                       window.location.href = 'downloads/HealthPlease_'+ getDate() +'.xls';
                });
                  
            }
            
            //Load PENDING. Total, cancel
            $scope.loadReport = function( event, title ){
                $("#appFor").html( title );
                $http.get( 'labController.php', { params:{  action : 'random' ,
                                                       command : event,
                                                       lab_id : lab_id,
                                                       random : random_int() } })
                 .success(function(response){
                    var obj = angular.fromJson( response );
                    if( obj.id == 0 ){
                        $( "#not_found" ).html("<tr><td colspan='7'>No records found...</td></tr>");
                        $( "#found" ).hide();
                        $( "#not_found" ).show();
                        return;
                        return;
                    }
                      
                    $scope.orders = response;  //ajax request to fetch data into $scope.data
                    $( "#found" ).show();
                    $( "#not_found" ).hide();
                });
                  
            }
            
            $scope.cancelMe = function( appid ){
                $scope.appid = appid;
                $scope.cancelReasonId = 1;
                $scope.cancelReason = $("#reason_1").data("val");
                $("#cancel_reason").val( $scope.cancelReason );
            }
            
            $scope.reset = function(  ){
                $( ".fromCalendar" ).val("") ;
                $( ".toCalendar" ).val("") ;
            }
            
            /*
            * CAncel appointment
            */
           $( document ).on ( "click", ".js-cancelappointment",  function( e ){
                var deleteUser = window.confirm('Are you sure, you want to cancel appointment?');

                if ( deleteUser ) {
                    var data = {};
                    data["action"] = "cancel_app";
                    data["app_id"] = $scope.appid;
                    data["cancel_reason_id"] = $scope.cancelReasonId;
                    data["cancel_reason"] = '';
                    if( $scope.cancelReasonId == $scope.CancelOtherId ) {
                        data["cancel_reason"] = $("#cancel_reason").val();
                    }
                    
                    $.ajax({
                        type:"POST",
                        url:'labController.php',//?action=cancelapp&id='+ $( "#app_id" ).val() +'&status=2',//+$( "#status" ).val(),
                        data:data,
                        success: function(response){
                            if( 1 == response ){ 
                                alert( 'Your appointment is Cancelled successfully !' );
                                window.location.href = window.location.href + "?page=cancel";
                            } else {
                                alert(response);
                                alert( 'Can\'t cancel your appointment right now' );
                            }
                        }
                    });
                }
           });
           
           /*
            * Load slots on date change
            */

            $( '#select_reason' ).change(function(){
                var $this = $(this);
                $scope.cancelReasonId = $this.val();
                $("#cancel_reason").prop("readonly", true);
                if( $scope.cancelReasonId == $scope.CancelOtherId ) {
                    $("#cancel_reason").prop("readonly", false);
                }
                $scope.cancelReason = $("#reason_"+$scope.cancelReasonId).data("val");
                $("#cancel_reason").val( $scope.cancelReason );
            });
    
           
//            $scope.paymentType = function( type ){
//                if ( type != null )
//                    return  type;
//                else
//                    return '-';
//            }
//            $scope.displayPatientOption = function( type ){
//                if ( type != null )
//                    return true;
//                else
//                    return false;
//            }
//            $scope.displayBuyerOption = function( type ){
//                if ( type == null )
//                    return true;
//                else
//                    return false;
//            }
            $scope.giveMeWeekDay = function( $date ){
                if ( $date != null )
                    return  getDay( $date );
                else
                    return '-';
            }
            $scope.giveMeFormatedDate = function( $date ){
                if ( $date != null ){
                    var d = new Date( $date );
                    return  getMonth( $date )+ ' ' + d.getDate() + ', ' + d.getFullYear();
                }
                else
                    return '-';
            }
            $scope.getProperTestName = function( testName, appid ){
               
                var arrTestNames = testName.split( "," );
                var strTestNames = '';
                $.each( arrTestNames, function( key, value ) {
                    strTestNames += value + "<br/>";
                });
               $("#test_name_"+appid).html( testName );
//              
//               var arrTestNames = testName.split( "," );
//                var strTestNames = '';
//                var count = '';
//                var arrlength = arrTestNames.length;
//                $.each( arrTestNames, function( key, value ) {
//                        
//                        if( arrlength > 1 ){
//                            count = ( key + 1 ) +') ';
//                            strTestNames += '<h4 class="deal-name" ><span  class="pull-left">'+ count + value + '</span><span class="pull-right" style="float:right;color:#f00;"><i style="display: inline-block;" class="fa fa-circle-o pull-right"></i></span></h4>';
//                        } else {
//                            strTestNames += '<h4 class="deal-name" >'+ value + '</h4>';
//                        }
//                });
//               $("#test_name_"+appid).html( strTestNames );
            }
            
            $scope.getProperAddress = function( address, appid ){
                  $("#address_"+appid).html( address );
            }
            
            $scope.loadTestForApp = function( appid, email, contact, name, test_name ){
                // Simple json request example :

                $.getJSON( 'labController.php?action=get_test&appid='+appid+'&email='+email+'&contact='+contact, function( data ) {
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
                $("#uploadFileModal").modal('show');
            }
            
              
    }); 

function giveMeDbDate( date ){
    var arrFromdate = date.split("/");
    return arrFromdate[2] + "-" + arrFromdate[1] + "-" +arrFromdate[0];
}

function getDay( date ) {
    var d = new Date( date );
    var weekday = new Array(7);
    weekday[0] = "Sunday";
    weekday[1] = "Monday";
    weekday[2] = "Tuesday";
    weekday[3] = "Wednesday";
    weekday[4] = "Thursday";
    weekday[5] = "Friday";
    weekday[6] = "Saturday";

    var n = weekday[d.getDay()];
    return n;
    //document.getElementById("demo").innerHTML = n;
}

function getMonth( date ) 
{
    var d = new Date( date );
    var monthNames = ["January", "February", "March", "April", "May", "June",
                    "July", "August", "September", "October", "November", "December"
                    ];
    var n = monthNames[d.getMonth()];
    return n;
    //document.getElementById("demo").innerHTML = n;
}

$(document).ready(function(){
    
     //Load Page which is user selcted
    var page = getUrlVars()["page"];
    //  alert(page);
    LoadPageContent(page);
    
    $( "#file_upload" ).on( "submit", function (e) {
        var formData = new FormData($(this)[0]);
        e.preventDefault();
        $("#btn_file_upload").html("<img src='images/loader.gif' width='25px'/>&nbsp;&nbsp;Uploading and Sending email...");
        $.ajax({
            url:'labController.php?action=upload_report&testid='+  $('#test').find(":selected").attr('id'),
            data:formData,//only input
            type: 'POST',
            async: false,
            success: function ( data ) {
                var obj = $.parseJSON( data );
                $('#upload_error').show();
                if ( 1 == obj.status ){
                    $("#btn_file_upload").html("Upload");
                    $('#upload_error').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                } else {
                    $("#btn_file_upload").html("Upload");
                    $('#upload_error').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                }
            },
            cache: false,
            contentType: false,
            processData: false
        });

        return false;
    });

}); //end of dicument ready   

function random_int(){
    return Math.random();
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

// Read a page's GET URL variables and return them as an associative array.
function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}


function LoadPageContent( page )
{
    window.history.pushState("string", "Title", "lab-dashboard.php");
    switch ( page ){
        case'cancel':
                $("#cancel_app").click();
            break;
        case 'pending':
                $("#pending_app").click();
            break;
        case 'total':
                $("#total_app").click();
            break;
    }
}

//UPDATE `appointments` SET status_id = 1