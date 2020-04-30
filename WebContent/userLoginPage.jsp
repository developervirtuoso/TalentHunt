<%@page import="com.beans.UserRatingBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.Userbeans"%>
<%@page import="com.dao.impl.AdminDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <link rel="stylesgeet" href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">
    
  <link rel="stylesheet" type="text/css" href="css/userstyle.css">
</head>
<%!
String user_id=null;
String user_email=null;
String user_username="";
String user_ticketid="";
%>
<%
				HttpSession usersession=request.getSession();
				if(usersession.getAttribute("user_id") != null){
					user_id=(String)usersession.getAttribute("user_id").toString();
					user_email=(String)usersession.getAttribute("user_email").toString();
					user_username=(String)usersession.getAttribute("user_username").toString();
					user_ticketid=(String)usersession.getAttribute("user_ticketid").toString();
                	%>
                	<%}else { 
                 response.sendRedirect("userLogin");
                 }
                 %> 
<body class="profile-page">
    <nav class="navbar navbar-color-on-scroll navbar-transparent    fixed-top  navbar-expand-lg "  color-on-scroll="100"  id="sectionsNav">
        <div class="container">
            <div class="navbar-translate">
                <a class="navbar-brand" href="userLoginPage">LOCKDOWN TALENT HUNT</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    <span class="navbar-toggler-icon"></span>
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="dropdown nav-item">
                      <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false">
                          <i class="material-icons">apps</i> Sections
                      </a>
                      <div class="dropdown-menu dropdown-with-icons">
                        <a href="userLoginPage" class="dropdown-item">
                            <i class="material-icons">layers</i> Section 1
                        </a>
                        
                        <a href="http://demos.creative-tim.com/material-kit/docs/2.0/getting-started/introduction.html" class="dropdown-item" style="display: none;">
                            <i class="material-icons">content_paste</i> Documentation
                        </a>
                      </div>
                    </li>
      				<li class="nav-item" style="display: none">
      					<a class="nav-link" href="javascript:void(0)">
      						<i class="material-icons">cloud_download</i> Download
      					</a>
      				</li>
                </ul>
            </div>
        </div>
    </nav>
    <%
    AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
    String id=user_id;
    Userbeans userbeans=new Userbeans();
    userbeans=adminDaoImpl.getUserDetails(id);
    %>
    <div class="page-header header-filter" data-parallax="true" style="background-image:url('img/bg.jpg');"></div>
    <div class="main main-raised">
		<div class="profile-content">
            <div class="container">
                <div class="row">
	                <div class="col-md-6 ml-auto mr-auto">
        	           <div class="profile">
	                        <div class="avatar">
	                            <img src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTU0NjQzOTk4OTQ4OTkyMzQy/ansel-elgort-poses-for-a-portrait-during-the-baby-driver-premiere-2017-sxsw-conference-and-festivals-on-march-11-2017-in-austin-texas-photo-by-matt-winkelmeyer_getty-imagesfor-sxsw-square.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid">
	                        </div>
	                        <div class="name">
	                            <h3 class="title"><%=userbeans.getUsername() %></h3>
	                           <%
                       			if(userbeans.getCat().equalsIgnoreCase("1")){
                       				%><h6 value="1">singer</h6><%
                       			}else if(userbeans.getCat().equalsIgnoreCase("2")){
                       				%><h6 value="2">lyrics</h6><%
                       			}else if(userbeans.getCat().equalsIgnoreCase("3")){
                       				%><h6 value="3">model</h6><%
                       			}
                       		%>
							
	                        </div>
	                    </div>
    	            </div>
                </div>
              	<div class="row">
					<div class="col-md-6 ml-auto mr-auto">
                        <div class="profile-tabs">
                          <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" href="#userProfile" role="tab" data-toggle="tab">
                                  <i class="material-icons">face</i>
                                  Profile
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#files" role="tab" data-toggle="tab">
                                  <i class="material-icons">camera</i>
                                    Files
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#favorite" role="tab" data-toggle="tab">
                                  <i class="material-icons">favorite</i>
                                    Rating
                                </a>
                            </li>
                          </ul>
                        </div>
    	    	</div>
            </div>
        
          <div class="tab-content tab-space">
            <div class="tab-pane active text-center gallery" id="userProfile">
  				<div class="row">
  					<div class="col-md-3 ml-auto">
  					   <label>User Name : </label>
  					</div>
  					<div class="col-md-3 mr-auto">
  						<p><%=userbeans.getUsername()%></p>
  					</div>
  				</div>
  				<div class="row">
  					<div class="col-md-6 ml-auto mr-auto">
  					<hr>
  					</div>
  				</div>
  				
  				<div class="row">
  					<div class="col-md-3 ml-auto">
  					   <label>Email : </label>
  					</div>
  					<div class="col-md-3 mr-auto">
  						<p><%=userbeans.getEmail()%></p>
  					</div>
  				</div>
  				<div class="row">
  					<div class="col-md-6 ml-auto mr-auto">
  					<hr>
  					</div>
  				</div>
  				<div class="row">
  					<div class="col-md-3 ml-auto">
  					   <label>Phone Number</label>
  					</div>
  					<div class="col-md-3 mr-auto">
  						<p><%=userbeans.getPhoneno()%></p>
  						
  					</div>
  				</div>
  				<div class="row">
  					<div class="col-md-6 ml-auto mr-auto">
  					<hr>
  					</div>
  				</div>
  				<div class="row">
  					<div class="col-md-3 ml-auto">
  					   <label>DOB</label>
  					</div>
  					<div class="col-md-3 mr-auto">
  						<p><%=userbeans.getDob()%></p>
  					</div>
  				</div>
  				<div class="row">
  					<div class="col-md-6 ml-auto mr-auto">
  					<hr>
  					</div>
  				</div>
  				<div class="row">
  					<div class="col-md-3 ml-auto">
  					   <label>Gender</label>
  					</div>
  					<div class="col-md-3 mr-auto">
  						<p><%=userbeans.getGender()%></p>
  					</div>
  				</div>
  				<div class="row">
  					<div class="col-md-6 ml-auto mr-auto">
  					<hr>
  					</div>
  				</div>
  				<div class="row">
  					<div class="col-md-3 ml-auto">
  					   <label>Category</label>
  					</div>
  					<div class="col-md-3 mr-auto">
  					<%
                       			if(userbeans.getCat().equalsIgnoreCase("1")){
                       				%><p value="1">singer</p><%
                       			}else if(userbeans.getCat().equalsIgnoreCase("2")){
                       				%><p value="2">lyrics</p><%
                       			}else if(userbeans.getCat().equalsIgnoreCase("3")){
                       				%><p value="3">model</p><%
                       			}
                       		%>
  						
  					</div>
  				</div>
  				<div class="row">
  					<div class="col-md-6 ml-auto mr-auto">
  					<hr>
  					</div>
  				</div>
  			</div>
            <div class="tab-pane text-center gallery" id="files">
      			<div class="row">
      				<div class="col-md-9 ml-auto mr-auto">
                     	<%String ext = userbeans.getFilename().substring(userbeans.getFilename().lastIndexOf(".") + 1); 
               	if(ext.equalsIgnoreCase("mp4")  || ext.equalsIgnoreCase("m4v") || ext.equalsIgnoreCase("f4v") || ext.equalsIgnoreCase("f4a") || ext.equalsIgnoreCase("m4b") || ext.equalsIgnoreCase("m4r") || ext.equalsIgnoreCase("f4b") || ext.equalsIgnoreCase("mov")){
               			%>
               				<video style="width: 100%; height: 100%"  controls>
							  <source src="UploadedFile/User/1.mp4" type="video/mp4">
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
      				
      			</div>
  			</div>
            <div class="tab-pane text-center gallery" id="favorite">
      			<div class="row">
      				<div class="col-md-9 ml-auto mr-auto">
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
                		
    try
    {
    	ArrayList<UserRatingBeans> userRatingBeanss=new ArrayList<UserRatingBeans>();
                    int count =0;
                    String sql="SELECT user.username,user_rating_section1.*  FROM user_rating_section1 INNER JOIN user ON user.id=user_rating_section1.userid WHERE user_rating_section1.userid=1 order by user_rating_section1.id desc ";
                	userRatingBeanss=adminDaoImpl.getUserRatingSection1(sql);
                    for(int i=0;i<userRatingBeanss.size();i++){
                    	UserRatingBeans userRatingBeans=userRatingBeanss.get(i);
                		
                		%>
                			 <tr>
            			        <td><%=userRatingBeans.getUserName() %></td>
            			        <td><%=userRatingBeans.getRating() %></td>
            			        <td><%=userRatingBeans.getJadgename() %></td>
            			        <td><%=userRatingBeans.getComment()%></td>
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
      				  </div>
      				
      			</div>
      		</div>
          </div>

        
            </div>
        </div>
	</div>
	
	<footer class="footer text-center ">
        <p>LOCKDOWN TALENT HUNT</a> by parrot team</p>
    </footer>
    
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>

</body>
<script type="text/javascript" src="js/userfile.js"></script>
</html>