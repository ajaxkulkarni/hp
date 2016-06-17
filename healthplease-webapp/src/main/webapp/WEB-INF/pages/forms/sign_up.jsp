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
</head>
<body>

	<script type="text/javascript">
	
		function register() {
			return $("#form_register").valid();
		}
	
	</script>

	<form method='post' id="form_register" action="<%=Constants.REGISTER_USER_POST_URL %>" >
				<div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12" id="idErrName">
                  <label class=" control-label" for="fname">First Name *</label>
                  <input type='text' name="firstName" id='fname' class='form-control classCustomControl' placeholder="First Name" title="Please enter your First name !" >
                </div>

                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12" id="">
                  <label class=" control-label" for="lname">Last Name *</label>
                  <input type='text' name="lastName" id='lname' class='form-control classCustomControl' placeholder="Last Name" title="Please enter your Last name !" required="required"></td>
                </div>

                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12" id="">
                  <label class=" control-label" for="selectbasic">Username / Email *</label>
                  <div class="input-group"> <div class="input-group-addon"><i class="fa fa-envelope-o"></i></div><input type='email' name="email" id='idUsername' placeholder="E-mail" class='form-control classCustomControl' title="Please enter your email address!" required="required"></div>
                </div>
                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                  <label class=" control-label" for="selectbasic">Mobile no. *</label>
                  <div  class="input-group"> <div class="input-group-addon">+91</div><input type='text' name="phone" id='contact' class='form-control classCustomControl numeric' placeholder="Mobile Number" maxlength="10" size="10" title="Please provide Contact no !" required="required"></div>
                </div>
                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                  <label class=" control-label" for="selectbasic">Password *</label>
                  <input type='password' name="password" id='idPassword' class='form-control classCustomControl' placeholder="Password" title="Please enter your password !" required="required">
                </div>
                <div class="form-group col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                  <label class=" control-label" for="selectbasic">Confirm Password *</label>
                  <input type='password' id='password_again' class='form-control classCustomControl' placeholder="Confirm Password" title="Please enter password again field !" required="required">
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

</body>
</html>