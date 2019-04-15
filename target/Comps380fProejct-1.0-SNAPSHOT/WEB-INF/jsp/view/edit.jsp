<!DOCTYPE html>
<html>
    <head>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Edit Lecture Page</title>
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
        <h1>Lecture ${lecture.id}</h1>
        <a href="<c:url value="/lecture" />"><button>Home</button></a><br/><br/>
        <form:form method="POST" enctype="multipart/form-data"  modelAttribute="lectureForm">   
            <form:label path="subject"><b>Subject:</b></form:label><br/>
            <form:input type="text" path="subject" style="width:300px" /><br/><br/>
            <c:if test="${fn:length(lecture.attachments) > 0}">
                <h2>Materials:</h2>
                <ul>
                    <c:forEach items="${lecture.attachments}" var="attachment">
                        <li>
                            <c:out value="${attachment.name}" />
                            <a href="<c:url value="/lecture/${lecture.id}/delete/${attachment.name}"/>"><button>Remove</button></a>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
            <h2>Upload Materials</h2>
            <input type="file" name="attachments" multiple="multiple" class="form-control"/>
            <input type="submit" value="Save"/><br/><br/>
        </form:form>
    </body>
</html>