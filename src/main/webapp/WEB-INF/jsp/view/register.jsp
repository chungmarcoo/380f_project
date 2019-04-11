<!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Course</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <style>body{font-family: 'Roboto', sans-serif;}
            .role {display: none;}
        </style>
    </head>
    <body>
        <h2>Register</h2>
        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="biddingUser">
            <form:label path="username">Username</form:label><br/>
            <form:input type="text" path="username" /><br/><br/>
            <form:label path="password">Password</form:label><br/>
            <form:input type="text" path="password" /><br/><br/>
            <div class="role">
            <form:label path="roles">Roles</form:label><br/>
            <form:checkbox path="roles" value="ROLE_USER" checked="checked"/>ROLE_USER
            <form:checkbox path="roles" value="ROLE_ADMIN" />ROLE_ADMIN
            </div>
            <input type="submit" value="Register"/>
        </form:form>
    </body>
</html>