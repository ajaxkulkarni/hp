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
    <title>Book online Pathology & Diagnostic Tests in Pune | HealthPlease.in</title>
    
</head>

<body>
<%@include file="user_header.jsp" %>

        <div class="classGoldenDivider"></div>        <div class="classTopHeading">
        <div class="container">
            <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Welcome <span class="nameHolder">Admin</span></h1>
            </div>
        </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
        <div id="msg" class="container"></div>


<!--Add user start from here-->
<div class="container" id="addUser" name="addUser">
   
  <div class="row">
    <%@include file="admin_header.jsp" %> 
<div class="col-lg-9 col-md-9">


<div class="clearfix"></div>

<div id="msg" class="container"></div>

<div class="" id="div_add">
<a href="javascript:void(0);" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Add New Category</a>
</div>

<div class="clearfix"></div><br/>
<!--Main div where content get loaded-->
<div class="" id="loadUser" name="loadUser">

</div>    
<!--Paging div will get content soon-->
<div class="" id="pagination">
    <table class='table table-bordered table-responsive'>
    <tr>
        <td colspan="7" align="center">
            <div class="pagination-wrap">
                <ul class="pagination"><li><a href='javascript:void(0);' data-url='categoriesController.php' data-param='action=pg&page_no=1' style='color:red;' class='js-pageDisplay'>1</a></li><li><a href='javascript:void(0);' data-url='categoriesController.php' data-param='action=pg&page_no=2' class='js-pageDisplay'>2</a></li><li><a href='javascript:void(0);' data-url='categoriesController.php' data-param='action=pg&page_no=3' class='js-pageDisplay'>3</a></li><li><a href='javascript:void(0);' data-url='categoriesController.php' data-param='action=pg&page_no=2' class='js-pageDisplay'>Next</a></li><li><a href='javascript:void(0);' data-url='categoriesController.php' data-param='action=pg&page_no=3' class='js-pageDisplay'>Last</a></li></ul>            </div>
        </td>
    </tr>
    </table>    
</div>   

<!--Add user start from here-->
<div class="" id="addUser" name="addUser">

<form method='post' id="form_add_user" action="categoriesController.php">
 
    <table class='table table-bordered'>
 
        <tr>
            <td>Category Name</td>
            <input type='hidden' name='id' id="id" class='form-control' value="">
            <td><input type='text' name='category_name' id='category_name' class='form-control' value="" required ></td>
        </tr>
 
        <tr>
       
        <td colspan="2">
            <div id="submituser" class=" pull-left">
               <button type="button" class="btn btn-primary" name="btn-save" id="submit">
                   <span class="glyphicon glyphicon-plus"></span> Create New Record
               </button>  
                <a href="categories.php" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; Back to index</a>
            </div>
            <div id="edituser" class=" pull-left">
                &nbsp;<button type="button" class="btn btn-primary" name="btn-update" id="btn-update">
                <span class="glyphicon glyphicon-edit"></span>  Update this Record
                </button>
                <a href="categories.php" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; CANCEL</a>
            </div> 
        
        </td>
            
         
         
        </tr>
 
    </table>
</form>
</div>
<!--Add user ends here-->

<script>
    $(document).ready(function(){
       var page_no = 1; 
     $("#addUser").show();
     $("#div_add").show();
     
       $.ajax({
                type:"POST",
                url:'categoriesController.php',
                data:"action=pg",//only input
                success: function(response){
                    $("#loadUser").html(response); 
                }
            });
     
     
    /*************************
     * To add new user
     */
    $("#add").click( function() {
        $("#loadUser").hide(); $("#pagination").hide();
        $("#addUser").show();
        $("#div_add").hide();
        $("#edituser").hide();
        $('#form_add_user').trigger("reset");
        $("#edituser").hide();
    }); 
    /***************************
     * Submit new user data
     */      
    $("#submit").on( "click", function(){
        var form=$("#form_add_user");
        $.ajax({
                type:"POST",
                url:form.attr("action"),
                data:form.serialize()+"&action=add",//only input
                success: function(response){
                    if( response == 1 ){
                        $('#msg').html('<div class="alert alert-info"><strong>WOW!</strong> Record was inserted successfully <a href="categories.php">HOME</a>!</div>');
                    } else {
                        $('#msg').html('<div class="alert alert-danger">'+response+'</div>');
                    }
                }
            });
        });
    
    
    /********
    * For updation of user to load current user content into form
     */
     $(document).on("click", ".js-edituser", function(){
         var $this = $(this);
         page_no = $this.data('page_no');
        
       $.ajax({
                type:"POST",
                url:'categoriesController.php',
                data:$this.data('value'),//only input
                success: function(response){
                    var obj = $.parseJSON( response );
                    $("#id").val(obj.id);
                    $("#category_name").val(obj.category_name);
                    $("#addUser").show();
                    $("#submituser").hide();
                    $("#edituser").show();
                    $("#loadUser").hide(); $("#pagination").hide();
                    $("#add").hide();
                    
                    
                }
            });
        
    });
    
    /******
    * Actual updation of content starts here
     */
    $("#btn-update").on("click", function(){
            var form=$("#form_add_user");
            $.ajax({
                    type:"POST",
                    url:form.attr("action"),
                    data:form.serialize()+"&action=upd",//only input
                    success: function(response){
                        if( response == 1 ){
                            $('#msg').html('<div class="alert alert-info"><strong>WOW!</strong> Record was updated successfully <a href="categories.php?page_no='+ page_no +'">HOME</a>!</div>');
                            $('#msg').show();
                        } else {
                            $('#msg').html("<div class='alert alert-warning'><strong>SORRY!</strong> ERROR while updating record !</div>");
                            $('#msg').show();

                        }
                    }
            });
        });
    /******
    * updateis done here
     */
     
     /******
    * deletion is start from here 
     */ 
     $(document).on("click",".js-deleteuser", function(){
            $("#add").hide();
            $("#pagination").hide();
            $('#msg').html('<div class="alert alert-danger"><strong>Sure !</strong> to remove the following record ? </div>');
            var $this = $(this);
            page_no = $this.data('page_no');
                $.ajax({
                         type:"POST",
                         url:'categoriesController.php',
                         data:$this.data('value'),//only input
                         success: function(response){
                             $("#loadUser").html(response);                  
                            }
                });

    });
    
    $(".js-pageDisplay").on("click",function(){
        $('.js-pageDisplay').removeClass("redColor");
        $(this).addClass("redColor");
        var $this = $(this);
         $.ajax({
                type:"POST",
                url:$this.data('url'),
                data:$this.data('param'),//only input
                success: function(response){
                     $("#loadUser").html(response);                  
                   }
            });
    });
 });
</script>
    
   </div>  
  </div>      
</div>
        <!-- /#page-wrapper -->
<script>
    $(document).ready(function(){

       $.ajax({
                type:"POST",
                url:'userController.php',
                data:{ action:'viewprofile',
                       id:                    
                     },//only input
                success: function(response){
                    var obj = $.parseJSON( response );
                    $("#id").val(obj.id);
                    $("#username").val(obj.username);
//                    $("#password").val(obj.password);
//                    $("#password_again").val(obj.password);
                    $("#name").val(obj.name);
                    $(".nameHolder").html(obj.name);
                    $("#contact").val(obj.contact);
                    $("#age").val(obj.age);
                    $("#dob").val(obj.dob);
                    if(obj.gender){  $('input:radio[name=gender]')[0].checked = true; } else { $('input:radio[name=gender]')[1].checked = true;  }
                   
                }
            });
            
    /******
    * Actual updation of content starts here
     */
    $("#btn-upd").on("click", function(){
            var form=$("#form_upd_user");
            $.ajax({
                    type:"POST",
                    url:form.attr("action"),
                    data:form.serialize()+"&action=updprofile",//only input
                    success: function(response){
                        if( response == 1 ){
                            $('#msg').html('<div class="alert alert-info"><strong>WOW!</strong> Record was updated successfully <a href="login.php">HOME</a>!</div>');
                            $('#msg').show();
                             $('#form_upd_user').trigger("reset");
                        } else {
                            $('#msg').html("<div class='alert alert-danger'><strong>SORRY!</strong> ERROR while updating record !<br>"+ response  +"</div>");
                            $('#msg').show();

                        }
                    }
            });
        });
        
    /***************************
     * Submit new Appointment data
     ******/      
    $("#add-app").on( "click", function(){
        var form=$("#form_add_app");
        $.ajax({
                type:"POST",
                url:form.attr("action"),
                data:form.serialize()+"&action=addapp",//only input
                success: function(response){
                    if( response == 1 ){
                        $('#msg').html('<div class="alert alert-info"><strong>WOW!</strong> Record was inserted successfully <a href="user.php">HOME</a>!</div>');
                        $("#form_add_app").trigger("reset");
                    } else {
                        $('#msg').html('<div class="alert alert-danger">'+response+'</div>');
                    }
                }
            });
        });
        
        
        /****
        * get test on test category
         */
          $("#cat_id").on("change", function(){
           $.ajax({
                    type:"POST",
                    url:'appoinController.php',
                    data:"action=gettest&test_cat_id="+$("#cat_id").val(),//only input
                    success: function(response){
                       // alert(response);
                       var text = '';
                       var i =0;
                        var json = $.parseJSON( response );
                        for (i = 0; i < json.length; i++) {
                            text += '<div  class="checkbox"><label><input  type="checkbox" name="test[]" value="' + json[i].id + '">'+ json[i].test_name +'</input></label><button type="button" class="btn btn-info">'+ json[i].test_charge +'</button></div>'+ "<br>";
                        }
                        $('#loadTest').html(text);

                    }
            });
          });
          
           /****
            * Load fix time from times table
            */
          $.ajax({
                    type:"POST",
                    url:'appoinController.php',
                    data:"action=gettime",//only input
                    success: function(response){
                       // alert(response);
                       var text = '';
                       var i =0;
                        var json = $.parseJSON( response );
                        for (i = 0; i < json.length; i++) {
                            text += '<div class="checkbox"><label><input type="checkbox" name="time[]" value="' + json[i].id + '">'+ json[i].time +'</input></label></div>'+ "<br>";
                        }
                        $('#laodTime').html(text);

                    }
            });
        
        
        
    });
   
</script>
</div>
</div>
</div>
    <!-- /#wrapper -->
<%@include file="user_footer.jsp" %>
</body>

</html>