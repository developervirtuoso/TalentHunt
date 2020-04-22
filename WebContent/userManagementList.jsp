<%@page import="com.beans.Userbeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.impl.ApiController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Management</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
       
  <div class="card ">
    <div class="card-header bg-primary text-white">
    	<label>User List</label>
    	<a style="float: right;" class="btn btn-success" href="register.jsp">New User</a>
    </div>
    <div class="card-body">
    	<table class="table table-dark table-hover">
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
    	ApiController apiController=new ApiController();
    	ArrayList<Userbeans> userbeanss=new ArrayList<Userbeans>();
    	userbeanss=apiController.getUserList();
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
    %>
     
    </tbody>
  </table>
    </div> 
    
  </div>   
  
</div>

</body>
</html>