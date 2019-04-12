<!DOCTYPE html>
<html>
    <head>
        <title>Poll</title>
    </head>
    <body>
        <h2>Poll #${pollId}: <c:out value="${poll.pollTitle}" /></h2>
        Option A: <c:out value="${poll.optionA}" /><br/>
        Option B: <c:out value="${poll.optionB}" /><br/>
        Option C: <c:out value="${poll.optionC}" /><br/>
        Option D: <c:out value="${poll.optionD}" /><br/>
        <a href="<c:url value="/item" />">Return to list polls</a>
    </body>
</html>
