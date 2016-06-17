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
   * Validation for login form
   */  
       
    $('#form_login').validate({
        rules: {
            username: {
                required: true,
            },
            password: {
                required: true
            }
        },
        messages:{
           username: "Please provide username",
		   password: "Please provide password"
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
/**
 * 
 * @Validation for Register form
 */
                var container = $('div.error_container');
		// validate the form when it is submitted
		var validator = $("#form_register").validate({
			errorContainer: container,
			errorLabelContainer: $("ol", container),
			wrapper: 'li'
		});
/**
 * Validation For Book Appointment Form for self
 */
    $('#formBookAppYour').validate({
        rules: {
            name: {
                required: true,
				lettersonly:true
            },
            testName: {
                required: true
            },
            testLocation: {
                required: true
            },
            username: {
                required: true
            },
            appointmentDate: {
                required: true
            },
            appointmentTime: {
                required: true
            },
            docName: {
                required: true,
				lettersonly:true
            },
            contact: {
                required: true,
                minlength:10,
                maxlength:10
            },
//            address: {
//                required: true
//            },
            add_street:{
                required: true,
            },
            add_area:{
                required: true,
            },
            add_landmark:{
                required: true,
            },
            add_city:{
                required: true,
            },
            add_zipcode:{
                required: true,
                minlength:6,
                maxlength:6
            },
            gender: {
                required: true
            },
            pu_add_zipcode:{
                required: true,
                minlength:6,
                maxlength:6
            }
        },
        messages:{
           name: "Please provide your name" ,
           testName: "Please provide test name for appointment",
           testLocation: "Please provide your location",
           username: "Please provide your username",
           appointmentDate: "Please select appoitment date",
           appointmentTime: "Please select slot which is not occupied",
           docName: "Please provide Doctor's name",
           contact: {
               required:"Please provide contact",
               minlength:"Mobile number must be 10 digits",
               maxlength:"Mobile number must be 10 digits"
           },
//          address: "Please provide your address",
            add_street: "Please provide street name",
            add_area:"Please provide area",
            add_landmark:"Please provide landmark",
            add_city:"Please provide city",
            add_zipcode:{
                required: "Please provide zipcode",
                minlength:"Zipcode Should be of 6 character",
                maxlength:"Zipcode Should be of 6 character"
            },
           gender: "Please provide your gender details",
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
    
    
    /**
     * Validation For Book Appointment Form for others
     */
    $('#formBookAppOther').validate({
        rules: {
            pName: {
                required: true
            },
            pRelation: {
                required: true
            },
            pTest: {
                required: true
            },
            pLocation: {
                required: true
            },
            pEmail: {
                required: true
            },
            pAppDate: {
                required: true
            },
            pAppTime: {
                required: true
            },
            pDocName: {
                required: true,
				lettersonly:true
            },
//          pAaddress: {
//               required: true
//          },
            add_street:{
                required: true,
            },
            add_area:{
                required: true,
            },
            add_landmark:{
                required: true,
            },
            add_city:{
                required: true,
            },
            add_zipcode:{
                required: true,
                minlength:6,
                maxlength:6
            },
            pContact: {
                required: true,
                minlength:10,
                maxlength:10
            },
            pAddress: {
                required: true
            },
            pGender: {
                required: true
            },
            pick_add_zipcode:{
                required: true,
                minlength:6,
                maxlength:6
            }
        },
        messages:{
           pName: "Please provide Patient's name" ,
           pRelation: "Please provide your relation with patient" ,
           pTest: "Please provide test name for appointment",
           pLocation: "Please provide Patient's location",
           pUsername: "Please provide your username",
           AppDate: "Please select appoitment date",
           pAppTime: "Please select slot which is not occupied",
           pDocName: "Please provide Doctor's name",
           pAddress: "Please provide address",
           pEmail: "Please provide Patient's email",
           pContact: {
               required:"Please provide patient's mobile no",
               minlength:"Mobile number must be 10 digits"
           },
           add_street: "Please provide street name",
           add_area:"Please provide area",
           add_landmark:"Please provide landmark",
           add_city:"Please provide city",
           add_zipcode:{
                required: "Please provide zipcode",
                minlength:"Zipcode must be 6 digits",
                maxlength:"Zipcode must be 6 digits"
            },
           pGender: "Please provide gender details",
           pick_add_zipcode:{
                required: "Please provide zipcode",
                minlength:"zipcode must be 6 digits",
                maxlength:"zipcode must be 6 digits"
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

/*Address Char limiter code start */

$('.classAddress').inputlimiter({
    limit: 250,
    remText: 'You only have %n character%s remaining...',
    remFullText: 'Stop typing! You\'re not allowed any more characters!',
    limitText: 'You\'re allowed to give your address in  %n character%s only'

});
// limitText: 'You\'re allowed to give your address in  %n character%s into this field.'

/*Address Char limiter code end */

/**
 * Validation For update user data
 */
    $('#form_upd_user').validate({
        rules: {
            fname: {
                required: true
            },
            lname: {
                required: true
            },
            usernmae: {
                required: true
            },
            contact: {
                required: true,
                minlength:10,
                maxlength:10
            },
//            address: {
//                required: true
//            },
            add_street:{
                required: true,
            },
            add_area:{
                required: true,
            },
            add_landmark:{
                required: true,
            },
            add_city:{
                required: true,
            },
            add_zipcode:{
                required: true,
                minlength:6,
                maxlength:6
            },
            gender: {
                required: true
            },
            dob: {
                required: true
            }
        },
        messages:{
           fname: "Please provide First name" ,
           lname: "Please provide Last name" ,
           username: "Please provide your email address",
           contact: {
               required:"Please provide contact",
               minlength:"Mobile number must be 10 digits",
               maxlength:"Mobile number must be 10 digits"
           },
//          address: "Please provide your address",
            add_street: "Please provide street name",
            add_area:"Please provide area",
            add_landmark:"Please provide landmark",
            add_city:"Please provide city",
            add_zipcode:{
                required: "Please provide zipcode",
                minlength:"Zipcode Should be of 6 character",
                maxlength:"Zipcode Should be of 6 character"
            },
           gender: "Please provide your gender details"
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
	
//	/**
//   * Validation for request a check up form 
//   */  
//    $('#idSupportPanal').validate({
//        rules: {
//            name: {
//                required: true
//            },
//            email: {
//                required: true
//            },
//            contact: {
//                required: true,
//                minlength:10,
//                maxlength:10
//            },
//            age: {
//                required: true
//            },
//            query: {
//                required: true
//            }
//        },
//        messages:{
//			contact:{
//				required:"Please provide contact",
//                minlength:"Mobile number must be 10 digits",
//                maxlength:"Mobile number must be 10 digits"
//			}
//	    },
//        highlight: function (element) {
//            $(element).closest('.form-control').removeClass('my-success').addClass('my-error');
//        },
//        success: function (element) {
//            var id = $( element ).attr("for");
//            $( "#"+id ).removeClass('my-error').addClass('my-success');
//            /**
//             * Below code should get work but its not working
//             */
//            //element.text('OK!').closest('.form-control').removeClass('my-error').addClass('my-success');
//            
//        }
//    });
	
	/**
   * Validation for request a call back
   */  
    $('#upload_form').validate({
        rules: {
            name: {
                required: true
            },
            number: {
                required: true,
                minlength:10,
                maxlength:10
            },
            email :{
                required: true
            }
		},
        messages:{
			number:{
				required:"Please provide contact",
                minlength:"Mobile number must be 10 digits",
                maxlength:"Mobile number must be 10 digits"
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
    
    $("#request_from_index").validate({
		errorPlacement: function(error, element) {
			// Append error within linked label
			$( element )
				.closest( "form" )
					.find( "label[for='" + element.attr( "id" ) + "']" )
						.append( error );
		},
		errorElement: "span",
		messages: {
			name: {
				required: "*",
				minlength: "*"
			},
			email: {
				required: "*",
				email: "*"
			},
                        contact: {
				required: "*",
				minlength: "*",
				maxlength: "*"
			},
                        age: {
				required: "*",
                                minlength:"*"
			},
                        query: {
				required: "*"
				
			}
		}
	});


});
