<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!--<link rel="stylesheet" href="/css/add.css">-->
        <title>Edit the Lecture</title>
        <style>
            .files input {
                outline: 2px dashed #92b0b3;
                outline-offset: -10px;
                -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
                transition: outline-offset .15s ease-in-out, background-color .15s linear;
                padding: 120px 0px 85px 35%;
                text-align: center !important;
                margin: 0;
                width: 100% !important;
            }
            .files input:focus{     outline: 2px dashed #92b0b3;  outline-offset: -10px;
                                    -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
                                    transition: outline-offset .15s ease-in-out, background-color .15s linear; border:1px solid #92b0b3;
            }
            .files{ position:relative}
            .files:after {  pointer-events: none;
                            position: absolute;
                            top: 60px;
                            left: 0;
                            width: 50px;
                            right: 0;
                            height: 56px;
                            content: "";
                            background-image: url(https://image.flaticon.com/icons/png/128/109/109612.png);
                            display: block;
                            margin: 0 auto;
                            background-size: 100%;
                            background-repeat: no-repeat;
            }
            .color input{ background-color:#f1f1f1;}
            .files:before {
                position: absolute;
                bottom: 10px;
                left: 0;  pointer-events: none;
                width: 100%;
                right: 0;
                height: 57px;
                content: " or drag it here. ";
                display: block;
                margin: 0 auto;
                color: #2ea591;
                font-weight: 600;
                text-transform: capitalize;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
            <a href="<c:url value="/lecture/edit/langage/chinese" />">中文</a>
            <a href="<c:url value="/lecture/edit/langage/english" />">English</a>
            <c:out value="${sessionScope.lang}" />
                             <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
<h2>Lecture ${lecture.id}</h2>
                </c:when>
                <c:otherwise>
<h2>課堂 ${lecture.id}</h2>
                </c:otherwise>
            </c:choose>
        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="lectureForm">   
            <form:label path="subject">
                                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Subject
                </c:when>
                <c:otherwise>
標題
                </c:otherwise>
            </c:choose>
                </form:label><br/>
            <form:input type="text" path="subject" /><br/><br/>
            <c:if test="${fn:length(lecture.attachments) > 0}">
                <b>
                                     <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
 Lecture Materials:
                </c:when>
                <c:otherwise>
課堂筆記
                </c:otherwise>
            </c:choose>
                   </b><br/>
                <ul>
                    <c:forEach items="${lecture.attachments}" var="attachment">
                        <li>
                            <c:out value="${attachment.name}" />
                            [<a href="<c:url
                                    value="/lecture/${lecture.id}/delete/${attachment.name}"
                                    />">                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Delete
                </c:when>
                <c:otherwise>
刪除
                </c:otherwise>
            </c:choose></a>]
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
            <b>
                                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Lecture Materials
                </c:when>
                <c:otherwise>
課堂筆記
                </c:otherwise>
            </c:choose></b><br />
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group files">
                            <label>                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Upload Your File
                </c:when>
                <c:otherwise>
上載檔案
                </c:otherwise>
            </c:choose> </label>
                            <input type="file" name="attachments" multiple="multiple" class="form-control"/>
                        </div>
                    </div>
                </div>
            </div>
            <input type="submit" value="Save"/><br/><br/>
        </form:form>
        <a href="<c:url value="/lecture" />">
                             <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
Return to list lectures
                </c:when>
                <c:otherwise>
回到課堂列表
                </c:otherwise>
            </c:choose></a>
    </body>
</html>