<%@page import="com.dao.impl.AdminDaoImpl"%>
<%@page import="com.beans.Userbeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.impl.ApiController"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page import="common.database.DbConnection"%>
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
 
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
String redirect_url="userManagementList?clr=appLanguages&act=appLanguages1";
%>
	<%
if(request.getParameter("searchValue") != null && !request.getParameter("searchValue").isEmpty()){
	searchValue=request.getParameter("searchValue");
searchValue =  searchValue.replaceAll("'", "''");
}else{
	searchValue="0";
}
%>
<%@ include file="adminHeader.jsp" %>
	<div class="row">
		<%@ include file="adminSider.jsp" %>
		<div class="col-lg-10 mypadding" style="background-color: #fcfcfc;">
				<div class="container">
        <div class="table-wrapper" style="	margin:15px;">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-4">
						<h2>User Management</h2>
					</div>
					<div class="col-sm-8">
						<a href="#" class="btn btn-info" style="display: none;"><i class="material-icons">&#xE24D;</i> <span>Export to Excel</span></a>
					</div>
                </div>
            </div>
            <div class="table-body">
			  <form class="form-horizontal" role="form" action="insertRegister.jsp" method="post" enctype="multipart/form-data" >
                
                <div class="form-group">
                    <label for="firstName" class="col-sm-12 control-label">Name</label>
                    <div class="col-sm-12">
                         <input name="username" class="form-control" placeholder="Full name" type="text" required autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-12 control-label">Email* </label>
                    <div class="col-sm-12">
                         <input name="email" class="form-control" placeholder="Email address" type="email" required>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="phoneNumber" class="col-sm-12 control-label">Phone number </label>
                    <div class="col-sm-12">
                       <input name="phoneno" class="form-control" placeholder="Phone number" type="text" required>
                    </div>
                </div>
             <div class="form-group">
                    <label for="email" class="col-sm-12 control-label">DOB* </label>
                    <div class="col-sm-12">
                        <div class="input-group date dob" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
							<input class="form-control" size="16" type="text" value="" name="dob" readonly placeholder="Date of birth">
							<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="gender" class="col-sm-12 control-label">Gender </label>
                    <div class="col-sm-12">
                       <select class="form-control" name="gender">
							<option selected="" value="0"> Select gender</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
						</select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="gender" class="col-sm-12 control-label">Category </label>
                    <div class="col-sm-12">
                       <select class="form-control" name="cat">
							<option selected="" value="0"> Select Category</option>
							<option value="1">singer</option>
							<option value="2">lyrics</option>
							<option value="3">model</option>
						</select>
                    </div>
                </div>
              <div class="form-group col-sm-12">
				 <input name="file" class="form-control"  type="file" accept="video/mp4,video/x-m4v,video/*,.mp3,audio/*,.mov" required>
				</div>
                <button type="submit" class="btn btn-primary ">Upload</button>
            </form>
           </div>
           <div class="clearfix">
               
            </div>
        </div>
    </div>
			</div>
		</div>
</body>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript">
$('.dob').datetimepicker({
	format: "yyyy-mm-dd",
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});
</script>
</html>