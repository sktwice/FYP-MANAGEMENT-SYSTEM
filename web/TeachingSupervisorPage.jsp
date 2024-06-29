<!DOCTYPE html>
<html style="overflow:hidden;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <meta charset="UTF-8">
        <title>Role Selection</title>
        <style>
            .container {
                position: relative;
                height: 100vh;
            }

            .login-image {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
                z-index: -1;
            }

            .card {
                position: relative;
                z-index: 1;
                width: 16rem;
                height: auto;
            }

            .card-body {
                text-align: center;
            }

            .container-flex {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
        </style>
    </head>
    <body style="overflow:hidden;">
         <div class="h-100" style="flex-grow: 1; padding: 20px; overflow-y: hidden;">
            <img src="${pageContext.request.contextPath}/assets/uitm-background.jpeg" alt="Login Image" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;">
            <div class="container col-md-5 h-100" style="display: flex; justify-content:center; align-items: center;">
                <div class="card">
                    <div class="card-body">
                        <div class="is-size-4 has-text-weight-semibold has-text-grey-dark pb-4">Select Your Role:</div>
                        <button class="button is-custom" onclick="redirectTo('${pageContext.request.contextPath}/DashboardServlet')">Supervisor</button>
                        <button class="button is-custom2" onclick="redirectTo('${pageContext.request.contextPath}/DashboardLecturer')">Lecturer</button>
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