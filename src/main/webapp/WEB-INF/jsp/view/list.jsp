<!DOCTYPE html>
<html>
    <head>
        <!--<title>COMPS380F Bidding</title>-->
        <title>COMPS380F Online Course</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <style>body{font-family: 'Roboto', sans-serif;}</style>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <!--<h2>Bidding Items</h2>-->
        <h2>Course(s)</h2>
        <security:authorize access="hasRole('ADMIN')">
            <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
        </security:authorize>
<!--        <a href="<c:url value="/item/create" />">Create an Item</a><br /><br />-->
            <a href="<c:url value="/item/create" />">Create a Course</a><br /><br />

        <c:choose>
            <c:when test="${fn:length(itemDatabase) == 0}">
                <i>There are no items in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${itemDatabase}" var="entry">
                    Bidding Item ${entry.key}:
                    <a href="<c:url value="/item/view/${entry.key}" />">
                        <c:out value="${entry.value.subject}" /></a>
                    (Expected price: <c:out value="${entry.value.expectedPrice}" />)
                    <security:authorize access="hasRole('ADMIN') or principal.username=='${entry.value.customerName}'">
                        [<a href="<c:url value="/item/edit/${entry.key}" />">Edit</a>]
                    </security:authorize>
                    <security:authorize access="hasRole('ADMIN') or principal.username=='${entry.value.customerName}'">
                        [<a href="<c:url value="/item/delete/${entry.key}" />">Delete</a>]
                    </security:authorize>
                    <br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>
