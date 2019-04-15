

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Add a New Comment                </title>
    </head>
    <body>
        <h1><c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Add a New Comment
                </c:when>
                <c:otherwise>
新增留言
                </c:otherwise>
            </c:choose></h1>
        <form:form method="POST" modelAttribute="commentForm">
            <form:label path="comment">
                                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Leave Comment
                </c:when>
                <c:otherwise>
新增留言
                </c:otherwise>
            </c:choose></form:label>
            <form:input type="text" path="comment"/>
            <form:hidden path="username" value="${principal.username}"/>
            <form:hidden path="lecture_id" value="${lecture.id}"/>
            <input type="submit" value="Comment"/>
        </form:form>
    </body>
</html>
