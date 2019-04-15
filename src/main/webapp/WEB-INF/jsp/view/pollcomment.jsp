<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Comment</title>
        <style>
            html{
                font-family: sans-serif, monospace;
            }
            
            input[type='text']{
                width:300px;
            }
        </style>
    </head>
    <body>
        <h1>New Comment</h1>
        <form:form method="POST" modelAttribute="pollCommentForm">
            <form:label path="comment">Comment</form:label>
            <form:input type="text" path="comment"/>
            <form:hidden path="username" value="${principal.username}"/>
            <form:hidden path="poll_id" value="${poll.id}"/>
            <input type="submit" value="Add" />
        </form:form>

    </body>
</html>