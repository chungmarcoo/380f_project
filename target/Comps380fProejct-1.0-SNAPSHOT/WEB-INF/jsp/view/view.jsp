<!DOCTYPE html>
<html>
    <head>
        <title>Lecture</title>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
            <a href="<c:url value="/lecture/view/langage/chinese" />">中文</a>
            <a href="<c:url value="/lecture/view/langage/english" />">English</a>
            <c:out value="${sessionScope.lang}" />
        <h2>Lecture ${lecture.id}: <c:out value="${lecture.subject}" /></h2>
        <security:authorize access="hasRole('ADMIN') or principal.username=='${lecture.customerName}'">            
            [<a href="<c:url value="/lecture/edit/${lecture.id}" />">
                                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Edit
                </c:when>
                <c:otherwise>
編輯
                </c:otherwise>
            </c:choose>
                
                
                </a>]
        </security:authorize>
        <security:authorize access="hasRole('ADMIN')">            
            [<a href="<c:url value="/lecture/delete/${lecture.id}" />">
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Delete
                </c:when>
                <c:otherwise>
刪除
                </c:otherwise>
            </c:choose>
                
                
                </a>]
        </security:authorize>
        <br /><br />
        <c:if test="${fn:length(lecture.attachments) > 0}">
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
 Lecture Materials:
                </c:when>
                <c:otherwise>
課堂筆記
                </c:otherwise>
            </c:choose>
           
            <c:forEach items="${lecture.attachments}" var="attachment"
                       varStatus="status">
                <c:if test="${!status.first}">, </c:if>
                <a href="<c:url value="/lecture/${lecture.id}/attachment/${attachment.name}" />">
                    <c:out value="${attachment.name}" /></a>
            </c:forEach><br /><br />
        </c:if>

        <table border="1">
            <tr>
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                <th>User</th>
                <th>Comment</th>
                </c:when>
                <c:otherwise>
                <th>用戶</th>
                <th>留言</th>
                </c:otherwise>
            </c:choose>
            </tr>

            <c:choose>
                <c:when test="${fn:length(commentDatabase) == 0}">
                    <tr>
                        <td colspan="2"><i>                 
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
There are no comments.
                </c:when>
                <c:otherwise>
暫時沒有留言
                </c:otherwise>
            </c:choose></i></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${commentDatabase}" var="entry">
                        <tr>
                            <td><c:out value="${entry.username}" /></td>
                            <td><c:out value="${entry.comment}" />
                                <security:authorize access="hasRole('ADMIN') or principal.username=='${entry.username}'">
                                [<a href="<c:url value="deleteComment/${lectureId}/${entry.id}" />">
                                                     <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Delete
                </c:when>
                <c:otherwise>
刪除
                </c:otherwise>
            </c:choose>
                                    
                                    </a>]
                            </security:authorize></td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

        </table><br>

        <a href="<c:url value="/lecture/${lectureId}/comment"/>">
                             <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Leave Comment
                </c:when>
                <c:otherwise>
記得係下面留言 鍾意既就比個like 同埋subscribe
                </c:otherwise>
            </c:choose>
            
            
            </a><br><br>
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
