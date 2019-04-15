<!DOCTYPE html>
<html>

    <head>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!--<link rel="stylesheet" href="/css/add.css">-->
        <title>Add a New Lecture</title>
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
            <a href="<c:url value="/lecture/addNewCourseChinese" />">中文</a>
            <a href="<c:url value="/lecture/addNewCourseEnglish" />">English</a>
            <c:out value="${sessionScope.lang}" />
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
                             <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
<input type="submit" value="Log out" />
                </c:when>
                <c:otherwise>
<input type="submit" value="登出" />
                </c:otherwise>
            </c:choose>

                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
<a href="<c:url value="/lecture/list" />">Home</a>
                </c:when>
                <c:otherwise>
<a href="<c:url value="/lecture/list" />">返回</a>
                </c:otherwise>
            </c:choose>
            
            
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Create a Lecture
                </c:when>
                <c:otherwise>
                    創建課程
                </c:otherwise>
            </c:choose>
            </h2>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm">
            <form:label path="subject">
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Subject
                </c:when>
                <c:otherwise>
                    科目
                </c:otherwise>
            </c:choose>
                </form:label><br/>
            <form:input type="text" path="subject" /><br/><br/>
            <b>
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Course Materials
                </c:when>
                <c:otherwise>
                筆記
                </c:otherwise>
            </c:choose>
                </b><br/>

            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                            <div class="form-group files">
                                <label>
                                                     <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Upload Your File
                </c:when>
                <c:otherwise>
                    上載檔案
                </c:otherwise>
            </c:choose>
                                    </label>
                                                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
<input type="file" name="attachments" multiple="multiple" class="form-control"/>
                </c:when>
                <c:otherwise>
<input type="file" name="檔案" multiple="multiple" class="form-control"/>
                </c:otherwise>
            </c:choose>
                                
                            </div>
                    </div>
                </div>
            </div>


            <br/>
            
            <input type="submit" value="Submit"/>
        </form:form>

    </body>
</html>
