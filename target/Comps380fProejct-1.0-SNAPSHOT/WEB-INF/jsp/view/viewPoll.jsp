<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Poll Page</title>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Question #${pollDatabase.poll_id}:${pollDatabase.question}</h2>
        <p>There are ${pollAllCount} votes.</p>
        <p>You voted to ${Ivote}</p>
        <form:form method="POST" modelAttribute="ansPollForm">
            <form:radiobutton path="chooseOption" value="${pollDatabase.chooseOption1}"/>${pollDatabase.chooseOption1}##${pollCount1}<br>
            <form:radiobutton path="chooseOption" value="${pollDatabase.chooseOption2}"/>${pollDatabase.chooseOption2}##${pollCount2}<br>
            <form:radiobutton path="chooseOption" value="${pollDatabase.chooseOption3}"/>${pollDatabase.chooseOption3}##${pollCount3}<br>
            <form:radiobutton path="chooseOption" value="${pollDatabase.chooseOption4}"/>${pollDatabase.chooseOption4}##${pollCount4}<br><br>
            <form:hidden path="username" value="${principal.username}"/>
            <input type="submit" value="Submit"/>
        </form:form>
        <br>
        <a href="<c:url value="/lecture/poll/list" />">Return to poll page</a>
    </body>
</html>
