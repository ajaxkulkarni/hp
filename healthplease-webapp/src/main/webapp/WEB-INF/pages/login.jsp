<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<html lang="en">
<head>
	

    <title>Login</title>

	
	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,700,500' rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!--    Star rating css-->
    <link rel="stylesheet" href="<c:url value = "/resources/css/star-rating.min.css"/>" media="all" rel="stylesheet" type="text/css" />
    
    <!-- drawer css -->
    <link rel="stylesheet" href="<c:url value = "/resources/dist/css/drawer.min.css"/>">
    
    <!--    Custom css-->
    <link rel="stylesheet" href="<c:url value = "/resources/css/style.css"/>">
    

	<!-- Start WOWSlider.com HEAD section --> <!-- add to the <head> of your page -->
	<link rel="stylesheet" type="text/css" href="<c:url value = "/resources/engine0/style.css"/>" />
	<!--script type="text/javascript" src="engine0/jquery.js"></script-->
	<!-- End WOWSlider.com HEAD section --></head>
<body>
<div class="clearfix"></div>

<div id="msg" class="container"></div>

<div class="clearfix"></div><br />
<!--Main div where content get loaded-->
   

<!--Add user start from here-->
<div class="container" id="addUser" name="addUser">

    <form method='post' id="form_add_user" action="userController.php">
     
        <table class='table table-bordered'>
     
            <tr>
                <td>Username</td>
                <td><input type='text' name='username' id='username' class='form-control' value=""required ></td>
            </tr>
     
            <tr>
                <td>Password</td>
                <td><input type='password' name='password' id='password' class='form-control' value="" required></td>
            </tr>
     
         
            <tr>
            <input type='hidden' name='token'  class='form-control' value="<?php echo Token::generate();?>" ></td>
            <td colspan="2">
                <div id="submituser">
                   <button type="button" class="btn btn-primary" name="btn-save" id="submit">
                       <span class="glyphicon glyphicon-plus"></span> Login
                   </button>  
                   <a href="register.php" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; Register Me</a>
                </div>
                      
            </td>
                
             
             
            </tr>
     
        </table>
    </form>
</div>
<!--Add user ends here-->

<script>
    $(document).ready(function(){
   
    /***************************
     * Submit new user data
     */      
    $("#submit").on( "click", function(){
        var form=$("#form_add_user");
        $.ajax({
                type:"POST",
                url:form.attr("action"),
                data:form.serialize()+'&action=login',//only input
                success: function(response){
                    if( response == 1 ){
                       window.location = 'lab.php';// $('#msg').html('<div class="alert alert-info"><strong>WOW!</strong> Record was inserted successfully <a href="user.php">HOME</a>!</div>');
                    } else {
                        $('#msg').html('<div class="alert alert-danger">'+response+'</div>');
                    }
                }
            });
        });
    
    
 });
</script>
    </body>
	</html>