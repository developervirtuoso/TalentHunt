<%@page import="com.dao.impl.AdminDaoImpl"%>
<%@page import="com.beans.Userbeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.impl.ApiController"%>
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

String redirect_url="empAppraisalList?clr=appLanguages&act=appLanguages1";
%>
	<% 

	
Connection conn=DbConnection.getInstance().getConnection(); 
Statement stmt=null;
Statement stmt1=null;

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
		<div class="col-lg-10 mypadding" style="background-color: #fcfcfc;">
				<div class="container">
        <div class="table-wrapper" style="	margin:15px;">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-4">
						<h2>Appraisal</h2>
					</div>
					<div class="col-sm-8">						
					
						<a href="#" class="btn btn-info" style="display: none;"><i class="material-icons">&#xE24D;</i> <span>Export to Excel</span></a>
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
				        <th>Email</th>
				        <th>Phone number</th>
				        <th>DOB</th>
				        <th>Gender</th>
				        <th>Category</th>
				        <th>File Name</th> 
				      </tr>
                </thead>
                <tbody>
                		<%
				
    try
    {
    	AdminDaoImpl apiController=new AdminDaoImpl();
    	ArrayList<Userbeans> userbeanss=new ArrayList<Userbeans>();
                    stmt=conn.createStatement();
                    ResultSet rs=null;
                    int count =0;
                    if(searchValue.equalsIgnoreCase("0")){
                    	String sql="select * from user order by id desc limit "+page1+","+order2+"";
                    	userbeanss=apiController.getUserList(sql);
                    }else{
                    	String sql="select * from user where (id  LIKE '"+searchValue+"%' or name LIKE '"+searchValue+"%') order by id desc limit "+page1+","+order2+"";
                    	userbeanss=apiController.getUserList(sql);
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
            			        <td><%=userbeans.getFilename() %></td>
            			      </tr>
                		<%
                	}
                    
               }
               catch(Exception e)
               {
                    e.printStackTrace();
               }finally
      	     {
      	    	   try {
      	    	         if (stmt != null)
      	    	        	 stmt.close();
      	    	      } catch (SQLException ignore) {} // no point handling
      	    	 }
	   %>
                </tbody>
            </table>
            			<%
            			/*
 try
    {
                     stmt1=conn.createStatement();
                    ResultSet rs=null;
                    if(searchValue.equalsIgnoreCase("0")){
                    	logger.info("searchValue.equalsIgnoreCas");
                    	rs=stmt1.executeQuery("select count(*) from appraisal where appraisal.employeeid="+id+"");
                    }else{
                    	logger.info("searchValue.equalsIgnoreCas+++else");
                    	rs=stmt1.executeQuery("select count(*) from appraisal where appraisal.employeeid="+id+" and appraisal.id  LIKE '"+searchValue+"%'");
                    }
                    while(rs.next())
                    {
                    	double count1=rs.getInt(1);
                    	total_rows=rs.getInt(1);
                    	logger.info("count1=>>"+count1);
                    	logger.info("total_rows=>>"+total_rows);
                    	count1=count1/order2;
                    	logger.info("count1=>>"+count1);
                    	count1=Math.ceil(count1);
                    	logger.info("count1=>>"+count1);
                    	page_count=(int)count1;
                    	logger.info("page_count=>>"+page_count);
                    }
                    
                    rs.close();
                    stmt1.close();
                    conn.close();
                    
    }catch(Exception e){
    	e.printStackTrace();
    }finally
      	     {
      	    	 try {
      	    	         if (conn != null)
      	    	      	conn.close();
      	    	      } catch (SQLException ignore) {} // no point handling

      	    	   try {
      	    	         if (stmt1 != null)
      	    	        	 stmt1.close();
      	    	      } catch (SQLException ignore) {} // no point handling
      	    	 }
      	    	 */
      	    	 %>
			<div class="clearfix">
             
               	<%@ include file="paginationCode.jsp"%>
            </div>
        </div>
    </div>  
			</div>
		</div>
</body>

</html>                                                        