<%@page import="com.dao.impl.ApiController"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="common.database.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bootstrap All in One Navbar</title>
<link href="https://fonts.googleapis.com/css?family=Merienda+One" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" type="text/css" href="css/empdashboard.css">


<style type="text/css">
	.pt-37 {
    padding-top: 28px;
    padding-bottom: 17px;
}
h4{
    margin-top: 0;
    padding-top: 0;
    padding-bottom: 0;
    margin-bottom: 0;
}
.pt-38{
margin-bottom: 15px;
}



.profile-img{
    text-align: center;
}
.profile-img img{
    width: 70%;
    height: 100%;
}
.profile-img .file {
    position: relative;
    overflow: hidden;
    margin-top: -20%;
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 15px;
    background: #212529b8;
}
.profile-img .file input {
    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: none;
    border-radius: 1.5rem;
    width: 70%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}
.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
}
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
}
</style>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
</head> 
<body onload="showonlyone('<%=request.getParameter("clr")%>','<%=request.getParameter("act")%>');">
<%!static int count=0;
String fromdate="";
String todate="";
int order2=0;
int page1=0;
int pre=0;
int next=0;
int total_rows=0;
int page_count=0;
int pading_count=0;

String searchValue=null;

Logger logger = Logger.getLogger("empAppraisalList1.jsp");

String redirect_url="empLeave?clr=empleavebyteamid&act=empleavebyteamid";
%>
	<% 

if(request.getParameter("searchValue") != null && !request.getParameter("searchValue").isEmpty()){
	searchValue=request.getParameter("searchValue");
logger.info("searchValue=>>"+searchValue);
searchValue =  searchValue.replaceAll("'", "''");
logger.info("searchValue=>>"+searchValue);
}else{
	searchValue="0";
	logger.info("searchValue=>>"+searchValue);
}
	

%>

<%@ include file="adminHeader.jsp" %>
	<div class="row">

		<%@ include file="adminSider.jsp" %>
		
		
		
		<div class="col-lg-10 mypadding" >
		
         <%
         ApiController apiController=new ApiController();
     	//out.print(jsonObject);
         %>
  
		<div class="row" style="background-color: #ffffff; height: 50px; margin: 15px; border-radius: 5px;">
                <div class="col-lg-12">
                    <h1 class="page-header">Attendance</h1>
                </div>
                <!-- /.col-lg-12 -->
         </div>
		 <%
		 	
		 Date today = new Date(); // Fri Jun 17 14:54:28 PDT 2016
		 Calendar cal = Calendar.getInstance();
		 cal.setTime(today); // don't forget this if date is arbitrary e.g. 01-01-2014

		String mm="00";
		 String yy="0000";
		 int month = cal.get(Calendar.MONTH)+1; // 5
		 if(month<9){
			 mm="0"+month;
		 }else{
			 mm=""+month; 
		 }
		 int year = cal.get(Calendar.YEAR); // 2016
		 String monthyear=mm+"-"+year;
		 String year1=year+"";
		
		
		 
		 %>
			<!-- Content Row -->
          <div class="row">

            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Leave (Annual)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      				<a href="" id="empYearcount" class="spinner-border"></a>
                      </div>
                    </div>
                    <div class="col-auto">
                     <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Late (Annual)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                       
                      				<a  id="empYearLatecount" class="spinner-border"></a>
                      			
                      	
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
           
 			<!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">On Time (Annual)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      			<a class="spinner-border" id="empYearOntimecount"></a>	
                      	
                     </div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">BM (Annual)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                    			
                      	<a class="spinner-border" id="empYearBmcount"></a>	
                      
                      </div>
                    </div>
                    <div class="col-auto">
                     <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            

          </div>
          
			<div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Leave (Monthly)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      
                      			<a class="spinner-border" id="empMonthlycount"></a>	
                      	
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Late (Monthly)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      		
                      		<a class="spinner-border" id="empMonthlyLatecount"></a>	
                      	
                     
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">On Time (Monthly)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      		<a class="spinner-border" id="empMonthlyOntimecount"></a>	
                      	
                     
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
			 <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">BM (Monthly)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      		<a class="spinner-border" id="empMonthlyBmcount"></a>	
                      	
                     
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
           

          </div>
          <div class="row" style="background-color: #ffffff; height: 50px; margin: 15px; border-radius: 5px;">
                <div class="col-lg-12">
                    <h1 class="page-header">Leave</h1>
                </div>
                <!-- /.col-lg-12 -->
         </div>
         <div class="row">
			
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total</div>
	                      <div class="h5 mb-0 font-weight-bold text-gray-800">
	                        <a href="empLeave?clr=empleavebyteamid&act=empleavebyteamid" id="totalcount" class="spinner-border"></a>
	                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Approved</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                         <a href="empLeave?clr=empleavebyteamid&act=empleavebyteamid" id="approvedcount" class="spinner-border"></a>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Pending</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      				<a href="empLeave?clr=empleavebyteamid&act=empleavebyteamid" id="pendingcount" class="spinner-border"></a>
                      			
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
			 <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Decline</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800 " >
                      	<a href="empLeave?clr=empleavebyteamid&act=empleavebyteamid" id="declinecount" class="spinner-border"></a>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fa fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
           </div>
          <!-- Content Row -->
						
			</div>
		</div>
</body>

<script>
	$(document).ready(function(){
		// Add minus icon for collapse element which is open by default
		$(".collapse.show").each(function(){
			$(this).siblings(".card-header").find(".btn i").html("remove");
			$(this).prev(".card-header").addClass("highlight");
		});
		
		// Toggle plus minus icon on show hide of collapse element
		$(".collapse").on('show.bs.collapse', function(){
			$(this).parent().find(".card-header .btn i").html("remove");
		}).on('hide.bs.collapse', function(){
			$(this).parent().find(".card-header .btn i").html("add");
		});
		
		// Highlight open collapsed element 
		$(".card-header .btn").click(function(){
			$(".card-header").not($(this).parents()).removeClass("highlight");
			$(this).parents(".card-header").toggleClass("highlight");
		});
	});
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	 $.ajax({
           type: "GET",
           url: "getEmpLeaveCountByAjax.jsp?id="+<%=id%>,
           dataType: 'JSON',
           data: null,
           processData: false,
           contentType: false,
           cache: false,
           timeout: 600000,
           success: function (data) {
           	 
           	 var myObj, pebcount,pnonebcount,sebcount,snonebcount,tebcount,tnonebcount,totalebcount,totalnonebcount;
           	 myObj=data;
           
           	 document.getElementById("totalcount").innerHTML=myObj.totalcount;
        	document.getElementById("totalcount").classList.remove("spinner-border");
        	
        	document.getElementById("approvedcount").innerHTML=myObj.approvedcount;
        	document.getElementById("approvedcount").classList.remove("spinner-border");
        	
        	document.getElementById("declinecount").innerHTML=myObj.declinecount;
        	document.getElementById("declinecount").classList.remove("spinner-border");
        	
        	document.getElementById("pendingcount").innerHTML=myObj.pendingcount;
        	document.getElementById("pendingcount").classList.remove("spinner-border");

           },
           error: function (e) {

             //  $("#result").text(e.responseText);
               console.log("ERROR : ", e);
             

           }
       });
	 
	 $.ajax({
         type: "GET",
         url: "getAttendanceByAjax.jsp?username=<%=username%>",
         dataType: 'JSON',
         data: null,
         processData: false,
         contentType: false,
         cache: false,
         timeout: 600000,
         success: function (data) {
         	 
         	 var myObj;
         	 myObj=data;
         	console.log("nnnnnnn : ", myObj);
         
        
      	document.getElementById("empYearcount").innerHTML=myObj.empYearcount;
      	if(myObj.empYearcount==0){
      		document.getElementById("empYearcount").href = "#";
      	}else{
      		document.getElementById("empYearcount").href = "showEmpAttendance?clr=appdashboard&act=appdashboard&date=<%=year1%>&type=onleave";
      	}
      	document.getElementById("empYearcount").classList.remove("spinner-border");
      	
      	document.getElementById("empYearLatecount").innerHTML=myObj.empYearLatecount;
      	if(myObj.empYearLatecount==0){
      		document.getElementById("empYearLatecount").href = "#";
      	}else{
      		document.getElementById("empYearLatecount").href = "showEmpAttendance?clr=appdashboard&act=appdashboard&date=<%=year1%>&type=late";
      	}
      	document.getElementById("empYearLatecount").classList.remove("spinner-border");
      	
      	document.getElementById("empYearOntimecount").innerHTML=myObj.empYearOntimecount;
      	if(myObj.empYearOntimecount==0){
      		document.getElementById("empYearOntimecount").href = "#";
      	}else{
      		document.getElementById("empYearOntimecount").href = "showEmpAttendance?clr=appdashboard&act=appdashboard&date=<%=year1%>&type=ontime";
      	}
    	document.getElementById("empYearOntimecount").classList.remove("spinner-border");
    	
      	document.getElementById("empYearBmcount").innerHTML=myObj.empYearBmcount;
      	if(myObj.empYearBmcount==0){
      		document.getElementById("empYearBmcount").href = "#";
      	}else{
      		document.getElementById("empYearBmcount").href = "showEmpAttendance?clr=appdashboard&act=appdashboard&date=<%=year1%>&type=bm";
      	}
    	document.getElementById("empYearBmcount").classList.remove("spinner-border");
    	
      	
      	document.getElementById("empMonthlycount").innerHTML=myObj.empMonthlycount;
      	if(myObj.empMonthlycount==0){
      		document.getElementById("empMonthlycount").href = "#";
      	}else{
      		document.getElementById("empMonthlycount").href = "showEmpAttendance?clr=appdashboard&act=appdashboard&date=<%=monthyear%>&type=onleave";
      	}
    	document.getElementById("empMonthlycount").classList.remove("spinner-border");
    	
      	
      	document.getElementById("empMonthlyLatecount").innerHTML=myObj.empMonthlyLatecount;
      	if(myObj.empMonthlyLatecount==0){
      		document.getElementById("empMonthlyLatecount").href = "#";
      	}else{
      		document.getElementById("empMonthlyLatecount").href = "showEmpAttendance?clr=appdashboard&act=appdashboard&date=<%=monthyear%>&type=late";
      	}
    	document.getElementById("empMonthlyLatecount").classList.remove("spinner-border");
    	
      	document.getElementById("empMonthlyOntimecount").innerHTML=myObj.empMonthlyOntimecount;
      	if(myObj.empMonthlyOntimecount==0){
      		document.getElementById("empMonthlyOntimecount").href = "#";
      	}else{
      		document.getElementById("empMonthlyOntimecount").href = "showEmpAttendance?clr=appdashboard&act=appdashboard&date=<%=monthyear%>&type=ontime";
      	}
    	document.getElementById("empMonthlyOntimecount").classList.remove("spinner-border");
    	
      	document.getElementById("empMonthlyBmcount").innerHTML=myObj.empMonthlyBmcount;
      	if(myObj.empMonthlyBmcount==0){
      		document.getElementById("empMonthlyBmcount").href = "#";
      	}else{
      		document.getElementById("empMonthlyBmcount").href = "showEmpAttendance?clr=appdashboard&act=appdashboard&date=<%=monthyear%>&type=bm";
      	}
    	document.getElementById("empMonthlyBmcount").classList.remove("spinner-border");
      	
      //	document.getElementById("empYearcount").classList.remove("spinner-border");
      	/*
      	document.getElementById("approvedcount").innerHTML=myObj.approvedcount;
      	document.getElementById("approvedcount").classList.remove("spinner-border");
      	
      	document.getElementById("declinecount").innerHTML=myObj.declinecount;
      	document.getElementById("declinecount").classList.remove("spinner-border");
      	
      	document.getElementById("pendingcount").innerHTML=myObj.pendingcount;
      	document.getElementById("pendingcount").classList.remove("spinner-border");*/

         },
         error: function (e) {

           //  $("#result").text(e.responseText);
             console.log("ERROR : ", e);
           

         }
     });

</script>
</html>                                                        