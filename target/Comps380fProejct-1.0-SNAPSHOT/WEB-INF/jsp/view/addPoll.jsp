<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Poll Page</title>
    </head>
    <body>
            <a href="<c:url value="/lecture/poll/addPollChinese" />">中文</a>
            <a href="<c:url value="/lecture/poll/addPollEnglish" />">English</a>
            <c:out value="${sessionScope.lang}" />
        
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                <a href="<c:url value="/lecture/list" />">Home</a>
                </c:when>
                <c:otherwise>
                <a href="<c:url value="/lecture/list" />">返回主頁</a>
                </c:otherwise>
                </c:choose>
            
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
            <input type="submit" value="Log out" />
                </c:when>
                <c:otherwise>
            <input type="submit" value="登出" />
                </c:otherwise>
                </c:choose>

            
            
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
<h2>Create a Poll</h2>
                </c:when>
                <c:otherwise>
<h2>建立</h2>
                </c:otherwise>
            </c:choose>
        
        <form:form method="POST" modelAttribute="pollForm">
            <form:label path="question">
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Question:
                </c:when>
                <c:otherwise>
問題：
                </c:otherwise>
                </c:choose>                
                
                
                </form:label><br>
            <form:textarea path="question" rows="5" cols="50" /><br>
            <form:label path="response1">
                
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Answer1:
                </c:when>
                <c:otherwise>
答案1
                </c:otherwise>
                </c:choose>            
            
            
            </form:label><br>
            <form:textarea path="response1" rows="5" cols="50" /><br>
            <form:label path="response2">
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Answer2:
                </c:when>
                <c:otherwise>
答案2
                </c:otherwise>
                </c:choose>                
                
                
                </form:label><br>
            <form:textarea path="response2" rows="5" cols="50" /><br>
            <form:label path="response3">
                
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Answer3:
                </c:when>
                <c:otherwise>
答案3
                </c:otherwise>
                </c:choose>                
                
                
                </form:label><br>
            <form:textarea path="response3" rows="5" cols="50" /><br>
            <form:label path="response4">
                
                
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
 Answer4:
                </c:when>
                <c:otherwise>
答案4
                </c:otherwise>
                </c:choose>               
                
                
               </form:label><br>
            <form:textarea path="response4" rows="5" cols="50" /><br><br>
            <input type="submit" value="Submit"/>
        </form:form>

    </body>
</html>
