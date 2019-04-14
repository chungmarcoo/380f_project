<!DOCTYPE html>
<html>
    <head>
        <title>Admin</title>
                <style>
            html{
                font-family: sans-serif, monospace;
            }
        </style>
    </head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h1>Manage User Accounts</h1>
<a href="<c:url value="/lecture" />"><button>Home</button></a>
<a href="<c:url value="/user/create" />"><button>Create</button></a><br /><br />
<c:choose>
    <c:when test="${fn:length(lectureUsers) == 0}">
        <i>There are no users in the system.</i>
    </c:when>
    <c:otherwise>
    <table>
        <tr>
            <th>Username</th><th>Password</th><th>Roles</th><th>Action</th>
        </tr>
        <c:forEach items="${lectureUsers}" var="user">
        <tr>
            <td>${user.username}</td><td>${user.password}</td>
            <td>
                <c:forEach items="${user.roles}" var="role" varStatus="status">
                    <c:if test="${!status.first}">, </c:if>
                    ${role.role}
                </c:forEach>
            </td>
            <td>
            <a href="<c:url value="/user/delete/${user.username}" />"><button>Remove</button></a>
            </td>
        </tr>
        </c:forEach>
    </table>
    </c:otherwise>
</c:choose>
</body>
</html>
