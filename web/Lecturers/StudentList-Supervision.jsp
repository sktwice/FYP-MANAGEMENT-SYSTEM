<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Students List Supervision</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body style="height:100%;">
        <div class="content-wrapper">
            <% 
            String userCategory = (String) session.getAttribute("userCategory");
    
        if(userCategory.equals("lecturer")){
            %> <jsp:include page="../lecturer-sidebar.jsp"></jsp:include> <%
                } 
            %>
            <div class="main-content">
                <div class="column h-100 p-6" style="background-color:#FFFFFF; overflow-y: scroll;">
                    <div class="custom-border p-6 w-100">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                            <div>
                                <label class="has-text-weight-bold has-text-grey is-size-5">Student List With Supervisor</label>
                                <p class="has-text-grey-light is-size-7">Students with accepted Supervisor</p>
                            </div>
                            <div class="columns m-0 p-0" style="width:28%;">
                                <div class="column p-1" style="align-content:center;">
                                    <input id="searchInput" class="px-4 py-3" type="text" placeholder="Student ID" style="width: 100%; border-radius: 6px; outline: none;">
                                </div>
                            </div>
                        </div>
                        <div class="p-3">
                            <table class="">
                                <thead>
                                    <tr class="" style="border-bottom: 2px solid #ddd;">
                                        <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Topic</th>
                                        <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Student Name</th>
                                        <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Matric ID</th>
                                        <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Supervisor Name</th>
                                        <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Examiner Name</th>
                                    </tr>
                                </thead>
                                <tbody id="svTableBody">
                                    <c:forEach var="supervision" items="${listSupervision}">
                                        <tr>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic">${supervision.proTitle}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Student Name">${supervision.studentName}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Matric ID">${supervision.studentId}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Supervisor Name">${supervision.supervisorName}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Examiner Name">${supervision.examinerName}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#searchInput').on('input', function () {
                    var searchText = $(this).val().toLowerCase();
                    $('#svTableBody tr').each(function () {
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