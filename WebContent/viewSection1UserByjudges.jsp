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

	
</style>
</head>
<body onload="showonlyone('<%=request.getParameter("clr")%>','<%=request.getParameter("act")%>');">

<%@ include file="judgesHeader.jsp" %>
	<div class="row">
		<%@ include file="judgesSider.jsp" %>
		<div class="col-lg-10 mypadding" style="background-color: #fcfcfc;">
				<div class="container">
        <div class="card" style="margin:10px; border-color: blue;">
            <div class="card-header bg-primary text-white">
                <div class="row">
                    <div class="col-sm-4">
						<h4>Section 1</h4>
					</div>
					
                </div>
            </div>
            <%
            AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
            String id=request.getParameter("id");
            Userbeans userbeans=new Userbeans();
            userbeans=adminDaoImpl.getUserDetails(id);
            %>
            <div class="card-body">
			    <div class="form-group">
                    <label for="firstName" class="col-sm-12 control-label">Name</label>
                    <div class="col-sm-12">
                         <input name="username" class="form-control" placeholder="Full name" type="text" value="<%=userbeans.getUsername()%>" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-12 control-label">Email* </label>
                    <div class="col-sm-12">
                         <input name="email" class="form-control" placeholder="Email address" type="email" value="<%=userbeans.getEmail()%>" readonly="readonly">
                    </div>
                </div>
                 <div class="form-group">
                    <label for="phoneNumber" class="col-sm-12 control-label">Phone number </label>
                    <div class="col-sm-12">
                       <input name="phoneno" class="form-control" placeholder="Phone number" type="text" value="<%=userbeans.getPhoneno()%>" readonly="readonly">
                    </div>
                </div>
             <div class="form-group">
                    <label for="dob" class="col-sm-12 control-label">DOB* </label>
                    <div class="col-sm-12">
                    <input name="dob" class="form-control" type="text" value="<%=userbeans.getDob()%>" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label for="gender" class="col-sm-12 control-label">Gender </label>
                    <div class="col-sm-12">
                       <select class="form-control" name="gender">
							<option  value="0"> <%=userbeans.getGender() %></option>
							
						</select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="gender" class="col-sm-12 control-label">Category </label>
                    <div class="col-sm-12">
                       <select class="form-control" name="cat">
                       		<%
                       			if(userbeans.getCat().equalsIgnoreCase("1")){
                       				%><option value="1">singer</option><%
                       			}else if(userbeans.getCat().equalsIgnoreCase("2")){
                       				%><option value="2">lyrics</option><%
                       			}else if(userbeans.getCat().equalsIgnoreCase("3")){
                       				%><option value="3">model</option><%
                       			}
                       		%>
							
						</select>
                    </div>
                </div>
              <div class="form-group col-sm-12">
               <%String ext = userbeans.getFilename().substring(userbeans.getFilename().lastIndexOf(".") + 1); 
               	if(ext.equalsIgnoreCase("mp4")  || ext.equalsIgnoreCase("m4v") || ext.equalsIgnoreCase("f4v") || ext.equalsIgnoreCase("f4a") || ext.equalsIgnoreCase("m4b") || ext.equalsIgnoreCase("m4r") || ext.equalsIgnoreCase("f4b") || ext.equalsIgnoreCase("mov")){
               			%>
               				<video style="width: 100%; height: 100%"  controls>
							  <source src="<%=userbeans.getFile() %>" type="video/mp4">
							</video>
               			<%
               		}else if(ext.equalsIgnoreCase("mp3")  || ext.equalsIgnoreCase("m4a")){
               			%>
               				<audio controls class="form-control">
							  <source src="<%=userbeans.getFile() %>" type="audio/mpeg">
							</audio>
               			<%
               		}
               %>
				</div>
				<%if(userbeans.getStatus()==0){
					%>
					<div class="card" style="margin:10px; border-color: blue;">
			            <div class="card-header bg-success text-white">
			                <div class="row">
			                    <div class="col-sm-4">
									<h5>User Rating</h5>
								</div>
								
			                </div>
			            </div>
			            <div class="card-body">
						<form action="CommentSection1ByJudges" method="post">
							<div class="form-group">
			                    <label for="firstName" class="col-sm-12 control-label">Rating</label>
			                    <div class="col-sm-12 " >
			                    	  <input type="hidden" value="<%=judges_id%>" name="judges_id">
			                    	  <input type="hidden" value="<%=id%>" name="userid">
			                    	  <input type="hidden" id="selected_rating" name="selected_rating" value="" required="required">
			                          <div class="form-control" style="height: auto;">
			                    	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="1" id="rating-star-1">
									        <i class="fa fa-star" aria-hidden="true"></i>
									    </button>
									    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="2" id="rating-star-2">
									        <i class="fa fa-star" aria-hidden="true"></i>
									    </button>
									    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="3" id="rating-star-3">
									        <i class="fa fa-star" aria-hidden="true"></i>
									    </button>
									    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="4" id="rating-star-4">
									        <i class="fa fa-star" aria-hidden="true"></i>
									    </button>
									    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="5" id="rating-star-5">
									        <i class="fa fa-star" aria-hidden="true"></i>
									    </button>
									   </div>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label for="firstName" class="col-sm-12 control-label">Comment (Optional)</label>
			                    <div class="col-sm-12">
			                    	<textarea rows="" cols="" name="comment" class="form-control"></textarea>
			                        
			                    </div>
			                </div>
			                <div class="form-group">
			                	<div class="col-sm-12">
			                    	<input type="submit" value="Submit" class="btn btn-primary" style="float: right;">
			                    </div>
			               		 
			               	</div>
						</form>
						</div>
					</div>
					<%
				} %>
				
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
jQuery(document).ready(function($){
    
	$(".btnrating").on('click',(function(e) {
	
	var previous_value = $("#selected_rating").val();
	
	var selected_value = $(this).attr("data-attr");
	$("#selected_rating").val(selected_value);
	
	$(".selected-rating").empty();
	$(".selected-rating").html(selected_value);
	
	for (i = 1; i <= selected_value; ++i) {
	$("#rating-star-"+i).toggleClass('btn-warning');
	$("#rating-star-"+i).toggleClass('btn-default');
	}
	
	for (ix = 1; ix <= previous_value; ++ix) {
	$("#rating-star-"+ix).toggleClass('btn-warning');
	$("#rating-star-"+ix).toggleClass('btn-default');
	}
	
	}));
	
		
});

</script>
</html>