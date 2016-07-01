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
          <title>Corporate Plans | HealthPlease.in</title>
          <link href="<c:url value="/resources/bootstrap/css/labb_list.css"/>" rel="stylesheet">
 </head>

<body>
<%@include file="user_header.jsp" %>
    <%@include file="admin_header.jsp" %> 

   <div class="container" id="labb_details_div">
        <div class="row">
        <div class="col-xs-5">
             <div class="panel panel-default" style="margin-top:20%">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Lab List</h3>
                </div>
  <ul class="list-group">
    <li class="list-group-item"><button type="button" value="Lab1" onclick="add_labs(this.value);">Lab1</button></li>
    <li class="list-group-item"><button type="button" value="Lab2" onclick="add_labs(this.value);">Lab2</button></li>
    <li class="list-group-item"><button type="button" value="Lab3" onclick="add_labs(this.value);">Lab3</button></li>
    <li class="list-group-item"><button type="button" value="Lab4" onclick="add_labs(this.value);">Lab4</button></li>
</ul>
            </div>
    </div>
        <div class="col-xs-5">
            <div class="panel panel-default" style="margin-top:20%">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Lab Selected</h3>
                </div>
                
                    
  <ul id="mySelect_Lab" class="list-group">

  </ul>

            </div>
        </div>
            
            
                <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Lab Selected Details</h3>
                </div>
                <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                    <th>Lab ID</th>
                        <th> Lab Name</th>
                        <th>Lab Details</th>
                        </tr>
                    </thead>
                    <tbody id="lab_details_dv">
                    
                    
                    </tbody>
                
                </table>
                </div>

            </div>
        </div>
        </div>
    </div>


    
        <script>
   var add_list_menu = document.getElementById("mySelect_Lab");
            var lastid = 0;
function add_labs(val1) {
//    var list = document.getElementById('mySelect_Lab');

    var list_menu=val1;
   
              //create new li element
            var newNumberListItem = document.createElement("li");

                    //create new text node
            var numberListValue = document.createTextNode(list_menu);
    
    //add class
newNumberListItem.className='list-group-item';
    

    
    
    var newContent = document.createElement("BUTTON");
//        var newContent1 = document.createElement("input");
//          newContent1.type = 'checkbox';
                    //add text node to li element
    
     newNumberListItem.appendChild(newContent);
//    newNumberListItem.appendChild(newContent1);
            newContent.appendChild(numberListValue);

                    //add new list element built in previous steps to unordered list
                    //called numberList
            add_list_menu.appendChild(newNumberListItem);   

    newContent.onclick = function () {
    add_lab_details(list_menu);
};
    
    //    newNumberListItem.appendChild(document.createTextNode(numberListValue));
    newNumberListItem.setAttribute('id','labb_list'+lastid);
    var removeButton = document.createElement('button');
    removeButton.appendChild(document.createTextNode("X"));
    removeButton.className='close';
    removeButton.setAttribute('onClick','removeName("'+'labb_list'+lastid+'")');
    newNumberListItem.appendChild(removeButton);
    lastid+=1;
    add_list_menu.appendChild(newNumberListItem);
}
                  
        
</script>
    <script>
    function add_lab_details(lab_val){

        var labb_value=lab_val;
//               alert(labb_value); 
            var lab_del_dv = document.getElementById("lab_details_dv");
       lab_del_dv.innerHTML="<tr><td>101</td><td>"+labb_value+"</td><td>Lab Description</td></tr>";
    }
    
    </script>
    
    
    <script>
    function removeName(itemid){
    var item = document.getElementById(itemid);
    add_list_menu.removeChild(item);
}
    </script>

 
<%@include file="user_footer.jsp" %>
</body>
</html>