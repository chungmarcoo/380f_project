<!DOCTYPE html>

<html>
    <head>
        <title>Login</title>
    </head>
    <body>
        <c:if test="${param.error != null}">
            <p>
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Login failed.
                </c:when>
                <c:otherwise>
                    登入失敗
                </c:otherwise>
            </c:choose>
                </p>
        </c:if>
        <c:if test="${param.logout != null}">
            <p>
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                You have logged out.
                </c:when>
                <c:otherwise>
                    你已登出
                </c:otherwise>
            </c:choose>
                </p>
        </c:if>
            <a href="<c:url value="/langage/chinese" />">中文</a>
            <a href="<c:url value="/langage/english" />">English</a>
            <c:out value="${sessionScope.lang}" />
        <h2>
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Login
                </c:when>
                <c:otherwise>
                登入
                </c:otherwise>
            </c:choose>
         
           

        </h2>


        <form action="login" method="POST">
            <label for="username">
                
                 <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Username:
                </c:when>
                <c:otherwise>
                    用戶名稱：
                </c:otherwise>
            </c:choose>
                
                
            
            
            
            </label><br/>
            <input type="text" id="username" name="username" /><br/><br/>
            <label for="password">
                
                
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                Password:
                </c:when>
                <c:otherwise>
                    密碼：
                </c:otherwise>
            </c:choose>
                
                
            
            
            
            
            </label><br/>
            <input type="password" id="password" name="password" /><br/><br/>
            <input type="checkbox" id="remember-me" name="remember-me" />
            <label for="remember-me">
                
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                     Remember me
                </c:when>
                <c:otherwise>
                    記住我
                </c:otherwise>
            </c:choose>
                
               
            </label><br/><br/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <c:choose>
                <c:when test ="${sessionScope.lang=='english'}">
                    <input type="submit" value="Log In"/>
                </c:when>
                <c:otherwise>
                        <input type="submit" value="登入"/>
                </c:otherwise>
            </c:choose>
            
        </form>
    </body>
</html>
