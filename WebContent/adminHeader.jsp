<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<%!
String email=null;
String adminType=null;
String auth_key="";
String id="";
String team="";
String name="";
String leaderid="";
String username="";

%>


<%
				HttpSession empSession=request.getSession();
				if(empSession.getAttribute("id") != null){
				
						 id=(String)empSession.getAttribute("id").toString();
						 name=(String)empSession.getAttribute("name").toString();
						 username=(String)empSession.getAttribute("username").toString();
			            System.out.println("Enter in if"); 
                	%>


<nav class="navbar  navbar-expand-xl navbar-light">
	<div class="navbar-header d-flex col">
		<a class="navbar-brand" href="empDashboard?clr=appdashboard&act=appdashboard"> <img alt="" src="https://www.virtuosonetsoft.com/images/logo.png" width="100px" height="30px;"> EMPLOYEE</a>  		
		<button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle navbar-toggler ml-auto">
			<span class="navbar-toggler-icon"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	<!-- Collection of nav links, forms, and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
		<ul class="nav navbar-nav navbar-right ml-auto" id="ulid">
			<li class="nav-item" style="display: none;"><a href="#" class="nav-link notifications"><i class="fa fa-bell-o"></i><span class="badge">1</span></a></li>
			<li class="nav-item" style="display: none;"><a href="#" class="nav-link messages"><i class="fa fa-envelope-o"></i><span class="badge">10</span></a></li>
			<li class="nav-item dropdown">
				<a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle user-action" style="color:white;"><img src="https://www.tutorialrepublic.com/examples/images/avatar/2.jpg" class="avatar" alt="Avatar"> <%=name %> <b class="caret"></b></a>
				<ul class="dropdown-menu" >
					<li style=""><a href="#" class="dropdown-item" data-toggle="modal" data-target="#mychangepass" style="color: black !important;"><i class="fa fa-user-o"></i> Change password</a></li>
					<li style="display: none;"><a href="empCalender" class="dropdown-item"><i class="fa fa-calendar-o"></i> Calendar</a></li>
					<li class="divider dropdown-divider" style="display: none;"></li>
					<li><a href="EmpLogout" class="dropdown-item"><i class="material-icons">&#xE8AC;</i> Logout</a></li>
				</ul>
			</li>
		</ul>
	</div>
</nav>
<!-- The Modal -->
<div class="modal" id="mychangepass">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Change Password</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
	
		<!-- Modal body -->
	      <div class="modal-body">
	      		<input type="hidden" name="id" value="<%=id%>">
	       		<input type="password" name="oldpass" id="oldpass" placeholder="Enter old password" class="form-control"><br>
	       		<input type="password" name="newpass" id="newpass" placeholder="Enter new password" class="form-control"><br>
	       		<input type="password" name="confirmpass" id="confirmpass" placeholder="Enter confirm password" class="form-control">
	       		<p id="validate-status"></p>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<input type="button" class="btn btn-primary" value="Submit" onclick="changepassfnc();"> 
 	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
    </div>
  </div>
</div>
<script>
//$("#mychangepass").modal()
$(document).ready(function() {
  $("#confirmpass").keyup(validate);
});


function validate() {
  var newpass = $("#newpass").val();
  var confirmpass = $("#confirmpass").val();

    
 
    if(newpass == confirmpass) {
      // $("#validate-status").text("Matched password");  
       $('#newpass').css('border', 'solid 1px green');
       $('#confirmpass').css('border', 'solid 1px green');
    }
    else {
       // $("#validate-status").text("invalid");  
        $('#newpass').css('border', 'solid 1px red');
        $('#confirmpass').css('border', 'solid 1px red');
       
        return false;
    }
    
}
function changepassfnc() {
	var newpass = $("#newpass").val();
	var oldpass = $("#oldpass").val();
	var confirmpass = $("#confirmpass").val();
	    
	 
	    if(newpass == confirmpass) {
	    	$.ajax({
	    	    type: "GET",
	    	    url: "changeEmpPassByAjax.jsp?newpass="+newpass+"&oldpass="+oldpass+"&id=<%=id%>",
	    	    data: null,
	    	    processData: false,
	    	    contentType: false,
	    	    cache: false,
	    	    timeout: 600000,
	    	    success: function (data) {
	    	    	
	    	    	if(data==3){
	    	    		$("#validate-status").text("Not Match password"); 
	    	    		$('#oldpass').css('border', 'solid 1px red');
	    	    	}else{
	    	    		$("#validate-status").text("Changed password"); 
	    	    		$('#oldpass').css('border', 'solid 1px green');
	    	    		
	    	    	}
	    	    },
	    	    error: function (e) {

	    	      //  $("#result").text(e.responseText);
	    	        console.log("ERROR : ", e);
	    	      

	    	    }
	    	});
	    }
	    else {
	       // $("#validate-status").text("invalid");  
	        $('#newpass').css('border', 'solid 1px red');
	        $('#confirmpass').css('border', 'solid 1px red');
	       
	    }
}

</script>
        
        <%}else { 
                 response.sendRedirect("employeeLogin");
                 }
                 %> 
