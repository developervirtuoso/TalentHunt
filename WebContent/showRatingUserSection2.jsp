<%@page import="com.beans.UserRatingBeans"%>
<%@page import="com.dao.impl.AdminDaoImpl"%>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" type="text/css" href="css/empdashboard.css">

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
<%
            
				 if(request.getParameter("message")==null){
				    	logger.info("message=>00000000000");
				    }else{
				    	String message = request.getParameter("message").toString();
				    	logger.info("message=>"+message);
				    	if(message.equals("1")){
				    		%>
				    			<div id="deletesuccess">
									<h6 style="color: green">Disapproved</h6>
								</div>
				    		<%
				    	}else if(message.equals("0")){
				    		%>
							<div id="deletesuccess">
								<h6 style="color: red">Failed!</h6>
							</div>
						<%
							}else if(message.equals("2")){
								%>
								<div id="deletesuccess">
									<h6 style="color: green">Approved</h6>
								</div>
							<%
						}
				    } %>

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
						<a href="addUserByAdmin?clr=appLanguages&act=appLanguages1" class="btn btn-info" style=""><i class="material-icons">&#xE24D;</i> <span>Add User</span></a>
					</div>
                </div>
            </div>
			<div class="table-filter">
				<div class="row">
                    <div class="col-sm-3">
						<div class="show-entries">
							<span>Show</span>
							<%@ include file="empOrderByCode.jsp"%>
							<span>entries</span>
						</div>
					</div>
                    <div class="col-sm-9">
                    <form>
                   		<input type="hidden" name="clr" value="appLanguages">
                   		<input type="hidden" name="act" value="appLanguages1">
						<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
						<div class="filter-group">
						 <%
                	if (searchValue.equalsIgnoreCase("0")) {
                		logger.info("searchValue.equalsIgnoreCas");
                %>
							<input type="text" class="form-control"  id="myInput" name="searchValue" placeholder="Search...">
							<%
				} else {
					logger.info("searchValue.equalsIgnoreCas+++else");
			%>
			<input type="text" class="form-control"  id="myInput" name="searchValue" placeholder="Search..." value="<%=searchValue%>">
			<% } %>
						</div>
						</form>
						<span class="filter-icon"><i class="fa fa-filter"></i></span>
                    </div>
                </div>
			</div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>User Name</th>
				        <th>Rating</th>
				        <th>Judge Name</th>
				        <th>Comment</th>
				      </tr>
                </thead>
                <tbody>
                		<%
                		AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
                		String userid=request.getParameter("id");
    try
    {
    	ArrayList<UserRatingBeans> userRatingBeanss=new ArrayList<UserRatingBeans>();
                    int count =0;
                    if(searchValue.equalsIgnoreCase("0")){
                    	String sql="SELECT user.username,user_rating_section2.*,judges.NAME AS judges_name  FROM user_rating_section2 INNER JOIN user ON user.id=user_rating_section2.userid INNER JOIN judges ON judges.id=user_rating_section2.judgeid WHERE user_rating_section2.userid="+userid+" order by user_rating_section2.id desc limit "+page1+","+order2+"";
                    	userRatingBeanss=adminDaoImpl.getUserRatingSection1(sql);
                    }else{
                    	String sql="SELECT user.username,user_rating_section2.*,judges.NAME AS judges_name  FROM user_rating_section2 INNER JOIN user ON user.id=user_rating_section2.userid INNER JOIN judges ON judges.id=user_rating_section2.judgeid WHERE user_rating_section2.userid="+userid+" and (user_rating_section2.id  LIKE '"+searchValue+"%' or user_rating_section2.judgeid LIKE '"+searchValue+"%' or user_rating_section2.rating LIKE '"+searchValue+"%') order by user_rating_section2.id desc limit "+page1+","+order2+"";
                    	userRatingBeanss=adminDaoImpl.getUserRatingSection1(sql);
                    }
                    for(int i=0;i<userRatingBeanss.size();i++){
                    	UserRatingBeans userbeans=userRatingBeanss.get(i);
                		
                		%>
                			 <tr>
            			        <td><%=userbeans.getUserName() %></td>
            			        <td><%=userbeans.getRating() %></td>
            			        <td><%=userbeans.getJadgename() %></td>
            			        <td><%=userbeans.getComment()%></td>
            			     </tr>
                		<%
                	}
               }
               catch(Exception e)
               {
                    e.printStackTrace();
               }
	   %>
                </tbody>
            </table>
            			<%
			 try
			    {
                    int count=0;
                    if(searchValue.equalsIgnoreCase("0")){
                    	String sql="SELECT COUNT(*)  FROM user_rating_section2 WHERE userid="+userid+"";
                    	count=adminDaoImpl.getCountBySql(sql);
                    }else{
                    	String sql="SELECT COUNT(*)  FROM user_rating_section2 WHERE userid="+userid+" and (user_rating_section2.id  LIKE '"+searchValue+"%' or user_rating_section2.judgeid LIKE '"+searchValue+"%' or user_rating_section2.rating LIKE '"+searchValue+"%')";
                    	count=adminDaoImpl.getCountBySql(sql);
                    }
                    	double count1=count;
                    	total_rows=count;
                    	count1=count1/order2;
                    	count1=Math.ceil(count1);
                    	page_count=(int)count1;
    }catch(Exception e){
    	e.printStackTrace();
    }
      	    	 %>
			<div class="clearfix">
               	<%@ include file="paginationCode.jsp"%>
            </div>
        </div>
    </div>
			</div>
		</div>
</body>
 <script type="text/javascript"> 
      $(document).ready( function() {
        /* $('#deletesuccess').delay(1000).fadeOut(); */
       /*  $('#deletesuccess').delay(5000).hide(0); */ 
        $('#deletesuccess').delay(10000).hide(2000); 
      });
    </script>
</html>