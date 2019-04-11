<!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Bidding</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <style>body{font-family: 'Roboto', sans-serif;}</style>
    </head>
    <body>
        <a href="<c:url value="/user/register" />">Register</a><br /><br />
        <a href="<c:url value="/login" />">Login</a><br /><br />
        <br />
        <a href="<c:url value="/" />">Return to front page</a>
        <br /><br />
        <h2>Bidding #${itemId}: <c:out value="${item.subject}" /></h2>
        <br /><br />
        <i>Item Owner - <c:out value="${item.customerName}" /></i><br /><br />
        <i>Expected Price - <c:out value="${item.expectedPrice}" /></i><br /><br />
        <i>Status - <c:out value="${item.status}" /></i><br /><br />
        <i>Current number of bids - <c:out value="${item.noOfBids}" /></i><br /><br />
        <i>Description - <c:out value="${item.description}" /></i><br /><br />
        <c:if test="${item.numberOfAttachments > 0}">
            Images:<br /><br />
            <c:forEach items="${item.attachments}" var="attachment" varStatus="status">
                    <img src="<c:url value="/${itemId}/attachment/${attachment.name}"/> " height="180px" hspace="20">
            </c:forEach><br /><br />
        </c:if>
        <c:if test="${item.status=='end'}">       
            <c:choose>
                <c:when test="${item.winnerName eq 'No Winner'}">
                    No Winner.
                </c:when>
                <c:otherwise>Winner: <c:out value="${item.winnerName}"/>&nbsp;(Price:&nbsp;<c:out value="${item.winnerPrice}"/>)</c:otherwise>
            </c:choose> 
        </c:if>
    </body>
</html>
