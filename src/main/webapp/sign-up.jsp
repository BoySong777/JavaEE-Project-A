<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index page</title>
    <style>
        @import "assets/bootstrap/css/bootstrap.css";
        @import "assets/styles/global.css";
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">
    <h1>Sign up</h1>
    <form class="col-md-4 col-md-offset-4" action="user?action=signUp" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" name="email" class="form-control">
            <span id="hint">${requestScope.message}</span>
        </div>
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" type="password" class="form-control">
        </div>
        <div class="form-group">
            <label for="avatar">Avatar</label>
            <input id="avatar" name="upload" type="file" class="form-control">
        </div>
        <button id="signUp" type="submit" class="btn btn-success btn-block">Sign up</button>
    </form>
</main>
<footer class="jumbotron"></footer>
<script src="assets/scripts/jquery-3.3.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
<script>
    $(function () {
        $('#email').on('blur', function () {
            var email = $(this).val();
            var signUpBtn = $('#signUp');
            $.ajax({
                url: 'user',
                type: 'post',
                data: {'email': email, 'action': 'checkEmail'},
                dataType: 'json',
                success: function (data) {
                    if (data.emailExisted) {
                        $('#hint').text("Email is Existed!").css('color', '#900');
                        signUpBtn.prop('disabled', true);
                    } else {
                        $('#hint').text("Email is not Exist!").css('color', '#090');
                        signUpBtn.prop('disabled', false);
                    }
                },
                error: function (a, b, c) {
                    console.log((a + ', ' + b + ', ' + c));
                }
            });
        });
    });
</script>
</body>
</html>
