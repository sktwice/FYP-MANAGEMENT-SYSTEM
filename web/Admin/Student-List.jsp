<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fyp.model.bean.Student" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>List of Students</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body>
        <div class="content-wrapper">
            <jsp:include page="../admin-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column h-100 px-4 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
                        <div class="custom-border p-6 w-100">
                            <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                                <div>
                                    <label class="has-text-weight-bold has-text-grey is-size-5">List of
                                        Students</label>
                                    <p class="has-text-grey-light is-size-7">More than ${listStudent.size()} students</p>
                            </div>
                            <div class="columns m-0 p-0" style="width:50%;">
                                <div class="column is-offset-5 p-1">
                                    <input id="searchInput" class="px-4 py-3" type="text" placeholder="Search" style="width: 100%; border-radius: 6px; outline: none;">
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="p-1" id="table">
                                <table class="">
                                    <thead>
                                        <tr style="border-bottom: 2px solid #ddd;">
                                            <th
                                                class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                Name</th>
                                            <th
                                                class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                Matric ID</th>
                                            <th
                                                class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                Semester</th>
                                            <th
                                                class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                Programme</th>
                                            <!--    <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                    Action</th> -->
                                        </tr>
                                    </thead>
                                    <tbody id="studentTableBody">
                                        <c:forEach var="student" items="${listStudent}">
                                            <tr>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                    data-label="Name">
                                                    <c:out value="${student.sName}" />
                                                </td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                    data-label="Matric ID">
                                                    <c:out value="${student.studentId}" />
                                                </td>

                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                    data-label="Semester">
                                                    <c:out value="${student.semester}" />
                                                </td>

                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                    data-label="Programme">
                                                    <c:out value="${student.sCourse}" />
                                                </td>

                                                <!--    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                        data-label="Action">
                                                        <button class="button is-success is-outlined mr-2 is-small"><i class="fas fa-eye"></i></button>
                                                        <button
                                                            class="button is-info is-outlined is-small"><i class="fas fa-download"></i></button>
                                                    </td> -->
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
        <script>
            $(document).ready(function () {
                $('#searchInput').on('input', function () {
                    var searchText = $(this).val().toLowerCase();
                    $('#studentTableBody tr').each(function () {
                        var text = $(this).text().toLowerCase();
                        if (text.includes(searchText)) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                });
            });
        </script>
    </body>

</html>