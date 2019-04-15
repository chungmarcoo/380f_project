<!DOCTYPE html>
<html>
<head>
    <title>Create a User</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
            <a href="<c:url value="/view/langage/chinese" />">中文</a>
            <a href="<c:url value="/view/langage/english" />">English</a>
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
          
            <a href="<c:url value="/user" />">last page</a>
                </c:when>
                <c:otherwise>
            <a href="<c:url value="/user" />">返回</a>
                </c:otherwise>
            </c:choose>
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
<h2>Create a User</h2>
                </c:when>
                <c:otherwise>
<h2>創建用戶</h2>
                </c:otherwise>
            </c:choose>

<form:form method="POST" enctype="multipart/form-data"
           modelAttribute="lectureUser">
    <form:label path="username">
        
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Username
                </c:when>
                <c:otherwise>
用戶名稱
                </c:otherwise>
            </c:choose>
        
        </form:label><br/>
    <form:input type="text" path="username" /><br/><br/>
    <form:label path="password">
        
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Password
                </c:when>
                <c:otherwise>
密碼
                </c:otherwise>
            </c:choose>
        
        </form:label><br/>
    <form:input type="text" path="password" /><br/><br/>
    <form:label path="roles">
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Roles
                </c:when>
                <c:otherwise>
                權限
                </c:otherwise>
            </c:choose>
        </form:label><br/>
    <form:checkbox path="roles" value="ROLE_USER" />ROLE_USER
    <form:checkbox path="roles" value="ROLE_ADMIN" />ROLE_ADMIN
    <br /><br />
    <input type="submit" value="Add User"/>
</form:form>
</body>
</html>
