<!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Course</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <style>body{font-family: 'Roboto', sans-serif;}
        button > a {text-decoration: none; color: black;}</style>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <br />
        <a href="<c:url value="/item" />">Return to lecture(s) list</a>
        <br /><br />
        <h2>Lecture #${itemId}</h2>
        <security:authorize access="hasRole('ADMIN') or principal.username=='${item.customerName}'">
            <button><a href="<c:url value="/item/edit/${itemId}" />">Edit</a></button>
            <button><a href="<c:url value="/item/delete/${itemId}" />">Delete</a></button>
        </security:authorize>
        <br />

        <p><b>Lecture Title:</b> <c:out value="${item.subject}" /></p>
        <p><b>Lecturer:</b> <c:out value="${item.customerName}" /></p>

        <c:if test="${item.numberOfAttachments > 0}">
            <b>Lecture Notes / Tutorial Notes:</b>
            <ol>
            <c:forEach items="${item.attachments}" var="attachment" varStatus="status">
                <li><a href="<c:url value="/item/${itemId}/attachment/${attachment.name}"/>">${attachment.name}</a></li>
            </c:forEach>
            </ol>
        </c:if>
        <security:authorize access="hasRole('ADMIN') or hasRole('USER')">
            <form:form method="POST" enctype="multipart/form-data" modelAttribute="commentForm">
                <form:label path="comment"><b>Write a comment</b></form:label><br/>
                <form:textarea type="text" path="comment" rows="5" cols="30" /><br/><br/>
                <input type="hidden" name="hidden" value="comment" />
                <input type="submit" value="Add comment"/><br/><br/>
            </form:form>
            <c:if test="${item.getComments().size() > 0}">
                Comments:<br/>
                <c:forEach items="${item.comments}" var="comment" varStatus="status">
                    <hr />
                    <i><c:out value="${comment.name}"/> (User): 
                            <c:out value="${comment.getContent()}"/>                     <security:authorize access="hasRole('ADMIN')">
                                &nbsp;<button><a href="<c:url value="/item/${itemId}/deleteComment" />">Delete</a></button>
                            </security:authorize>
                        <hr />
                    </c:forEach>
                </c:if>
            </security:authorize>
    </body>
</html>
