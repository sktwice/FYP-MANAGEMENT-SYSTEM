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
</head>
<body>

<div class="columns m-0 p-0 h-100">
    <div class="column p-6 is-justify-content-center" style="background-color:#FFFFFF; overflow-y: scroll;">
        <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
            Supervisor View - Projects
        </div>
        <div class="columns is-multiline m-0 p-0">
            <div class="custom-border p-5 w-100">
                <div>
                    <table class="">
                        <thead>
                        <tr>
                            <th>Project Title</th>
                            <th>Student ID</th>
                            <th>Project ID</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="project" items="${projects}">
                            <tr>
                                <td>${project.proTitle}</td>
                                <td>${project.studentId}</td>
                                <td>${project.proId}</td>
                                <td>
                                    <div class="buttons">
                                        <form action="${pageContext.request.contextPath}/SupervisorProjectDetailsServlet" method="post">
                                            <input type="hidden" name="proId" value="${project.proId}">
                                            <input type="hidden" name="studentId" value="${project.studentId}">
                                            <button type="submit" class="button is-link is-small">View Details</button>
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

</body>
</html>
