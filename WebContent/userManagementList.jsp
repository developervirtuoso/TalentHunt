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
String redirect_url="userManagementList?clr=appLanguages&act=appLanguages1&status=1";
%>
	<%
	String status="0";
if(request.getParameter("searchValue") != null && !request.getParameter("searchValue").isEmpty()){
	searchValue=request.getParameter("searchValue");
searchValue =  searchValue.replaceAll("'", "''");
}else{
	searchValue="0";
}
if(request.getParameter("status") != null && !request.getParameter("status").isEmpty()){
	status=request.getParameter("status");

}else{
	status="0";
}
redirect_url="userManagementList?clr=appLanguages&act=appLanguages1&status="+status+"";
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
						<select style="float: right;" name="status">
							<option value="0" <%if(status.equalsIgnoreCase("0")){%> selected="selected"<%} %>>Pending</option>
							<option value="2" <%if(status.equalsIgnoreCase("2")){%> selected="selected"<%} %>>approve</option>
							<option value="1" <%if(status.equalsIgnoreCase("1")){%> selected="selected"<%} %>>disapprove </option>
						</select>
						</form>
						<span class="filter-icon"><i class="fa fa-filter"></i></span>
                    </div>
                </div>
			</div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>User Name</th>
				        <th>Email</th>
				        <th>Phone number</th>
				        <th>DOB</th>
				        <th>Gender</th>
				        <th>Category</th>
				        <th>Status</th>
				        <th>Action</th>
				      </tr>
                </thead>
                <tbody>
                		<%
                		AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
    try
    {
    	ArrayList<Userbeans> userbeanss=new ArrayList<Userbeans>();
                    int count =0;
                    if(searchValue.equalsIgnoreCase("0")){
                    	String sql="select *,(SELECT COUNT(*)  FROM user_rating_section1 WHERE userid=user.id) AS rating_count from user where status="+status+" order by id desc limit "+page1+","+order2+"";
                    	userbeanss=adminDaoImpl.getUserList(sql);
                    }else{
                    	String sql="select *,(SELECT COUNT(*)  FROM user_rating_section1 WHERE userid=user.id) AS rating_count from user where status="+status+" and (id  LIKE '"+searchValue+"%' or name LIKE '"+searchValue+"%') order by id desc limit "+page1+","+order2+"";
                    	userbeanss=adminDaoImpl.getUserList(sql);
                    }
                    for(int i=0;i<userbeanss.size();i++){
                		Userbeans userbeans=userbeanss.get(i);
                		String catname="";
                		if(userbeans.getCat().equals("1")){
                			catname="singer";
                		}else if(userbeans.getCat().equals("2")){
                			catname="lyrics";
                		}else if(userbeans.getCat().equals("3")){
                			catname="model";
                		}
                		%>
                			 <tr>
            			        <td><%=userbeans.getUsername() %></td>
            			        <td><%=userbeans.getEmail() %></td>
            			        <td><%=userbeans.getPhoneno() %></td>
            			        <td><%=userbeans.getDob() %></td>
            			        <td><%=userbeans.getGender() %></td>
            			        <td><%=catname %></td>
            			        <td><% if(userbeans.getStatus()==0){
            			        	%><i class="fa fa-circle" style="font-size:15px;color:orange; "></i><%
            			        }else if(userbeans.getStatus()==1){
            			        	%><i class="fa fa-circle" style="font-size:15px;color:red; "></i><%
            			        }else if(userbeans.getStatus()==2){
            			        	%><i class="fa fa-circle" style="font-size:15px;color:green; "></i><%
            			        }%></td>
            			        <td>
            			        	<a href="viewSection1User?clr=appLanguages&act=appLanguages1&id=<%=userbeans.getId()%>">View</a>
            			        	<%if(userbeans.getRatingCount()>0){
            			        		%><a href="showRatingUserSection1?clr=appLanguages&act=appLanguages1&id=<%=userbeans.getId()%>">Rating[<%=userbeans.getRatingCount() %>]</a><%
            			        	}else{
            			        		%><a href="#">Rating[<%=userbeans.getRatingCount() %>]</a><%
            			        	} %>
            			        	
            			        </td>
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
                    	String sql="select * from user where  status="+status+"";
                    	count=adminDaoImpl.getCountBySql(sql);
                    }else{
                    	String sql="select * from user where  status="+status+" and (id  LIKE '"+searchValue+"%' or name LIKE '"+searchValue+"%')";
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