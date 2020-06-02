<%@page import="org.json.JSONObject"%>
<%@page import="com.beans.UserRatingBeans"%>
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
<style type="text/css">
	.rating-header {
    margin-top: -10px;
    margin-bottom: 10px;
}
.Disabled{
  pointer-events: none;
  cursor: not-allowed;
  opacity: 0.65;
  filter: alpha(opacity=65);
  -webkit-box-shadow: none;
  box-shadow: none;
}
	
</style>
</head>
<body onload="showonlyone('<%=request.getParameter("clr")%>','<%=request.getParameter("act")%>');">

<%@ include file="adminHeader.jsp" %>
	<div class="row">
		<%@ include file="adminSider.jsp" %>
		<div class="col-lg-10 mypadding" style="background-color: #fcfcfc;">
		<div class="container">
       	 <div class="card" style="margin:10px; border-color: blue;">
            <div class="card-header bg-primary text-white">
                <div class="row">
                    <div class="col-sm-4">
						<h4>User Video</h4>
					</div>
					
                </div>
            </div>
           
            <div class="card-body">
			    <div class="form-group">
                    <label for="firstName" class="col-sm-12 control-label">User Video</label>
                    <div class="col-sm-12">
						 <div class="form-group col-sm-12">
				               <%
				               String adminid=id;
				               String userid=request.getParameter("id");
				               Userbeans userbeans=new Userbeans();
                    			AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
                    			userbeans=adminDaoImpl.getUploadFileSection4(userid);
				             //  out.print("fileeeeeeeeeeeeeeee"+userbeans.getFilename());
				             if(userbeans.getOwnitem().equalsIgnoreCase("0")){
				            	 %>
				            	 <input class="form-control" value="Not file found" readonly="readonly">
				            	 <%
				             }else{
				               String ext = userbeans.getOwnitem().substring(userbeans.getOwnitem().lastIndexOf(".") + 1); 
				               	if(ext.equalsIgnoreCase("mp4")  || ext.equalsIgnoreCase("m4v") || ext.equalsIgnoreCase("f4v") || ext.equalsIgnoreCase("f4a") || ext.equalsIgnoreCase("m4b") || ext.equalsIgnoreCase("m4r") || ext.equalsIgnoreCase("f4b") || ext.equalsIgnoreCase("mov")){
				               			%>
				               				<video style="width: 100%; height: 400px;"  controls>
											  <source src="<%=userbeans.getOwnfilename() %>" type="video/mp4">
											</video>
				               			<%
				               		}else if(ext.equalsIgnoreCase("mp3")  || ext.equalsIgnoreCase("m4a")){
				               			%>
				               				<audio controls class="form-control">
											  <source src="<%=userbeans.getOwnfilename() %>" type="audio/mpeg">
											</audio>
				               			<%
				               		}
				             }
				               %>
								</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-12 control-label">User Family Video</label>
                    <div class="col-sm-12">
						 <div class="form-group col-sm-12">
				               <%
				               if(userbeans.getFamilyitem().equalsIgnoreCase("0")){
					            	 %>
					            	 <input class="form-control" value="Not file found" readonly="readonly">
					            	 <%
					             }else{
				               String familiyext = userbeans.getFamilyitem().substring(userbeans.getFamilyitem().lastIndexOf(".") + 1); 
				               	if(familiyext.equalsIgnoreCase("mp4")  || familiyext.equalsIgnoreCase("m4v") || familiyext.equalsIgnoreCase("f4v") || familiyext.equalsIgnoreCase("f4a") || familiyext.equalsIgnoreCase("m4b") || familiyext.equalsIgnoreCase("m4r") || familiyext.equalsIgnoreCase("f4b") || familiyext.equalsIgnoreCase("mov")){
				               			%>
				               				<video style="width: 100%; height: 400px;"  controls>
											  <source src="<%=userbeans.getFamilyfilename() %>" type="video/mp4">
											</video>
				               			<%
				               		}else if(familiyext.equalsIgnoreCase("mp3")  || familiyext.equalsIgnoreCase("m4a")){
				               			%>
				               				<audio controls class="form-control">
											  <source src="<%=userbeans.getFamilyfilename() %>" type="audio/mpeg">
											</audio>
				               			<%
				               		}
					             }
				               %>
								</div>
                    </div>
                </div>
              <div class="card" style="margin:10px; border-color: blue;">
              <div class="card-header bg-primary text-white">
                <div class="row">
                    <div class="col-sm-4">
						<h4>Admin Video</h4>
					</div>
					
                </div>
           	  </div>
           	  <div class="card-body">
           	  	<% 
           	  	JSONObject jsonObject =new JSONObject();
           	  	adminDaoImpl.getAdminVideo(jsonObject,userid);
           	  	if(jsonObject.getBoolean("status")==false){
           	  	%>
           	  	<form class="form-horizontal" role="form" action="adminVideo.jsp" method="post" enctype="multipart/form-data" name="videoform">
           	  	<input type="hidden" name="userid" value="<%=userid%>">
           	  	<input type="hidden" name="adminid" value="<%=adminid%>">
           	  	
           	  	<div class="form-group">
                    <label for="gender" class="col-sm-12 control-label">Select video </label>
                    <div class="col-sm-12">
                      	 <input name="file" id="file" class="form-control"  type="file" accept="video/mp4,video/x-m4v,video/*,.mp3,audio/*,.mov" required>
                    </div>
                </div>
                <div class="col-sm-12">
                	<input type="submit" value="Upload" class="btn btn-primary" style="float: right;">
                </div>
           	  	</form>
           	  	<%}else{ 
           	  	   
           	  	%>
           	  		<div class="form-group">
                    <label for="gender" class="col-sm-12 control-label">Admin video </label>
                    <div class="col-sm-12">
						<%
						 String ext = jsonObject.getString("itemName").substring(jsonObject.getString("itemName").lastIndexOf(".") + 1); 
		               	if(ext.equalsIgnoreCase("mp4")  || ext.equalsIgnoreCase("m4v") || ext.equalsIgnoreCase("f4v") || ext.equalsIgnoreCase("f4a") || ext.equalsIgnoreCase("m4b") || ext.equalsIgnoreCase("m4r") || ext.equalsIgnoreCase("f4b") || ext.equalsIgnoreCase("mov")){
		            
		               		%>
               				<video style="width: 100%; height: 400px;"  controls>
							  <source src="<%=jsonObject.getString("filename") %>" type="video/mp4">
							</video>
               			<%
               		}else if(ext.equalsIgnoreCase("mp3")  || ext.equalsIgnoreCase("m4a")){
               			%>
               				<audio controls class="form-control">
							  <source src="<%=jsonObject.getString("filename") %>" type="audio/mpeg">
							</audio>
               			<%
               		}
               			%>
                    </div>
                </div>
           	  	<%} %>
             </div>
              <div class="clearfix"></div>
            </div>
           </div>
           <div class="clearfix"></div>
        </div>
    </div>
			</div>
		</div>
</body>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>

</html>