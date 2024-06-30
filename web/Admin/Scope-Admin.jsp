<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.fyp.model.bean.Scope" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="content-wrapper">
        <jsp:include page="../admin-sidebar.jsp"></jsp:include>
        <div class="main-content">
            <div class="column h-100 p-4" style="background-color:#FFFFFF; overflow-y: scroll;">
                <div class="custom-border p-6 w-100">
                    <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                        <div>
                            <label class="has-text-weight-bold has-text-grey is-size-5">FYP Scope</label>
                            <p class="has-text-success is-size-7">Available topics</p>
                        </div>
                        <div class="columns m-0 p-0" style="width:55%;">
                            <div class="column is-two-thirds p-1">
                                <input id="searchInput" class="px-4 py-3" type="text" placeholder="Search" style="width: 100%; border-radius: 6px; outline: none;">
                            </div>
                            <div class="column p-1" style="align-content:center;">
                                <a class="button is-custom px-4 py-3 w-100" href="${pageContext.request.contextPath}/editScope">
                                    <span class="is-size-7">Add Scope</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="p-3">
                        <table class="">
                            <thead>
                                <tr style="border-bottom: 2px solid #ddd;">
                                    <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Topic</th>
                                    <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Programme</th>
                                    <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Session Date</th>
                                    <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Total Students</th>
                                </tr>
                            </thead>
                            <tbody id="scopeTableBody">
                                <c:forEach var="scope" items="${listScope}">
                                    <tr>
                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic">
                                            <c:out value="${scope.scopeName}" />
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Programme">
                                            <c:out value="${scope.program}" />
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Session Date">
                                            <c:out value="${scope.session}" />
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Total Students">
                                            <c:out value="${scopeStudentCount[scope.scopeId]}" />
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
    <script>
        $(document).ready(function () {
            $('#searchInput').on('input', function () {
                var searchText = $(this).val().toLowerCase();
                $('#scopeTableBody tr').each(function () {
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
