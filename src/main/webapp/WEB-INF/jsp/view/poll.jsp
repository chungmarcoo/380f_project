<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poll Page</title>
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
                <br>
                <h1>Poll Page</h1> 
                <a href="<c:url value="/lecture" />"><button>Home</button></a>
        
                <security:authorize access="hasRole('LECTURER')"><a href="<c:url value="/lecture/poll/list/addPoll" />"><button>Add[+]</button></a></security:authorize>

        <c:choose>
            <c:when test="${fn:length(pollDatabase) == 0}">
                <i>There are no poll in the system.</i>
            </c:when>
            <c:otherwise>
                <label><h2>Poll:</h2></label>
                <c:forEach items="${pollDatabase}" var="poll">
                    #${poll.poll_id}:
                    <a href="<c:url value="${poll.poll_id}" />">
                        <c:out value="${poll.question}" /></a>
                        <security:authorize access="hasRole('LECTURER')">            
                            <a href="<c:url value="/lecture/poll/delete/${poll.poll_id}" />"><button>Remove</button></a>
                    </security:authorize>
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>

    </body>
</html>
