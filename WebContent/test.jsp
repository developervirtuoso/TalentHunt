<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
<link href="css/style.css" rel="stylesheet" id="bootstrap-css">
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body>
<div class="container">
            <form class="form-horizontal" role="form">
                <h2>Music World</h2>
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
							<span class="input-group-text"> <i class="fa fa-birthday-cake"></i> </span>
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
							<option selected=""> Select gender</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
						</select>
                       
                    </div>
                </div>
         
		  
                <div class="form-group col-sm-12">
				  <input type="file" id="myFile" name="filename">
				</div>

                
                <button type="submit" class="btn btn-primary btn-block">Upload</button>
            </form> <!-- /form -->
        </div> <!-- ./container -->
		
		
		

		
</body>
</body>
</html>