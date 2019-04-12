<!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Course</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <style>body{font-family: 'Roboto', sans-serif;}
                    input[type="file"] {
                border: 2px solid gray;
                padding: 8px 20px;
                border-radius: 8px;
            }
            button > a {text-decoration: none; color: black;}
        </style>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Lecture #${itemId} ${item.subject}</h2>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="itemForm">
            <form:label path="subject">Lecture Title</form:label><br/>
            <form:input type="text" path="subject" /><br/><br/>
            <form:label path="description">Description</form:label><br/>
            <form:textarea path="description" rows="5" cols="30" /><br/><br/>
            <c:if test="${item.numberOfAttachments > 0}">
                <b>Lecture Notes / Tutorial Notes:</b>
                <ul>
                    <c:forEach items="${item.attachments}" var="attachment">
                        <li>
                            <c:out value="${attachment.name}" />
                            <button><a href="<c:url value="item/${itemId}/delete/${attachment.name}" />">Delete</a></button>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
            <b>Add attachments</b><br />
            <input type="file" name="attachments" multiple="multiple"/><br/><br/>
            <input type="submit" value="Save"/>
        </form:form>
    </body>
</html>
