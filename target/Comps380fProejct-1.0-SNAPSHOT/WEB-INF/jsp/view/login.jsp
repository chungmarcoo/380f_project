<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
                <style>
            html{
                font-family: sans-serif, monospace;
            }
        </style>
    </head>
    <body>
        <h2>Login</h2>       
        <c:if test="${param.error != null}">
            <p style="color:red">Login failed.</p>
        </c:if>
        <c:if test="${param.logout != null}">
            <p style="color:red">You have logged out.</p>
        </c:if>
        <form action="login" method="POST">
            <label for="username">Username:</label><br/>
            <input type="text" id="username" name="username" /><br/><br/>
            <label for="password">Password:</label><br/>
            <input type="password" id="password" name="password" /><br/><br/>
            <input type="checkbox" id="remember-me" name="remember-me" />
            <label for="remember-me">Remember me</label><br/><br/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" value="Log In"/>
        </form>
            <br/>
        <form action="<c:url value="/register/create" />" method="get">
            <input type="submit" value="Sign Up" />
        </form>
    </body>
</html>