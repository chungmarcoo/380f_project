 <!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Bidding</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <style>body{font-family: 'Roboto', sans-serif;}</style>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Create a Poll</h2>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="pollForm">
            <form:label path="pollTitle">Poll Title</form:label><br/>
            <form:input type="text" path="pollTitle" /><br/><br/>
            <b>Option</b><br/>
            A<form:input type="text" path="optionA" />
            B<form:input type="text" path="optionB" />
            C<form:input type="text" path="optionC" />
            D<form:input type="text" path="optionD" />
            <input type="submit" value="Submit"/>
        </form:form>
    </body>
</html>
