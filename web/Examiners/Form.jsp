<%-- 
    Document   : Form
    Created on : May 2, 2024, 6:55:31 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Forms</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <link rel="stylesheet" href="../css/style.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../examiner-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column h-100 p-4" style="background-color:#FFFFFF; overflow-y: scroll;">
                    <div class="custom-border p-6 w-100">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                            <div>
                                <label class="has-text-weight-semibold has-text-grey-dark is-size-5">Forms</label>
                                <p class="custom-subheader has-text-grey-light is-size-7">More than 7 forms</p>
                            </div>
                        </div>
                        <div class="has-background-grey-lighter w-100" style="border-radius: 6px;">
                            <div class="has-text-grey is-size-7 has-text-weight-semibold p-3">Refer to the rubric below</div>
                        </div>
                        <div class="p-3">
                            <div class="is-flex is-justify-content-space-between pb-2">
                                <label class="has-text-weight-semibold has-text-grey-dark is-size-5">F7 – PROJECT FORMULATION PRESENTATION FORM</label>
                                <a class="button is-custom" href="${pageContext.request.contextPath}/F7ListServlet">
                                    <span class="is-size-7 p-1">Open</span>
                                    <span class="is-size-7 fas fa-arrow-up-right-from-square"></span>
                                </a>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="is-flex is-justify-content-space-between pb-2">
                                <label class="has-text-weight-semibold has-text-grey-dark is-size-5">F8 – PROJECT FORMULATION REPORT EVALUATION FORM</label>
                                <a class="button is-custom" href="${pageContext.request.contextPath}/StudentExReportServlet">
                                    <span class="is-size-7 p-1">Open</span>
                                    <span class="is-size-7 fas fa-arrow-up-right-from-square"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>