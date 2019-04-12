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

                <h2>Question #${poll.poll_id}:${poll.question}</h2>
                <ul>
                    <li>${poll.response1}</li>
                    <li>${poll.response2}</li>
                    <li>${poll.response3}</li>
                    <li>${poll.response4}</li>
                </ul>



    </body>
</html>
