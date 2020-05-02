<%@page import="com.admin.servlet.CountByAdminBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.impl.AdminDaoImpl"%>
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
<title>LOCKDOWN TALENT HUNT</title>
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
<%@ include file="adminHeader.jsp" %>
	<div class="row">
		<%@ include file="adminSider.jsp" %>
		<div class="col-lg-10 mypadding" >
         <%
         AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
         CountByAdminBeans countByAdminBeans=new CountByAdminBeans();
         countByAdminBeans=adminDaoImpl.getAllCountByAdmin();
         
         %>
		
			<!-- Content Row -->
        	<div class="row" style="background-color: #ffffff; height: 50px; margin: 15px; border-radius: 5px;">
                <div class="col-lg-12">
                    <h1 class="page-header">Applicants Status</h1>
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
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Applicants</div>
	                      <div class="h5 mb-0 font-weight-bold text-gray-800">
	                        <a href="#" id="usercount" class="spinner-border1"><%=countByAdminBeans.getUsercount() %></a>
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
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Male Applicants</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                         <a href="#" id="maleusercount" class="spinner-border1"><%=countByAdminBeans.getMaleusercount() %></a>
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
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"> Female Applicants</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      	<a href="#" id="femaleusercount" class="spinner-border1"><%=countByAdminBeans.getFemaleusercount()%></a>
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
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Entries Judged</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800 " >
                      	<a href="#" id="declinecount" class="spinner-border1"><%=countByAdminBeans.getEntrires_judges()%></a>
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
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Entries Pending(To be Judged)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800 " >
                      	<a href="#" id="declinecount" class="spinner-border1"><%=countByAdminBeans.getEntrires_pending()%></a>
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
          <!-- Content Row spinner-border -->
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
</html>                                                        