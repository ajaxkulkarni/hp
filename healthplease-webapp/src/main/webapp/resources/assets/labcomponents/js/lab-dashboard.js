/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var date ;
var active;
var year;
var month;
var day;

$(document).ready(function(){
    
    $( document ).on ( "click", ".js-active_day_slot", function(){
            var $this = $( this );
            var text = 'block';
            date = $this.data("date");
            active = $this.data("active");
            year = $this.data("year");
            month = $this.data("month");
            day = $this.data("day");
            if( 'Y' == active ) {
                text = 'active';
            }
            $("#message-popup").modal('show');
            $("#msg_body").html( "Are you sure you want to "+text+" this day from appointments?" );
    });
    
     $( document ).on ( "click", "#clickMe", function(){
         window.location.href = window.location.href;
     });
     
     $( document ).on ( "click", "#clickYes", function(){
         var data = {};
            data["action"] = "set_lab_days";
            data["date"] = date;
            data["active"] = active;
            data["month"] = month;
            data["year"] = year;
            data["day"] = day;

            data["lab_id"]  = $("#lab_id").val() ;
            //$("#btn_fgt_pwd").html("<img src='images/loader.gif'  width='15px'/>&nbspSending...");
                $.ajax({
                    type:"POST",
                    url:"",
                    data:data,//only input
                    success: function(response){
                        var obj = $.parseJSON( response );
                        if ( 1 == obj.status ){
                            window.location.href = window.location.href;
                        } else {
                            alert(obj.msg);
                        }
                    }
               });
     });
    
});