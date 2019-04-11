<!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Course</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <style>
        body{font-family: 'Roboto', sans-serif;}
        button > a{text-decoration: none; color: black;}
        </style>
    </head>
    <body>
        <button><a href="<c:url value="/user/register" />">Register</a></button>
        <button><a href="<c:url value="/login" />">Login</a></button>
        <br /><br />
        <button><a href="<c:url value="/" />">Return to front page</a></button>
        <br /><br />
        <h2>Course #${itemId}</h2>
        
        <p><b>Lecture Title:</b> <c:out value="${item.subject}" /></p>
        <p><b>Lecturer:</b> <c:out value="${item.customerName}" /></p>
        <c:if test="${item.numberOfAttachments > 0}">
            <b>Lecture Notes / Tutorial Notes:</b>
            <c:forEach items="${item.attachments}" var="attachment" varStatus="status">
                <a href="<c:url value="/item/${itemId}/attachment/${attachment.name}"/>">Notes Link</a>
            </c:forEach><br /><br />
        </c:if>
            
            <c:if test="${item.getComments().size() > 0}">
                Comments:<br/>
                <c:forEach items="${item.comments}" var="comment" varStatus="status">
                    <hr />
                    <i><c:out value="${comment.name}"/> (User): 
                            <c:out value="${comment.getContent()}"/>
                        <hr />
                    </c:forEach>
                </c:if>
    </body>
</html>
