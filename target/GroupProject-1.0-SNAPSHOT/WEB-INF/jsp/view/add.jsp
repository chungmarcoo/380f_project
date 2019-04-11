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

        <h2>Create an Bidding Item</h2>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="itemForm">
            <form:label path="subject">Product Name</form:label><br/>
            <form:input type="text" path="subject" /><br/><br/>
            <form:label path="expectedPrice">Expected Price</form:label><br/>
            <form:input type="text" path="expectedPrice" /><br/><br/>
            <form:label path="description">Description</form:label><br/>
            <form:textarea path="description" rows="5" cols="30" /><br/><br/>
            <b>Images</b><br/>
            <input type="file" name="attachments" multiple="multiple"/><br/><br/>
            <input type="submit" value="Submit"/>
        </form:form>
    </body>
</html>
