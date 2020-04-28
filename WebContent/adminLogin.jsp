<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOCKDOWN TALENT HUNT</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"> 
      $(document).ready( function() {
        $('#deletesuccess').delay(10000).fadeOut(2000); 
      });
    </script>
 <link rel="stylesheet" type="text/css" href="css/empStyle.css">
</head>
<body>

<div class="login-form">   
    <%
     if(request.getAttribute("message")==null){
    	System.out.println("message=>00000000000");
    }else{%>
    
    <div id="deletesuccess">
                <h6 style="color: red">${message}</h6>
                </div> 
                
                <%
    	String message = request.getAttribute("message").toString();
    	System.out.println("message=>"+message);
    	
    	
    } 

    %> 
     <%   String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }
        %>
        
     <%
    
     String logintype="";
    %>
     <form role="form" action="adminSignIn" method="post" onsubmit="return siteAdminSignIn()" name="frm">
     <input type="hidden" id="publicip" class="form-control"  name="publicip" value="<%=ip%>">
		<div class="avatar"><i class="material-icons">&#xE7FF;</i></div>
    	<h4 class="modal-title">Login to <%=logintype %> Account</h4>
        <div class="form-group">
            <input type="text" id="email" class="form-control" placeholder="Email" name="email" autofocus required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>
        <div class="form-group small clearfix">
            <label class="checkbox-inline"><input type="checkbox"> Remember me</label>
           
        </div> 
        <input type="submit" class="btn btn-primary btn-block btn-lg" value="Login">              
    </form>			
    <div class="text-center small" style="display: none;">Use different account type: <a href="index">Account type</a></div>
</div>
</body>
</html>                                		                            