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

        <h2>Bidding Item #${itemId}</h2>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="itemForm">
            <form:label path="subject">Product Name</form:label><br/>
            <form:input type="text" path="subject" /><br/><br/>
            <form:label path="expectedPrice">Expected Price</form:label><br/>
            <form:input type="text" path="expectedPrice" /><br/><br/>
            <b>Status</b><br />
            <input type="radio" name="status" value="Available"> Available<br/>
            <input type="radio" name="status" value="End"> End<br/><br/>
            <form:label path="description">Description</form:label><br/>
            <form:textarea path="description" rows="5" cols="30" /><br/><br/>
            <c:if test="${item.numberOfAttachments > 0}">
                <b>Attachments:</b><br/>
                <ul>
                    <c:forEach items="${item.attachments}" var="attachment">
                        <li>
                            <c:out value="${attachment.name}" />
                            [<a href="<c:url value="item/${itemId}/delete/${attachment.name}" />">Delete</a>]
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
            <b>Add images</b><br />
            <input type="file" name="attachments" multiple="multiple"/><br/><br/>
            <input type="submit" value="Save"/>
        </form:form>
    </body>
</html>
