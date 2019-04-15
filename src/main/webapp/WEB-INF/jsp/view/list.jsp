<!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Web Applications: Design and Development</title>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
            <a href="<c:url value="/langage/chinese" />">中文</a>
            <a href="<c:url value="/langage/english" />">English</a>
            <c:out value="${sessionScope.lang}" />
            <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                 <h2>COMPS380F Web Applications: Design and Development</h2>   
                </c:when>
                <c:otherwise>
                    <h2>COMPS380F網站應用:設計與開發</h2>
                </c:otherwise>
            </c:choose>
        
        <security:authorize access="hasRole('ADMIN')">    
            <a href="<c:url value="/user" />">
                
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                   Manage User Accounts
                </c:when>
                <c:otherwise>
                    管理用戶
                </c:otherwise>
                </c:choose>
            </a><br /><br />
        </security:authorize>
        <a href="<c:url value="/lecture/create" />">      
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                    Add a Lecture
                </c:when>
                <c:otherwise>
                    新增課堂
                </c:otherwise>
                </c:choose>
        </a><br /><br />
        <a href="<c:url value="/lecture/poll/list" />">
            
            
            
        
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                    Poll Page
                </c:when>
                <c:otherwise>
                    投票頁面
                </c:otherwise>
            </c:choose>
        </a><br /><br />
        <c:choose>
            <c:when test="${fn:length(lectureDatabase) == 0}">
                
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                <i>There are no lectures in the system.</i>
                </c:when>
                <c:otherwise>
                <i>暫時沒有課程</i>
                </c:otherwise>
            </c:choose>
                
                
                
            </c:when>
            <c:otherwise>
                <c:forEach items="${lectureDatabase}" var="lecture">
                    
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Lecture
                </c:when>
                <c:otherwise>
                    課程
                </c:otherwise>
            </c:choose>
                     
                    
                    
                    
                    
                    ${lecture.id}:
                    <a href="<c:url value="/lecture/view/${lecture.id}" />">
                        <c:out value="${lecture.subject}" /></a>
                    <security:authorize access="hasRole('ADMIN') or
                                        principal.username=='${lecture.customerName}'">
                        [<a href="<c:url value="/lecture/edit/${lecture.id}" />">       
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Edit
                </c:when>
                <c:otherwise>
                編輯
                </c:otherwise>
            </c:choose> </a>]
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
                </c:choose></a>]
                    </security:authorize>
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>
