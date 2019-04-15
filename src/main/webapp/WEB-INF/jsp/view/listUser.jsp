<!DOCTYPE html>
<html>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

            <a href="<c:url value="/user/langage/chinese" />">中文</a>
            <a href="<c:url value="/user/langage/english" />">English</a>
            <c:out value="${sessionScope.lang}" />
<br /><br />
<a href="<c:url value="/lecture" />">
    
                     <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Return to list lectures
                </c:when>
                <c:otherwise>
回到課程列表
                </c:otherwise>
            </c:choose></a>
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
<h2>Users</h2>
                </c:when>
                <c:otherwise>
                    <h2>用戶</h2>
                </c:otherwise>
            </c:choose>

<a href="<c:url value="/user/create" />">
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Create a User
                </c:when>
                <c:otherwise>
建立用戶
                </c:otherwise>
            </c:choose>
    
    
    </a><br /><br />
<c:choose>
    <c:when test="${fn:length(lectureUsers) == 0}">
        
        <i>
                             <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
There are no users in the system.
                </c:when>
                <c:otherwise>
暫時沒有用戶
                </c:otherwise>
            </c:choose></i>
    </c:when>
    <c:otherwise>
    <table>
        <tr>
                             <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
<th>Username</th><th>Password</th><th>Roles</th><th>Action</th>
                </c:when>
                <c:otherwise>
<th>用戶名稱</th><th>密碼</th><th>權限</th><th>動作</th>
                </c:otherwise>
            </c:choose>
            
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
            [<a href="<c:url value="/user/delete/${user.username}" />">
                                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Delete
                </c:when>
                <c:otherwise>
刪除
                </c:otherwise>
            </c:choose>
                </a>]
            </td>
        </tr>
        </c:forEach>
    </table>
    </c:otherwise>
</c:choose>
</body>
</html>
