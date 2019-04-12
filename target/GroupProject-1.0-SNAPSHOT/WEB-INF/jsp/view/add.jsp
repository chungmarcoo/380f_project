<!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F Course</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <style>body{font-family: 'Roboto', sans-serif;}
            input[type="file"] {
                border: 2px solid gray;
                padding: 8px 20px;
                border-radius: 8px;
            }
        </style>

        <script>
            function getFileNames() {
                var files = document.querySelector('.attachments').files
                var fileNames = []
                for (let file of files) {
                    fileNames.push(file.name)
                }
                var fileNamesOutput = document.querySelector('#fileList')
                fileNamesOutput.removeChild(fileNamesOutput.childNodes[0])

                if (fileNames.length > 1) {
                    for (let fileName of fileNames) {
                        let li = document.createElement('li')
                        li.innerHTML = fileName
                        fileNamesOutput.appendChild(li)
                    }
                } else if (fileNames.length = 1) {
                    let li = document.createElement('li')
                    li.innerHTML = fileNames[0]
                    fileNamesOutput.appendChild(li)
                }
            }
        </script>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Create a Course</h2>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="itemForm">
            <form:label path="subject"><b>Lecture Title</b></form:label><br/>
            <form:input type="text" path="subject" /><br/><br/>
            <b>Notes</b><br/>
            
            <input type="file" name="attachments" class="attachments" multiple="multiple" onchange="getFileNames()"/>
            <ul id="fileList"><li>No File Selected</li></ul>
            <br/><br/>

            <input type="submit" value="Submit"/>
        </form:form>
    </body>
</html>
