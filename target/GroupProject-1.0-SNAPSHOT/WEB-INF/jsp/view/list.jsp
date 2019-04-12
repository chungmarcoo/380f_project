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

        <h2>Lecture(s)</h2>
        <security:authorize access="hasRole('ADMIN')">
            <button><a href="<c:url value="/user" />">Manage User Accounts</a></button>
        </security:authorize>
            <button><a href="<c:url value="/item/create" />">Create a Course</a></button>
            <button><a href="<c:url value="/item/createPoll" />">Create a Poll</a></button>
        
        <br><hr><br>

        <c:choose>
            <c:when test="${fn:length(itemDatabase) == 0}">
                <i>There are no course in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${itemDatabase}" var="entry">
                    Lecture ${entry.key}:
                    <a href="<c:url value="/item/view/${entry.key}" />">
                        <c:out value="${entry.value.subject}" /></a>
                    
                    <security:authorize access="hasRole('ADMIN') or principal.username=='${entry.value.customerName}'">
                        <button><a href="<c:url value="/item/edit/${entry.key}" />">Edit</a></button>
                    </security:authorize>
                    <security:authorize access="hasRole('ADMIN') or principal.username=='${entry.value.customerName}'">
                        <button><a href="<c:url value="/item/delete/${entry.key}" />">Delete</a></button>
                    </security:authorize>
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
                    
            <h2>Poll(s)</h2>

        <c:choose>
            <c:when test="${fn:length(pollDatabase) == 0}">
                <i>There are no polls in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${pollDatabase}" var="entry">
                    Poll ${entry.key}:
                    <a href="<c:url value="/item/viewPoll/${entry.key}" />">
                        <c:out value="${entry.value.pollTitle}" /></a>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>
