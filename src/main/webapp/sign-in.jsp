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
    <h1>Sign in</h1>
    <form class="col-md-offset-4 col-md-4" action="user" method="post">
        <input type="hidden" name="action" value="signIn">
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" class="form-control" name="email" value="tom@tom.com">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" type="password" class="form-control" name="password" value="123">
        </div>
        <button type="submit" class="btn btn-primary btn-block">Sign in</button>
        ${requestScope.message}
    </form>
</main>
<footer class="jumbotron"></footer>
<script src="assets/scripts/jquery-3.3.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
</body>
</html>
