<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Poll Page</title>
        <style>
            table {
                border-collapse: collapse;
            }

            table, td, th {
                border: 1px solid black;
            }

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

        <h2>Question #${pollDatabase.poll_id}:${pollDatabase.question} (Votes: ${pollAllCount})</h2>
        <a href="<c:url value="/lecture/list" />"><button>Home</button></a>        

        <form:form method="POST" modelAttribute="ansPollForm">
            <table>
                <tr><th><p>Your Vote: ${userVoted}</p></th><th>Count</th></tr>
                        <c:forEach items="${pollOptions}" var="option" varStatus="loop">   
                            <c:if test="${ !empty( option ) }">
                        <tr>
                            <td><form:radiobutton path="chooseOption" value="${option}"/> <c:out value="${option}"/></td>
                            <td><label style="padding-left: 15px">${pollCount[loop.index]}</label></td>
                        </tr>
                    </c:if> 
                </c:forEach>   
            </table>      
            <form:hidden path="username" value="${principal.username}"/>
            <input type="submit" value="Vote"/>
        </form:form>
        <br>           
        <br><br>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Comment <a href="<c:url value="/lecture/${poll_id}/pollcomment"/>"><button>Add</button></a></th>
                </tr>
            </thead>

            <c:choose>
                <c:when test="${fn:length(pollCommentDatabase) == 0}">
                    <tbody>
                        <tr>
                            <td colspan="2"><i>There are no comments.</i></td>
                        </tr>
                    </tbody>
                </c:when>
                <c:otherwise>
                    <tbody>
                        <c:forEach items="${pollCommentDatabase}" var="entry">
                            <tr>
<!--                                    <td><c:out value="${entry.username}" /></td>-->
                                <td>(<c:out value="${entry.username}" />):<c:out value="${entry.comment}" />
                                    <security:authorize access="hasRole('LECTURER')">
                                        <a href="<c:url value="deleteComment/${poll_id}/${entry.id}" />" class="text-danger"><button>Remove</button></a>
                                    </security:authorize></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </c:otherwise>
            </c:choose>
        </table><br>
    </body>
</html>
