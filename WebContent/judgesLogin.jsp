<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta-Tags -->
    <!-- Index-Page-CSS -->
    <link rel="stylesheet" href="css/judgestyle.css" type="text/css" media="all">
    <!-- //Custom-Stylesheet-Links -->
    <!--fonts -->
    <link href="//fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400,500,600,700,800" rel="stylesheet">
    <!-- //fonts -->
    <!-- Font-Awesome-File -->
    <link rel="stylesheet" href="css/font-awesome.css" type="text/css" media="all">
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
    <h1 class="title-agile text-center">Judges login form</h1>
    <div class="content-w3ls">
        <div class="agileits-grid">
            <div class="content-top-agile">
                <h2>Login to Judge</h2>
            </div>
            <div class="content-bottom">
                <form action="#" method="post">
                    <div class="field_w3ls">
                        <div class="field-group">
                            <input name="text1" id="text1" type="text" value="" placeholder="username" required>
                        </div>
                        <div class="field-group">
                            <input id="password-field" type="password" class="form-control" name="password" value="" placeholder="Password">
                            <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        </div>
                    </div>
                    <div class="wthree-field">
                        <input id="saveForm" name="saveForm" type="submit" value="Login" />
                    </div>
                    <ul class="list-login">
                        <li class="switch-agileits">
                            <label class="switch">
                                <input type="checkbox">
                                <span class="slider round"></span>
                                keep me signed in
                            </label>
                        </li>
                        <li style="display: none;">
                            <a href="#" class="text-right">forgot password?</a>
                        </li>
                        <li class="clearfix"></li>
                    </ul>
                </form>
            </div>
            <!-- //content bottom -->
        </div>
    </div>
    <div class="copyright text-center">
        <p>© 2020 Core Login Form. All rights reserved | Design by
            <a href="#">Parrot team</a>
        </p>
    </div>
    <!--//copyright-->
   <!-- script for show password -->
    <script>
        $(".toggle-password").click(function () {

            $(this).toggleClass("fa-eye fa-eye-slash");
            var input = $($(this).attr("toggle"));
            if (input.attr("type") == "password") {
                input.attr("type", "text");
            } else {
                input.attr("type", "password");
            }
        });
    </script>
    <!-- /script for show password -->

</body>
<!-- //Body -->

</html>