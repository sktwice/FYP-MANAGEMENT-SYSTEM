<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fyp.model.bean.Lecturer" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Examiners</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../admin-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column h-100 px-4 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
                        <div class="pb-3 is-flex is-justify-content-end is-align-items-center">
                            <input id="searchInput" class="px-4 mx-4 my-1" type="text" placeholder="Search" style="width: 18rem; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            <span class="has-background-black" style="border-radius: 100%; width: 40px; height: 40px;">
                                <img src="">
                            </span>
                        </div>
                        <div class="custom-border p-6 w-100">
                            <div class="pb-4">
                                <div>
                                    <label class="has-text-weight-bold has-text-grey is-size-5">List of Supervisor</label>
                                    <p class="has-text-grey-light is-size-7">More than ${listExaminer.size()} lecturers</p>
                            </div>
                            <div>
                                <div class="p-1" id="table">
                                    <table class="">
                                        <thead>
                                            <tr style="border-bottom: 2px solid #ddd;">
                                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Name</th>
                                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Staff ID</th>
                                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Contact</th>
                                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Status Account</th>
                                                 <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="lecturer" items="${listSupervisor}">
                                                <tr>
                                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Name">
                                                        <c:out value="${lecturer.name}" />
                                                    </td>
                                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Staff ID">
                                                        <c:out value="${lecturer.lecturerId}" />
                                                        <p class="has-text-grey-light" style="font-size: 0.5rem;">
                                                            <c:out value = "${lecturer.position}"/>
                                                        </p>
                                                    </td>
                                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Contact" style="word-break:break-all;">
                                                        <c:out value = "${lecturer.email}"/>
                                                    </td>
                                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Email" style="word-break:break-all;">
                                                        <c:out value = "${lecturer.status}"/>
                                                    </td>
                                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Action" style="word-break:break-all;">
                                                       
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
        </div>
        <script>
            document.getElementById('searchInput').addEventListener('input', function () {
                var input = this.value.toLowerCase();
                var rows = document.querySelectorAll('#table tbody tr');

                rows.forEach(function (row) {
                    var name = row.querySelector('[data-label="Name"]').textContent.toLowerCase();
                    var staffId = row.querySelector('[data-label="Staff ID"]').textContent.toLowerCase();
                    var contact = row.querySelector('[data-label="Contact"]').textContent.toLowerCase();
                    var email = row.querySelector('[data-label="Email"]').textContent.toLowerCase();

                    if (name.includes(input) || staffId.includes(input) || contact.includes(input) || email.includes(input)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
        </script>
    </body>
</html>