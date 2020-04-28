<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOCKDOWN TALENT HUNT</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
<link href="css/style.css" rel="stylesheet" id="bootstrap-css">
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body>
<div class="container">
            <form class="form-horizontal" role="form" action="insertRegister.jsp" method="post" enctype="multipart/form-data" >
                <h2>LOCKDOWN TALENT HUNT</h2>
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
							<option selected="" value="0"> Select gender</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
						</select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="gender" class="col-sm-12 control-label">Category </label>
                    <div class="col-sm-12">
                       <select class="form-control" name="cat">
							<option selected="" value="0"> Select Category</option>
							<option value="1">singer</option>
							<option value="2">lyrics</option>
							<option value="3">model</option>
						</select>
                    </div>
                </div>
              <div class="form-group col-sm-12">
				 <input name="file" class="form-control"  type="file" accept="video/mp4,video/x-m4v,video/*,.mp3,audio/*,.mov" required>
				</div>
                <button type="submit" class="btn btn-primary btn-block">Upload</button>
            </form> <!-- /form -->
        </div> <!-- ./container -->
</body>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript">
$('.dob').datetimepicker({
	format: "yyyy-mm-dd",
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});
</script>
</html>