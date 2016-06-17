<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


		<h1>Profile</h1>
		<form method='post' id="form_upd_user" action="<%=Constants.UPDATE_USER_POST_URL %>">
			<!-- <input type='hidden' name='token' id='token' class='form-control'
				value="24e055f6d0bd5b41d9593082826095dc"> -->
			<input type='hidden' name= "id" id='token' class='form-control'
				value="${user.id}">
			<div
				class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12"
				id="idErrName">
				<label class=" control-label" for="fname">First Name *</label> <input
					type='text' name="firstName" id='fname'
					class='form-control classProfileCustomControl'
					placeholder="First Name" title="Please enter your First name !"
					value="${user.firstName}">
			</div>

			<div
				class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12"
				id="">
				<label class=" control-label" for="lname">Last Name *</label> <input
					type='text' name= "lastName" id='lname'
					class='form-control classProfileCustomControl'
					placeholder="Last Name" title="Please enter your Last name !"
					value="${user.lastName}">
			</div>

			<div
				class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12"
				id="">
				<label class=" control-label" for="selectbasic">Email *</label> <input
					type='hidden' name='id' id="id"
					class='form-control classProfileCustomControl' value="">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-envelope-o"></i>
					</div>
					<input type='email' name="email" id='username'
						placeholder="E-mail"
						class='form-control classProfileCustomControl'
						title="Please enter your email address!" value="${user.email}">
				</div>
			</div>
			<div
				class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<label class=" control-label" for="selectbasic">Mobile no. *</label>
				<div class="input-group">
					<div class="input-group-addon">+91</div>
					<input type='text' name="phone" id='contact'
						class='form-control classProfileCustomControl'
						placeholder="Mobile Number" maxlength="10" size="10"
						title="Please provide Contact no !" value="${user.phone}">
				</div>
			</div>
			<div
				class="form-group col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<label class="control-label" for="add_street">Address *</label>
				<div class="controls">
					<input type="text" id="add_street" name="address.street"
						class="input-medium form-control classProfileCustomControl"
						placeholder="Address" title="Please provide Street name !"
						name="add_street" value="${user.address.street}" />
				</div>
			</div>

			<!-- Text input-->
			<div
				class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<label class="control-label" for="add_landmark">Landmark</label>
				<div class="controls">
					<input id="add_landmark" name="address.landmark" placeholder="Landmark"
						class="input-medium form-control classProfileCustomControl"
						type="text" value="${user.address.landmark}">

				</div>
			</div>

			<!-- Text input-->
			<div
				class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<label class="control-label" for="add_area">Area *</label>
				<div class="controls">
					<input id="add_area" name="address.area" placeholder="Area"
						class="input-medium form-control classProfileCustomControl"
						value="${user.address.area}" title="Please provide area !" type="text">

				</div>
			</div>

			<!-- Text input-->
			<div
				class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<label class="control-label" for="area_city">City *</label>
				<div class="controls">
					<input id="add_city" name="address.city" placeholder="City"
						class="input-medium form-control classProfileCustomControl"
						value="Pune" type="text" readonly="">

				</div>
			</div>

			<!-- Text input-->
			<div
				class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<label class="control-label" for="area_zipcode">Pincode *</label>
				<div class="controls">
					<input id="add_zipcode" name="address.zipCode" placeholder="Pincode"
						class="input-medium form-control classProfileCustomControl"
						minlength="6" maxlength="6" type="text"
						title="Please provide Pincode !" value="${user.address.zipCode}">

				</div>
			</div>

			<div
				class="form-group col-xl-2 col-lg-2 col-md-2 col-sm-12 col-xs-12">
				<label class="control-label" for="gender">Gender *</label>
				<div class="radio">
					<label><input type="radio" name="gender" value="M"
						checked="checked">Male</label> <label> <input type="radio"
						name="gender" value="F">Female
					</label>
				</div>
			</div>

			<div
				class="form-group col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<strong>*</strong> Fields are mandatory.
			</div>

			<div
				class="form-group col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div id="edituser" class="pull-right">
					<button type="submit" class="btn btn-primary" name="btn-upd"
						id="btn-upd">
						<span class="glyphicon glyphicon-edit"></span> Update
					</button>
					<a href="#" data-dismiss="modal" class="btn btn-large btn-danger"><i
						class="glyphicon glyphicon-backward"></i> &nbsp; CANCEL</a>
				</div>
			</div>
		</form>

</body>
</html>