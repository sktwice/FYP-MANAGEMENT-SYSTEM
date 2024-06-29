<%-- 
    Document   : Form-Student
    Created on : May 2, 2024, 6:13:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <link rel="stylesheet" href="../css/style.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="content-wrapper">
                <jsp:include page="../student-sidebar.jsp"></jsp:include>
                <div class="main-content">
            <div class="column p-4 h-100" style="background-color:#FFFFFF;">
                <div class="custom-border p-5 w-100">
                    <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                        <div>
                            <label class="has-text-weight-semibold has-text-grey-dark is-size-4">Forms</label>
                            <p class=" custom-subheader has-text-grey-light is-size-6">More than 7 forms</p>
                        </div>
                    </div>
                    <div class="has-background-grey-lighter w-100" style="border-radius: 6px;">
                        <div class="has-text-grey is-size-6 has-text-weight-semibold p-3">Refer to the rubric below</div>
                    </div>
                    <div class="p-3">
                        <div class="is-flex is-justify-content-space-between py-2">
                            <label class="has-text-weight-semibold has-text-grey-dark is-size-6">F5 - PROPOSAL/PROJECT IN-PROGRESS FORM</label>
                            <button class="button is-custom"><a href="../Form5Servlet" class="is-size-7 has-text-white">Open</a>
                                <span class="is-size-7 fas fa-arrow-up-right-from-square pl-2"></span></button>
                        </div>
                    </div>
                    <div class="p-3">
                        <div class="is-flex is-justify-content-space-between pb-2">
                            <label class="has-text-weight-semibold has-text-grey-dark is-size-6">F6 – PROJECT FORMULATION REPORT SUBMISSION FORM</label>
                            <button class="button is-custom"><a href="../Students/F6 – PROJECT FORMULATION REPORT SUBMISSION FORM.jsp" class="is-size-7 has-text-white">Open</a>
                                <span class="is-size-7 fas fa-arrow-up-right-from-square pl-2"></span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>