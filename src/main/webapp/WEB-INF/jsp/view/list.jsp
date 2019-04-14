<!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Web Applications: Design and Development</title>
        <style>
            html{
                font-family: sans-serif, monospace;
            }
        </style>
    </head>
    <body>
        <security:authorize access="!isAuthenticated()">
            <a href="<c:url value="/login"/>"><button>Login</button></a>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="Log out" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </security:authorize>

        <h1>COMPS380F Web Applications: Design and Development</h1>
        <security:authorize access="hasRole('LECTURER')">    
            <a href="<c:url value="/user" />"><button>Manage Accounts</button></a>
            <a href="<c:url value="/lecture/create" />"><button>New Lecture</button></a>
            <a href="<c:url value="/lecture/poll/list/addPoll" />"><button>New Poll</button></a>
        </security:authorize>

        <h2>Lecture</h2>
        <c:choose>
            <c:when test="${fn:length(lectureDatabase) == 0}">
                <i>There are no lectures in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${lectureDatabase}" var="lecture">
                    #${lecture.id}:
                    <a href="<c:url value="/lecture/view/${lecture.id}" />">
                        <c:out value="${lecture.subject}" /></a>
                        <security:authorize access="isAuthenticated() and (hasRole('LECTURER') or
                                            principal.username=='${lecture.customerName}')">
                        <a href="<c:url value="/lecture/edit/${lecture.id}" />"><button>Edit</button></a>
                    </security:authorize>
                    <security:authorize access="isAuthenticated() and (hasRole('LECTURER'))">            
                        <a href="<c:url value="/lecture/delete/${lecture.id}" />"><button>Remove</button></a>
                    </security:authorize>
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>

        <h2>Poll</h2>
<!--        <a href="<c:url value="/lecture/poll/list" />">Poll Page</a><br/><br/>-->
        <c:choose>
            <c:when test="${fn:length(pollDatabase) == 0}">
                <i>There are no polls in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${pollDatabase}" var="poll">
                    #${poll.poll_id}:
                    <a href="<c:url value="/lecture/poll/${poll.poll_id}" />">
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