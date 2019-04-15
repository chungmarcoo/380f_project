<!DOCTYPE html>
<html>
    <head>
        <title>Lecture</title>
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

        <h2>Lecture ${lecture.id}: <c:out value="${lecture.subject}" /></h2>
        <a href="<c:url value="/lecture" />"><button>Home</button></a>
        <security:authorize access="hasRole('LECTURER') or principal.username=='${lecture.customerName}'">            
            <a href="<c:url value="/lecture/edit/${lecture.id}" />"><button>Edit</button></a>
        </security:authorize>
        <security:authorize access="hasRole('LECTURER')">            
            <a href="<c:url value="/lecture/delete/${lecture.id}" />"><button>Remove</button></a>
        </security:authorize>
        <br /><br />
        <c:if test="${fn:length(lecture.attachments) > 0}">
            <h2>Materials:</h2>
            <c:forEach items="${lecture.attachments}" var="attachment"
                       varStatus="status">
                <c:if test="${!status.first}">, </c:if>
                <a href="<c:url value="/lecture/${lecture.id}/attachment/${attachment.name}" />">
                    <c:out value="${attachment.name}" /></a>
            </c:forEach><br /><br />
        </c:if>

        <table>
            <tr>
                <th>Comment    <a href="<c:url value="/lecture/${lectureId}/comment"/>"><button>Add</button></a></th>
            </tr>

            <c:choose>
                <c:when test="${fn:length(commentDatabase) == 0}">
                    <tr>
                        <td><i>There are no comments.</i></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${commentDatabase}" var="entry">
                        <tr>
                            <td>(<c:out value="${entry.username}" />):<c:out value="${entry.comment}" />
                                <security:authorize access="hasRole('LECTURER') or principal.username=='${entry.username}'">
                                    <a href="<c:url value="deleteComment/${lectureId}/${entry.id}" />"><button>Remove</button></a>
                                </security:authorize></td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </table><br>
    </body>
</html>
