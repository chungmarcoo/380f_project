<!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Bidding</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <style>body{font-family: 'Roboto', sans-serif;}</style>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <br />
        <a href="<c:url value="/item" />">Return to list items</a>
        <br /><br />
        <h2>Bidding #${itemId}: <c:out value="${item.subject}" /></h2>
        <security:authorize access="hasRole('ADMIN') or principal.username=='${item.customerName}'">
            [<a href="<c:url value="/item/edit/${itemId}" />">Edit</a>]
            [<a href="<c:url value="/item/delete/${itemId}" />">Delete</a>]
        </security:authorize>
        <security:authorize access= "principal.username!='${item.customerName}'">
            <c:choose>
                <c:when test="${item.checkHasBidded(username) == false}">
                    <c:if test="${item.status == 'Available'}">
                        <form:form method="POST" enctype="multipart/form-data" modelAttribute="biddingPriceForm">
                        <form:label path="bidPrice">Bid price</form:label><br/>
                        <form:input type="text" path="bidPrice" /><br/>
                        <input type="hidden" name="hidden" value="bid" />
                        <input type="submit" value="Bid"/>
                        </form:form>
                    </c:if>
                </c:when>
                <c:otherwise>
                    You have bidden this item already! Thank you!
                </c:otherwise>
            </c:choose>
        </security:authorize>
        <br /><br />
        <i>Item Owner - <c:out value="${item.customerName}" /></i><br /><br />
        <i>Expected Price - <c:out value="${item.expectedPrice}" /></i><br /><br />
        <i>Status - <c:out value="${item.status}" /></i><br /><br />
        <i>Current number of bids - <c:out value="${item.noOfBids}" /></i><br /><br />
        <i>Description - <c:out value="${item.description}" /></i><br /><br />
        <c:if test="${item.numberOfAttachments > 0}">
            Images:<br /><br />
            <c:forEach items="${item.attachments}" var="attachment" varStatus="status">
                    <img src="<c:url value="/item/${itemId}/attachment/${attachment.name}"/> " height="180px" hspace="20">
            </c:forEach><br /><br />
        </c:if>
        <security:authorize access="hasRole('ADMIN') or hasRole('USER')">
            <form:form method="POST" enctype="multipart/form-data" modelAttribute="commentForm">
                <form:label path="comment">Write a comment</form:label><br/>
                <form:input type="text" path="comment" /><br/><br/>
                <input type="hidden" name="hidden" value="comment" />
                <input type="submit" value="Add comment"/><br/><br/>
            </form:form>
            <c:if test="${item.getComments().size() > 0}">
                Comments:<br/>
                <c:forEach items="${item.comments}" var="comment" varStatus="status">
                    <hr />
                    <i>User - <c:out value="${comment.name}"/>: <br/>
                    <security:authorize access="hasRole('ADMIN')"><br/>
                        [<a href="<c:url value="/item/${itemId}/deleteComment" />">Delete</a>]<br/><br/>
                    </security:authorize>
                    <c:out value="${comment.getContent()}"/><br/>
                    <hr />
                </c:forEach>
            </c:if>
        </security:authorize>
        <security:authorize access="principal.username=='${item.customerName}'">
            <h3>Bidding History</h3>
            <c:choose>
                <c:when test="${item.noOfBids > 0 && item.status != 'end'}">
                    <form:form method="POST" enctype="multipart/form-data" modelAttribute="bidderWinnerForm">
                        <input type="radio" name="winnerName" value="No Winner">No Winner<br />
                        <c:forEach items="${item.getBidPrice()}" var="bidPrice" varStatus="status">
                            <input type="radio" name="winnerName" value="${bidPrice.bidder}"><c:out value="${bidPrice.bidder}"/>:&nbsp;<c:out value="${bidPrice.bidderPrice}"/><br><br/>
                        </c:forEach>
                        <input type="hidden" name="hidden" value="winner" />
                        <input type="submit" value="Submit"/><br/><br/>
                    </form:form>
                </c:when>
                <c:when test="${item.status == 'end'}">
                    Bid End!<br />
                </c:when>
                <c:otherwise>
                    No one bid.<br />
                </c:otherwise>
            </c:choose>
        </security:authorize>
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
