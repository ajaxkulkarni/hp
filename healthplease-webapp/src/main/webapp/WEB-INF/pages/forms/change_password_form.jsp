<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="row">
		<div
			class="col-md-offset-4 col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div id="msg_pwd">
				<c:if test="${result != null && result != 'OK' }">
					<div class="alert alert-info">${result}</div>
				</c:if>
			</div>
		</div>
		<c:if test="${user.email == null }">
		<form method='post' id="form_upd_user_pwd" action="<%=Constants.CHANGE_PASSWORD_URL_POST%>">
		</c:if>
		<c:if test="${user.email != null }">
		<form method='post' id="form_upd_user_pwd" action="<%=Constants.CHANGE_PASSWORD_SETTINGS_URL_POST%>">
		</c:if>
			<input type='hidden' name='token' id='token' class='form-control'
				value="">
			<div class="row">
				<div
					class="form-group col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<label class="control-label" for="age">Current Password</label> <input
						type='password' id='c_pwd'
						class='form-control classProfileCustomControl'
						placeholder="Current password" value="" data="">
				</div>
			</div>
			<div class="row">
				<div
					class="form-group col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<label class=" control-label" for="selectbasic">New
						Password *</label> <input type='password' name='password' id='idPassword'
						class='form-control classProfileCustomControl'
						placeholder="Password" title="Please enter your password !"
						data="">
				</div>
			</div>
			<div class="row">
				<div
					class="form-group col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<label class=" control-label" for="selectbasic">Confirm
						Password *</label> <input type='password' id='password_again'
						class='form-control classProfileCustomControl'
						placeholder="Confirm Password"
						title="Please enter password again field !">
				</div>
			</div>
			<div class="row">
				<div
					class="form-group col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<strong>*</strong> Fields are mandatory.
				</div>
			</div>
			<div class="row">
				<div
					class="form-group col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div id="edituser" class="">
						<button type="submit" class="btn btn-primary" name="btn-upd-pwd"
							id="btn-upd-pwd">
							<span class="glyphicon glyphicon-edit"></span> Change Password
						</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="user-profile.html"
							data-dismiss="modal" class="btn btn-large btn-danger"><i
							class="glyphicon glyphicon-backward"></i> &nbsp; CANCEL</a>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>