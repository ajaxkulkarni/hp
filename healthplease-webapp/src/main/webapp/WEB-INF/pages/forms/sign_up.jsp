<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

 <!--  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"> -->
</head>
<body>

	<script type="text/javascript">
	
		function register() {
			return $("#form_register").valid();
		}
	
	</script>
<style>
.form-group
{
height:80px;
}
</style>

	<form method='post' id="form_register" action="<%=Constants.REGISTER_USER_POST_URL %>" >
				<div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12" id="idErrName">
                  <label class=" control-label" for="fname">First Name *</label>
                  <input type='text' name="firstName" id='fname' class='form-control classCustomControl' placeholder="First Name" title="Please enter your First name !" required="required">
                </div>

                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12" id="">
                  <label class=" control-label" for="lname">Last Name *</label>
                  <input type='text' name="lastName" id='lname' class='form-control classCustomControl' placeholder="Last Name" title="Please enter your Last name !" required="required"></td>
                </div>

                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12" id="">
                  <label class=" control-label" for="selectbasic">Username / Email *</label>
                  <div class="input-group" id="ff"><input type='text' name="email" id='idUsername' placeholder="E-mail" class='form-control classCustomControl' title="Please enter your email address!" required="required" onfocusout="validEmail()" ></div> 
                  <div id="err" style="color:red"></div>
                </div>

    
    <style>
    /* enable absolute positioning */
.inner-addon {
  position: relative;
}

/* style glyph */
.inner-addon .glyphicon1 {
  position: absolute;
  padding: 7px;
  pointer-events: none;
    margin:0px 9px;
    background-color: #aaa;
    color: white;
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px;
    font-weight: 400;
}

/* align glyph */
.left-addon .glyphicon1  { left:  0px;}
.right-addon .glyphicon1 { right: 0px;}

/* add padding  */
.left-addon input  { padding-left:  40px; }
.right-addon input { padding-right: 30px; }
    
    
    </style>
    
    <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12 inner-addon left-addon">
<!--      <i class="glyphicon glyphicon-user"></i>      -->
               <label class=" control-label" for="selectbasic">Mobile no. *</label>
        <div  class="">
            <label class="glyphicon1">+ 91</label>
      <input type="text" name="phone" id='contact' class="form-control" placeholder="Mobile Number"  maxlength="10" size="10" title="Please provide Contact no !" required="required" />
        </div>
    </div>
    
    
                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                  <label class=" control-label" for="selectbasic">Password *</label>
                  <input type='password' name="password" id='idPassword' class='form-control classCustomControl' placeholder="Password" title="Password must be atleast 6 characters long" required="required" >
                </div>
                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                  <label class=" control-label" for="selectbasic">Confirm Password *</label>
                  <input type='password' name="password_again" id='password_again' class='form-control classCustomControl' placeholder="Confirm Password" title="Password and confirm Password doesn't match" required="required">
                </div>
                <div class="form-group col-xl-8 col-lg-8 col-md-8 col-sm-12 col-xs-12">
                  <label class="control-label" for="add_street">Address *</label>
                  <div class="controls">                     
                      <input type="text" id="add_street" name="address.street" class="input-medium form-control classCustomControl" title="Please provide Street name !" name="add_street" required="required" placeholder="Eg: Flat No, Bunglow No, Society name"/>
                  </div>
                </div>

                <!-- Text input-->
                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                  <label class="control-label" for="add_landmark">Landmark</label>
                  <div class="controls">
                    <input id="add_landmark" name="address.landmark" placeholder="Landmark" class="input-medium form-control classCustomControl" type="text">

                  </div>
                </div>

                <!-- Text input-->
                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                  <label class="control-label" for="add_area">Area *</label>
                  <div class="controls">
                    <input id="add_area" name="address.area" placeholder="Eg: Viman Nagar, Kalynaninagar'" class="input-medium form-control classCustomControl" required="required" title="Please provide area !" type="text">

                  </div>
                </div>

                <!-- Text input-->
                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                  <label class="control-label" for="area_zipcode">Pincode *</label>
                  <div class="controls">
                      <input id="add_zipcode" name="address.zipCode" placeholder="Pincode" class="input-medium form-control classCustomControl numeric" minlength="6" maxlength="6"  type="text" title="Please provide Pincode !" required>

                  </div>
                </div>

                 <!-- Text input-->
                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                  <label class="control-label" for="area_city">City *</label>
                  <div class="controls">
                      <input id="add_city" name="address.city" placeholder="City" class="input-medium form-control classCustomControl" required value="" type="text">

                  </div>
                </div>

                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                   <label class="control-label" for="gender">Gender *</label>
                   <div class="radio">
                       <label><input type="radio" name="gender" value="M" checked="checked">Male</label>
                       <label> <input type="radio" name="gender" value="F">Female</label>
                   </div>
                 </div>

                 <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <label class="control-label" for="area_zipcode">Date Of Birth *</label>
                    	<%@include file="dob.jsp" %>
                    </div>
                 
				 <div class="form-group col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <input type="checkbox" id="terms" name="terms" class="" value="1" required="required"/>&nbsp; I Agree on <a href="<%=Constants.TERMS_GET_URL%>" target="_blank">Terms and Condtions*</a>
                 </div>
                
		  		  <div class="form-group col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <strong>*</strong> Fields are mandatory.
                  </div>

                  <div class="form-group col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div id="edituser">
                      <button type="submit" class="btn btn-primary" name="btn-update" name="register">
                        <span class="glyphicon glyphicon-edit"></span> Register
                      </button>
                      <a href="<%=Constants.HOME_GET_URL%>"  data-dismiss="modal" class="btn btn-large btn-danger"><i class="glyphicon glyphicon-backward"></i> &nbsp; CANCEL</a>
                    </div> 
                  </div>
	</form>
    
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
    
    
        <script>
(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
            //form validation rules
            $("#form_register").validate({
                rules: {   
                	 email: {
                		 required: true,
                		
                     },
                    phone: {
                        required: true,
                        number: true
                      },
                	password: {
                        required: true,
                        minlength: 6
                    },
                    password_again : {
                    minlength : 6,
                    equalTo : "#idPassword"
                    },
                	
                messages: {
                	
                	 email:{
                         required:"please enter email",
                            
                     },
                    password: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 6 characters long"
                    },
                    password_again :"Please enter same password",
                    phone:
                    	{
                    	number:"please enter valid mobile number"
                    	}
                    

                },
                submitHandler: function(form) {
            
                    form.submit();
                }
                }
            });
        }
    }

    //when the dom has loaded setup form validation rules
    $(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
    });
    
    

})(jQuery, window, document);

$.validator.addMethod("emailCustom", function (value, element, params) {
	var re = /^[a-z]+$/;
	return re.test(value);
	}, "Please enter a valid email address.");
    </script>
    
    
	<script>
	
	function IsMobileNumber(contact) {
	var mob = /^[1-9]{1}[0-9]{9}$/;
	console.log(txtMobile.value);
	var txtMobile = document.getElementById(contact);
	if (mob.test(txtMobile.value) == false) {
	    alert("Please enter valid mobile number.");
	    txtMobile.focus();
	    return false;
	}
	return true;
	}	
	function validEmail() {
	    var x = document.getElementById("idUsername").value;
	    var atpos = x.indexOf("@");
	    var dotpos = x.lastIndexOf(".");
	    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
	        document.getElementById("err").innerHTML="enter valid email";
	        document.getElementById("err").focus;
	        return false;
	    }
	    else
	    	document.getElementById("err").innerHTML="";
	    	return true;
	}
	
	$("#fname").keypress(function (e) {
	    var regex = new RegExp("^[a-zA-Z]+$");
	    var key = e.charCode||e.keyCode;
	    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	    if (regex.test(str)) {
	        return true;
	    }
	    else if(key == 8||key == 46|| key == 9||key==37||key==39||key==32)
	    	return true;
	    else
	    {
	    e.preventDefault();
	    //alert('Please Enter Alphabate');
	    return false;
	    }
	});
	
	$("#add_city").keypress(function (e) {
	    var regex = new RegExp("^[a-zA-Z]+$");
	    var key = e.charCode||e.keyCode;
	    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	    if (regex.test(str)) {
	        return true;
	    }
	    else if(key == 8||key == 46|| key == 9||key==37||key==39||key==32)
	    	return true;
	    else
	    {
	    e.preventDefault();
	    //alert('Please Enter Alphabate');
	    return false;
	    }
	});
	
	$("#lname").keypress(function (e) {
	    var regex = new RegExp("^[a-zA-Z]+$");
	    var key = e.charCode||e.keyCode;
	    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	    if (regex.test(str)) {
	        return true;
	    }
	    else if(key == 8||key == 46|| key == 9||key==37||key==39||key==32)
	    	return true;
	    else
	    {
	    e.preventDefault();
	    //alert('Please Enter Alphabate');
	    return false;
	    }
	});
	</script>

</body>

</html>