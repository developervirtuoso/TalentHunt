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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head> 
<body>

<div class="container">
  <h2>Stacked form</h2>
 		 <form action="uploadFileAndDocSection3.jsp" method="post" enctype="multipart/form-data">
	           <input type="hidden" value="6" name="userid">
	           		<div class="form-group">
						<label for="file_name">Upload Document :</label>
						<input type="file" class="form-control" id="doc_name"  name="doc_name"  multiple="multiple" required>
					</div>
					<div class="form-group">
						<label for="file_name">Upload File :</label>
						<input type="file" class="form-control" id="file_name"  name="file_name"  accept="video/mp4,video/x-m4v,video/*,.mp3,audio/*,.mov" required>
					</div>
				   <button type="submit" class="btn btn-success" style="background-color: #4caf50; color: white;">Upload</button>
		  </form>
</div>

</body>


</html>                                                        