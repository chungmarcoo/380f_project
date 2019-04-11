 <!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Course</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <style>body{font-family: 'Roboto', sans-serif;}</style>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Create an Bidding Item</h2>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="editUserForm">
            <label for="oldPwd">old Password</label><br/>
            <input type="text" name="oldPwd" id="oldPwd" /><br/><br/>
            <form:label path="password">New Password</form:label><br/>
            <form:input type="text" path="password" /><br/><br/>
            <input type="submit" value="Submit"/>
        </form:form>
    </body>
</html>