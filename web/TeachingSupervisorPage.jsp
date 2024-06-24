<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Role Selection</title>
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body style="height: 768px;">
         <div class="h-100" style="flex-grow: 1; padding: 20px; background-color: #FFFFFF; overflow-y: auto;">
        <div class="container col-md-5 h-100" style="display: flex; justify-content:center; align-items: center;">
            <div class="card" style="width:16rem; height:6rem;">
                <div class="card-body">
                    <h2>Select Your Role:</h2>
                    <button onclick="redirectTo('Supervisor/Dashboard-Supervisor.jsp')">Supervisor</button>
                    <button onclick="redirectTo('Lecturers/Dashboard-Lecturer.jsp')">Lecturer</button>
                </div>
            </div>
        </div>
                 </div>
        <script>
            function redirectTo(page) {
                window.location.href = page;
            }
        </script>
    </body>
</html>