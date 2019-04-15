<!DOCTYPE html>
<html>
    <head>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Add a New Lecture</title>
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

        <h1>Add a Lecture</h1>
        <a href="<c:url value="/lecture" />"><button>Home</button></a><br/><br/>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm">
            <form:label path="subject">Subject</form:label><br/>
            <form:input type="text" path="subject" /><br/><br/>
            <h2>Materials</h2>
            <label>Upload Your File:(Drag)</label>
            <input type="file" name="attachments" multiple="multiple" class="form-control"/>
            <br/>
            <input type="submit" value="Submit"/>
        </form:form>

    </body>
</html>
