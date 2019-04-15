<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poll Page</title>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
            <a href="<c:url value="/lecture/poll/list/chinese" />">中文</a>
            <a href="<c:url value="/lecture/poll/list/english" />">English</a>
            <c:out value="${sessionScope.lang}" />
        <h1>
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Poll Page
                </c:when>
                <c:otherwise>
投票頁面
                </c:otherwise>
            </c:choose>            
            
            
            </h1>
        
        
        
        
        <a href="<c:url value="/lecture/poll/list/addPoll" />">
     
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Add Poll
                </c:when>
                <c:otherwise>
新增投票
                </c:otherwise>
            </c:choose>
            
        </a><br /><br />

        <c:choose>
            <c:when test="${fn:length(pollDatabase) == 0}">
                                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
  <i>There are no poll in the system.</i>
                </c:when>
                <c:otherwise>
<i>暫時沒有投票</i>
                </c:otherwise>
            </c:choose>
              
            </c:when>
            <c:otherwise>
                <c:forEach items="${pollDatabase}" var="poll">
                                     <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Question #${poll.poll_id}:
                </c:when>
                <c:otherwise>
                問題 #${poll.poll_id}:
                </c:otherwise>
            </c:choose>
                    
                    <a href="<c:url value="${poll.poll_id}" />">
                        <c:out value="${poll.question}" /></a>
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <br>
        <a href="<c:url value="/lecture" />">
                             <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Return to list lectures
                </c:when>
                <c:otherwise>
回到課程列表
                </c:otherwise>
            </c:choose>
            
            
            
            
        </a>
    </body>
</html>
