<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="content-wrapper">
        <jsp:include page="../student-sidebar.jsp"></jsp:include>
        <div class="main-content">
            <div class="column" style="background-color:#FFFFFF; height:726px;">
                <div class="py-1 px-5 is-flex is-justify-content-end is-align-items-center">
                    <input class="px-4 m-1" type="text" placeholder="Search"
                           style="width: 18rem; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    <span class="has-background-black" style="border-radius: 100%; width: 40px; height: 40px;">
                        <img src="">
                    </span>
                </div>
                <div class="custom-border p-4 w-100">
                    <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                        <div>
                            <label class="has-text-weight-semibold has-text-grey-dark is-size-5">Past
                                Reports</label>
                            <p class="has-text-grey-light is-size-7">More than 400+ students' reports</p>
                        </div>
                    </div>
                    <div>
                        <div class="p-1" id="table">
                            <table class="">
                                <thead>
                                    <tr style="border-bottom: 2px solid #ddd;">
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Student</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Matric ID</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Semester</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Report Title</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="pastProject" items="${pastProjects}">
                                        <tr>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile"
                                                data-label="Student">${pastProject.studentName}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile"
                                                data-label="Matric ID">${pastProject.studentId}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile"
                                                data-label="Semester">${pastProject.session}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile"
                                                data-label="Topic">${pastProject.proTitle}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">
                                                <div class="is-flex is-justify-content-center">
                                                    <button class="button is-custom is-small">View</button>
                                                    <button class="button is-custom3 is-small">Download</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
