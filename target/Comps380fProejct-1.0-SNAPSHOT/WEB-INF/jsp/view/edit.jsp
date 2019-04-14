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
        
<!--        <style>
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
        </style>-->
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
<!--            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group files">-->
<!--                            <label>Upload Your File </label>-->
                            <input type="file" name="attachments" multiple="multiple" class="form-control"/>
<!--                        </div>
                    </div>
                </div>
            </div>-->
            <input type="submit" value="Save"/><br/><br/>
        </form:form>
    </body>
</html>