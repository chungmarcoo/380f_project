<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Poll Page</title>
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

        <h2>Create a Poll</h2>
        <form:form method="POST" modelAttribute="pollForm">
            <form:label path="question">Question:</form:label><br>
            <form:input path="question"/><br>
            <form:label path="chooseOption1">Answer1:</form:label><br>
            <form:input path="chooseOption1" /><br>
            <form:label path="chooseOption2">Answer2:</form:label><br>
            <form:input path="chooseOption2" /><br>
            <form:label path="chooseOption3">Answer3:</form:label><br>
            <form:input path="chooseOption3" /><br>
            <form:label path="chooseOption4">Answer4:</form:label><br>
            <form:input path="chooseOption4" /><br><br>
            <input type="submit" value="Submit"/>
        </form:form>

    </body>
</html>