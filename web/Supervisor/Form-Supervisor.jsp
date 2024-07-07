<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Forms</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../supervisor-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column h-100 p-6" style="background-color:#FFFFFF; overflow-y: scroll;">
                    <div class="custom-border p-6 w-100">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                            <div>
                                <label class="has-text-weight-bold has-text-grey is-size-5">Forms</label>
                                <p class="has-text-grey-light is-size-7">More than 7 forms</p>
                            </div>
                        </div>
                        <div class="has-background-grey-lighter w-100 mb-4" style="border-radius: 6px;">
                            <div class="has-text-grey-dark is-size-6 has-text-weight-semibold p-3">Refer to the rubric below</div>
                        </div>
                        <div class="p-3">
                            <div class="is-flex is-justify-content-space-between pb-2">
                                <label class="has-text-weight-semibold has-text-grey is-size-5">F5 – PROJECT IN-PROGRESS FORM</label>
                                <a class="button is-custom" style="height:2.5rem;" href="../SupervisorViewServlet">
                                    <span class="is-size-7 p-1">Open</span>
                                    <span class="is-size-7 fas fa-arrow-up-right-from-square"></span>
                                </a>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="is-flex is-justify-content-space-between pb-2">
                                <label class="has-text-weight-semibold has-text-grey is-size-5">F6 – PROJECT FORMULATION REPORT SUBMISSION FORM</label>
                                <a class="button is-custom" style="height:2.5rem;" href="../Supervisor/F6.jsp">
                                    <span class="is-size-7 p-1">Open</span>
                                    <span class="is-size-7 fas fa-arrow-up-right-from-square"></span>
                                </a>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="is-flex is-justify-content-space-between pb-2">
                                <label class="has-text-weight-semibold has-text-grey is-size-5">F7 - PROJECT FORMULATION PRESENTATION EVALUATION</label>
                                <a class="button is-custom" style="height:2.5rem;" href="${pageContext.request.contextPath}/StudentSvReportServlet">
                                    <span class="is-size-7 p-1">Open</span>
                                    <span class="is-size-7 fas fa-arrow-up-right-from-square"></span>
                                </a>
                            </div>
                        </div>
                        <div class="p-3">
                            <div class="is-flex is-justify-content-space-between pb-2">
                                <label class="has-text-weight-semibold has-text-grey is-size-5">F8 - PROJECT FORMULATION REPORT EVALUATION</label>
                                <a class="button is-custom" style="height:2.5rem;" href="${pageContext.request.contextPath}/F8SupervisorListServlet">
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