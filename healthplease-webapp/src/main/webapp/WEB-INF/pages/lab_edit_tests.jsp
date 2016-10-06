<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title> Tests | HealthPlease.in</title>
    
</head>

<body>
 <div id="wrapper">

        <%@include file="lab_header.jsp" %>

 <div id="page-wrapper">
<!--Add user start from here-->
<div class="container" id="addUser" name="addUser">
   
  <div class="row">
    
<div class="col-lg-9 col-md-9">


<div class="clearfix"></div>

<div id="msg" class="container"></div>

<div class="" id="div_add">
<a href="<%=Constants.ADMIN_EDIT_LAB_TEST_GET_URL %>?labId=${lab.id}" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Add New Test</a>
</div>

<div class="clearfix"></div><br/>
<!--Main div where content get loaded-->
<h1>${lab.name}</h1>
<div id="addUser" name="addUser">

<form method='post' id="form_add_user" action="<%=Constants.ADMIN_EDIT_TEST_POST_URL%>">
 
    <table class='table table-bordered'>
 
        <tr>
            <td>Test Name</td>
            <input type='hidden' name='id' id="id" class='form-control' value="${test.id}">
            <td><input type='text' name='name' id='test_name' class='form-control' value="${test.name}" required ></td>
        </tr>
        <tr>
            <td>Test Category</td>
            <td> <select class="form-control" id="test_cat_id" name="category">
                  <c:forEach items="${categories}" var="cat">
                  	<c:if test="${test.category == cat.categoryName }">
                  		<option value="${cat.categoryName}" selected>${cat.categoryName}</option>
                  	</c:if>
                  	<c:if test="${test.category != cat.categoryName }">
                  		<option value="${cat.categoryName}">${cat.categoryName}</option>
                  	</c:if>
                  </c:forEach>
                               
               </select></td>
        </tr>
 
        <!-- <tr>
            <td>Test Charge</td>
            <td><input type='number' name='test_charge' id='test_charge' class='form-control' value="" required></td>
        </tr> -->
        <tr>
            <td>Included Test/Packages :  </td>
            <td><div class="ui-widget">
               <select id="idTest" name="childTestIds" class="form-control selectpicker js-tests" multiple="multiple">
					<c:forEach items="${test.childTests}" var="test">
						<option value="${test.id}" selected>&nbsp;&nbsp;${test.name}</option>
					</c:forEach>
					
					<optgroup label="Test Packages" style="margin-left: 10px">
						<c:forEach items="${tests}" var="test">
							<c:if test="${test.testPackage}">
								<option value="${test.id}">&nbsp;&nbsp;${test.name}</option>
							</c:if>
						</c:forEach>
					<optgroup label="Regular Test" style="margin-left: 10px">
						<c:forEach items="${tests}" var="test">
							<c:if test="${!test.testPackage}">
								<option value="${test.id}">&nbsp;&nbsp;${test.name}</option>
							</c:if>
						</c:forEach>
					</optgroup>
				</select>
			</div></td>
        </tr>
        <tr>
            <td>Abbreviation</td>
            <td><input type='text' name='abbrevation' id='test_abvr' class='form-control' value="${test.abbrevation}"></td>
        </tr>
        
        <tr>
            <td>Report Delivery Days</td>
            <td><input type='number' name='deliveryDays' id='test_days' class='form-control' value="${test.deliveryDays}" required></td>
        </tr>
        <!-- <tr>
            <td>Is Package</td>
            <td><input type='checkbox' name='test_is_pkg' id='test_is_pkg' class='form-control' value="Y"></td>
        </tr>
        <tr>
            <td>Is Listed as single test</td>
            <td><input type='checkbox' name='test_single_show' id='test_single_show' class='form-control' value="Y"></td>
        </tr> -->
        <tr>
            <td>Is Fasting Required</td>
            <td>
            <c:if test="${test.fastingInfo == 'Y'}">
            	<input type='checkbox' name='fastingInfo' id='test_fast' class='form-control' checked="checked" value="Y">
            </c:if>
            <c:if test="${test.fastingInfo == 'N' || test.fastingInfo == null}">
            	<input type='checkbox' name='fastingInfo' id='test_fast' class='form-control' value="Y">
            </c:if>
            </td>
        </tr>
        <tr>
            <td>Short Description</td>
            <td><textarea  name='description' id='test_short_desc' class='form-control'>${test.description}</textarea></td>
        </tr>
        <tr>
            <td>Long Description</td>
            <td><textarea name='longDescription' id='test_long_desc' class='form-control' >${test.longDescription}</textarea></td>
        </tr>
        <tr>
            <td>Display Type</td>
            <td>
            	<select name="testDisplayType">
            		<c:if test="${test.testDisplayType == 'Y' }">
            			<option value="Y" selected>Normal</option>
            		</c:if>
            		<c:if test="${test.testDisplayType == 'C' }">
            			<option value="C" selected>Corporate</option>
            		</c:if>
            		<option value="Y">Normal</option>
            		<option value="C">Corporate</option>
            	</select>
            </td>
        </tr>
        <tr>
        <td colspan="2">
            <div id="submituser">
               <button type="submit" class="btn btn-primary" name="btn-save" id="submit">
                   <span class="glyphicon glyphicon-plus"></span> Update
               </button>  
               <a href="<%=Constants.ADMIN_EDIT_TEST_GET_URL%>" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; Back to index</a>
            </div>
            <!-- <div id="edituser">
                <button type="button" class="btn btn-primary" name="btn-update" id="btn-update">
    			<span class="glyphicon glyphicon-edit"></span>  Update this Record
                </button>
                <a href="test.php" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; CANCEL</a>
            </div>  -->
        
        </td>
            
         
         
        </tr>
 
    </table>
</form>
</div>

   </div>  
  </div>      
</div>
</div>
</div>
    <!-- /#page-wrapper -->
    <!-- /#wrapper -->
</body>

</html>