
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Role Selection</title>
</head>
<body>
    <h2>Select Your Role:</h2>
    <button onclick="redirectTo('Supervisor/Dashboard-Supervisor.jsp')">Supervisor</button>
    <button onclick="redirectTo('Lecturers/Dashboard-Lecturer.jsp')">Lecturer</button>

    <script>
        function redirectTo(page) {
            window.location.href = page;
        }
    </script>
</body>
</html>
