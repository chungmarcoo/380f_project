<%@page import="ouhk.comps380f.controller.ItemController"%>
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
        <h2>Lecture(s)</h2>

        <c:choose>
            <c:when test="${fn:length(ItemController.itemDatabase)<=0}">
                <i>There are no course in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${ItemController.itemDatabase}" var="entry">
                    Lecture #${entry.key} - Title:
                    <a href="<c:url value="/${entry.key}" />">
                        <c:out value="${entry.value.subject}" /></a>
                    
                    <br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>
