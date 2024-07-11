<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supervisor View - Projects</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="content-wrapper">
        <jsp:include page="../supervisor-sidebar.jsp"></jsp:include>
        <div class="main-content">
            <div class="column h-100 px-6 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
                <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                    Supervisor View - Projects
                </div>
                <div class="pt-4">
                    <div class="custom-border p-5 w-100">
                        <div>
                            <table class="">
                                <thead>
                                <tr>
                                    <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Project Title</th>
                                    <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Student ID</th>
                                    <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Project ID</th>
                                    <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="project" items="${projects}">
                                    <tr>
                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Project Title">
                                            ${project.proTitle}
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Student ID">
                                            ${project.studentId}
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Project ID">
                                            ${project.proId}
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered p-4" data-label="Actions">
                                            <div class="buttons has-text-centered is-flex is-justify-content-center">
                                                <form action="${pageContext.request.contextPath}/SupervisorProjectDetailsServlet" method="post">
                                                    <input type="hidden" name="proId" value="${project.proId}">
                                                    <input type="hidden" name="studentId" value="${project.studentId}">
                                                    <button type="submit" class="button is-success is-outlined is-small">
                                                        <i class="fas fa-eye"></i>
                                                    </button>
                                                </form>
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