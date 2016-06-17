
/* 
 * To set form valiadtions
 * added by vikas on 31-May-2015
 */

$( document ).ready( function() {
    
    /*
     * Validation for text only content
     */
        jQuery.validator.addMethod("lettersonly", function(value, element) 
        {
        return this.optional(element) || /^[a-z ]+$/i.test(value);
        },"Only letter's are allowed");


/**
 * Validation For Book Appointment Form for self
 */
    $('#labAppform').validate({
        rules: {
            test: {
                required: true
            },
            location: {
                required: true
            },
            appointmentPName: {
                required: true
            },
            appointmentPEmail: {
                required: true
            },
            appointmentDate: {
                required: true
            },
//            appointmentTime: {
//                required: true
//            },
            appointmentPGender: {
                required: true,
		lettersonly:true
            },
            appointmentPContact: {
                required: true,
                minlength:10,
                maxlength:10
            },
//            address: {
//                required: true
//            },
            appointmentPAdd:{
                required: true,
            },
            appointmentPArea:{
                required: true,
            },
            appointmentPLandmark:{
                required: true,
            },
            appointmentPCity:{
                required: true,
            },
            appointmentPincode:{
                required: true,
                minlength:6,
                maxlength:6
            }
            
        },
        messages:{
           appointmentPName: "Please provide patient name" ,
           test: "Please provide test name for appointment",
           location: "Please provide your location",
           username: "Please provide your username",
           appointmentDate: "Please select appoitment date",
           //appointmentTime: "Please select slot which is not occupied",
           docName: "Please provide Doctor's name",
           appointmentPContact: {
               required:"Please provide contact",
               minlength:"Mobile number must be 10 digits",
               maxlength:"Mobile number must be 10 digits"
           },
//          address: "Please provide your address",
            add_street: "Please provide street name",
            appointmentPArea:"Please provide area",
            appointmentPLandmark:"Please provide landmark",
            appointmentPCity:"Please provide city",
            appointmentPincode:{
                required: "Please provide zipcode",
                minlength:"Zipcode Should be of 6 character",
                maxlength:"Zipcode Should be of 6 character"
            },
           appointmentPGender: "Please provide gender details",
           pu_add_zipcode:{
                required: "Please provide zipcode",
                minlength:"Zipcode must be of 6 character",
                maxlength:"Zipcode must be of 6 character"
            }
        },
        highlight: function (element) {
            $(element).closest('.form-control').removeClass('my-success').addClass('my-error');
        },
        success: function (element) {
            var id = $( element ).attr("for");
            $( "#"+id ).removeClass('my-error').addClass('my-success');
            /**
             * Below code should get work but its not working
             */
            //element.text('OK!').closest('.form-control').removeClass('my-error').addClass('my-success');
            
        }
    });

});