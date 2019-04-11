<%@page import="ouhk.comps380f.controller.ItemController"%>
<!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Bidding</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <style>body{font-family: 'Roboto', sans-serif;}</style>
    </head>
    <body>
            <a href="<c:url value="/user/register" />">Register</a><br /><br />
            <a href="<c:url value="/login" />">Login</a><br /><br />
        <h2>Course List</h2>

        <c:choose>
            <c:when test="${fn:length(ItemController.itemDatabase)<=0}">
                <i>There are no course in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${ItemController.itemDatabase}" var="entry">
                    Bidding Item ${entry.key}:
                    <a href="<c:url value="/${entry.key}" />">
                        <c:out value="${entry.value.subject}" /></a>
                    (Expected price: <c:out value="${entry.value.expectedPrice}" />)
                    
                    <br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>
