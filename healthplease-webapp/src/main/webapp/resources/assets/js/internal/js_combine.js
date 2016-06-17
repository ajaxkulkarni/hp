/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var bookedDays = [];

$(document).ready(function(){



  $('.loginid').click(function(){           
        $("#idLoginModal").modal('show');
         $("#idForgetPasswordModal").modal('hide');         

  });

   $('.forgetPasswordid').click(function(){   
        $("#idForgetPasswordModal").modal('show');
        
        $("#idLoginModal").modal('hide');
  });
  
  $("#idBookAppointment").click(function(){
    $("#idBookAppFlag").val("1");
  });
  
    /**
     * Submit new user data
     */
     $( '#msg_login' ).hide();
     $("#form_login").on( "submit", function () {
             var form=$("#form_login");
                 if ( false == form.valid() ) return;
	
            var sTestName = $("#idTest").val();
            var sLocationName = $("#idLocation").val();
            var appointmentDate = $("#idAppointmentDate").val();
            var appTime  = $("#idAppTime").val();
            var dbTime  = $('#dbdate').val();
        
            var appointmentForm = $("#on_form_appointment");
            $("#idLoginSubmit").html("<img src='images/loader.gif' width='25px'/>&nbsp;&nbsp;Loading...");

            $.ajax({
                type:"POST",
                url:form.attr("action"),
                data:form.serialize()+'&action=login',//only input
                success: function(response){
                    if( response == 1 ){
                       var bookAppFlag = $("#idBookAppFlag").val();
                       if( bookAppFlag == "1" ){
                            window.location = "confirmAppointment.php?testName="+sTestName+"&locName="+sLocationName+"&appDate="+appointmentDate+"&appTime="+appTime+"&dbdate="+dbTime+"&lab="+$('#idLabs').val();
                        } else {     
                            window.location = 'index.php';                                
                         }
                      } else if( 0 == response ){
                            window.location = 'change-pwd-form.php?force=1';                                
                       } else if ( 2 == response  ){
                           window.location = 'lab-dashboard.php';
                       }else {
                           $( '#msg_login' ).html( '<div class="alert alert-danger">'+ response +'</div>' );
                           $( '#msg_login' ).show();
                       }
                        //alert('try again! Invalid Credential......');
                        $("#idLoginSubmit").html('<span class="glyphicon glyphicon-plus"></span> Login');
                    }
            });
            return false;
        });

  /**
   * User REgistration js code
   */
    $('#name').keydown(function (e) {
          if (e.ctrlKey || e.altKey) {
          e.preventDefault();
          } else {
          var key = e.keyCode;
          if (!((key == 8) || (key == 32) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90) || (key == 9))) {
          e.preventDefault();
          }
          }
      });
        
      
     
          function ValidateEmail(email) {
        var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        return expr.test(email);
      };



      /***************************
     * Submit new user data
     */      
    $("#idRegisterSubmit").on( "click", function(){

        var bookAppFlag = $("#idBookAppFlag").val();
        if(bookAppFlag == "1"){
             var sTestName = $("#idTest").val();
             var sLocationName = $("#idLocation").val();
             
            if(sTestName == "select"){
                
              $("#idTestErr").fadeIn(1500);
              $("#idTestErr").html("<label style='color:red;'>Select Your Test</label>");
              $("#idTestErr").fadeOut(1500);
              // exit;
              // $('#idLoginModal').modal('lock');
              // return e.preventDefault();
              return false;
          }
           if(sLocationName == "select"){
              $("#idLocationErr").fadeIn(1500);
              $("#idLocationErr").html("<label style='color:red;'>Select Location</label>");
              $("#idLocationErr").fadeOut(1500);
              // exit;
              // return e.preventDefault();
              return false;
          }
         } 
        
         var appointmentForm = $("#on_form_appointment");

        var form = $("#form_register");
//         if ( false == form.valid() ) return;
       
       $("#idRegisterSubmit").html("<img src='images/loader.gif'  width='25px'/>&nbsp;&nbsp;Loading...");
         
         $.ajax({
                type:"POST",
                url:form.attr("action"),
                data:form.serialize()+'&action=register',//only input
                success: function(response){
                    var obj = $.parseJSON( response );
                    if ( 1 == obj.status ){
                       $('#msg_register').html('<div class="alert alert-info">' + obj.msg + '</div>');
                       $("#idRegisterSubmit").html('<span class="glyphicon glyphicon-edit"></span>  Register');  
                       $('#form_register').trigger("reset");
                    } else {
                       $('#msg_register').html('<div class="alert alert-danger">' + obj.msg + '</div>');
                       $("#idRegisterSubmit").html('<span class="glyphicon glyphicon-edit"></span>  Register'); 
                    }
                }
            });
           return false; 
 });
   
  
    
 });


            // When the document is ready
      $(document).ready(function () {
        // var datepicker = $.fn.datepicker.noConflict();
        
        // This is not get used at index.php 
        // Comment added by vikas
//          $('#idAppointmentDate').datepicker({
//              dateFormat: 'dd/mm/yy',
//              startDate: '+1d',
//              minDate:'1',
//              maxDate:'+2m',
//              viewMode: "months", 
//              changeMonth: true,
//               autoclose: true
//          }); 
//          $('.datepicker-app').datepicker({
//              dateFormat: 'dd/mm/yy',
//              startDate: '+1d',
//              minDate:'1',
//              maxDate:'+2m',
//              viewMode: "months", 
//              changeMonth: true,
//               autoclose: true
//          }); 
          
    
     /**
      * Code Added by vikas to select combobox runtime
      */  
          $( "#idTest" ).select2( {
                placeholder: "Please select your test/s"
          });
          
          $( "#idLabs" ).select2( {
                placeholder: "Select your lab"
          });
          
          $( "#pidLabs" ).select2({
                placeholder: "Select your lab"
          });

          
          $( ".classTestSelect" ).select2( {
                placeholder: "Select your test"
          });
          $(".locations").select2();
          //$(".labs").select2();
          $(".js-slots").select2();
                
//
//           $( ".classLocationSelect" ).select2( {
//                placeholder: "Select Your Test..",
//          });

           

          $( "#idLocation" ).select2( {
                placeholder: "Select your location"
          });
          
          $( "#idAppTime" ).select2( {
                placeholder: "Select time slot",
               // allowClear: true
          });
          
          $( "#pAppTime" ).select2( {
                placeholder: "Select time slot"
             //   allowClear: true
          });
          
 
          $(".classdob").datepicker({
                dateFormat: 'dd/mm/yy',
                maxDate: 0,
                changeMonth: true, 
                changeYear: true,
                autoclose: true,
                viewMode: "months" 
                // yearRange: "c-100:c+25"
          });

            $('#idSpanDob').click(function(){
                $(this).closest('.input-group').find('.hasDatepicker').focus();
            }).css('cursor','pointer');


          function generateDate( date ) {
            var tempDate = date.split( '/' );
            return tempDate[2] + '-' + tempDate[0] + '-' + tempDate[1];
          }

          //Calculate age for profile-form.php ...
               $('#dob').change(function(){
                   var tempAge = $(this).val();
                   var dob = new Date( tempAge );
                   var today = new Date();
                   var age = Math.floor(( today - dob ) / (365 * 24 * 60 * 60 * 1000));
                   if( 0 > age ) age = 0;
                   $('#signupage').val(parseInt(age));
                   $( "#dob" ).datepicker( "option", "dateFormat", "dd/mm/yy" );

              });   

              /*
              Code for limiting the address character : Code Start
              */
                 $('#add_street').inputlimiter({
                  limit: 160,
                  remText: 'You only have %n character%s remaining...',
                  remFullText: 'Stop typing! You\'re not allowed any more characters!',
                  limitText: 'You\'re allowed to input %n character%s into this field.'
                });
              /*
              Code for limiting the address character : Code End
              */
      });
      /*
       * to send recover password to user
       */
      $( 'document' ).ready( function(){
          $("#btn_fgt_pwd").on( "click", function() { 
                var form = $("#form_fgt_user_pwd");
                $("#btn_fgt_pwd").html("<img src='images/loader.gif'  width='15px'/>&nbspSending...");
                    $.ajax({
                        type:"POST",
                        url:form.attr("action"),
                        data:"action=recover&email="+$('#recover_email').val(),//only input
                        success: function(response){
                            if( response == 0 ){
                                $('#msg_pwd').html("<div class='alert alert-danger'><strong>SORRY!</strong> couldn't find this email address </div>");
                                $("#btn_fgt_pwd").html('<span class="glyphicon glyphicon-plus"></span>&nbspSend');
                                $('#msg_pwd').show();
                                form.reset();
                                //window.location.href = window.location.href;
                            } else {
                                 $('#msg_pwd').html( "<div class='alert alert-info'><strong>Temporary!</strong>password is send on your email-id </div>");
                                 $("#btn_fgt_pwd").html('<span class="glyphicon glyphicon-plus"></span>&nbspSend');
                            }
                        }
                   });
            });
            
            /*
             * Load slots on date change
             */
            
            $( '.slots' ).change(function(){
                var date = $(this).val();
                var lab_id = $(".labs").select2("val");
                $.ajax({
                    type:"POST",
                    url:'appoinController.php?',
                    data:'curr_date='+date+'&action=getslots&labid='+lab_id,//only input
                    success: function(response){
                        $("#idAppTime").html( response );
                        $("#idAppTime").select2("val", "");
                    }
                });
            });
            
            /*
             * BOOK FOR OTHER
             * Runtime add slots for particular date 
             */
            $( '.js-slots-other' ).change( function(){
                var date = $(this).val();
                var lab_id = $("#pidLabs").select2("val");
                $.ajax({
                    type:"POST",
                    url:'appoinController.php?',
                    data:'curr_date='+date+'&action=getslots&labid='+lab_id,//only input
                    success: function(response){
                        $("#pAppTime").html( response );
                        $("#pAppTime").select2("val", "");
                    }
                });
            });  
            
            
            
            /*
             * BOOK FOR YOURSELF
             * Make book enable if user changes previuos selected slot
             */
            var $eventSelect = $("#idAppTime");
 
            $eventSelect.on("change", function (e) { //$('.buttonNext').removeClass('buttonDisabled');
                $('.buttonNext').removeClass('buttonDisabled');
            });
                
            /*
             * BOOK FOR OTHER
             * Make book enable if user changes previuos selected slot
             */    
            
            $( '#pAppTime' ).on( "change", function(){
                $('.buttonNext').removeClass('buttonDisabled');
            });
            
            /*
             * Load Lab on Location change
             */
            
            $( '.locations' ).change(function(){
                var location = $(this).val();
                var radioValue = $("input[type='radio']:checked").val();
                var testId = '';
                if( 1 == radioValue ){
                    testId = $("#pidTest").val();
                } else {
                    testId = $("#idTest").val();
                }
                
                var radioValue = $("input[type='radio']:checked").val();
                $.ajax({
                    type:"POST",
                    url:'appoinController.php?',
                    data:'location='+location+'&action=getLabs&radio='+radioValue +'&testId='+testId,//only input
                    success: function(response){
                       // $(".js-slots").select2("val", "");
                        if( 1 == radioValue ){
                            $("#pidLabs").select2("val", "");
                            $(".datepicker-app" ).val("");
                            $("#pidLabs").html( response );
                        } else {
                            $("#idLabs").select2("val", "");
                            $(".datepicker-app" ).val("");
                            $("#idLabs").html( response );
                        }
                        
                    }
                });
            });
            
             $( document ).on ( "change", ".labs", function(){
                var lab = $(this).val();
                if( lab == null ) return;
                $(".slots").val("");
                $.ajax({
                    type:"POST",
                    url:'appoinController.php?',
                    data:'lab='+lab+'&action=getLabBlockedDate',//only input
                    success: function(response){
                        bookedDays =  [];
                        var obj = $.parseJSON( response );
                        $.each( obj, function( key, value ) {
                            bookedDays[key] = value.date;
                        });
                        $('.datepicker-app').datepicker({ 
                            beforeShowDay: function(date){
                            var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
                            return [ bookedDays.indexOf(string) == -1 ]
                            },
                            minDate:minDate, //its coming from appoinController
                            maxDate:'+2m',
                            viewMode: "months", 
                            changeMonth: true,
                            autoclose: true
                        });
                        $(".datepicker-app" ).val("");
                    }
                });
            });
            
            $( document ).on ( "change", ".js-tests", function(){
                $(".locations").val("");
               // $('.labs').select2('data', null);
                $('.labs')
                    .find('option')
                    .remove();
            
                var radioValue = $("input[type='radio']:checked").val();
                $(".slots").val("");
                if( 1 == radioValue ){
                    $("#pidLabs").select2("val", "");
                    $(".datepicker-app").val("");
                } else {
                    $("#idLabs").select2("val", "");
                    $(".datepicker-app").val("");
                }
                
            });
      });
