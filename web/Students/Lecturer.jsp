<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lecturers List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="height:100%;">
    <div class="is-flex is-justify-content-space-between is-mobile-visible">
        <div class="is-mobile-visible p-2">
            <img src="${pageContext.request.contextPath}/assets/uitm-logo.png" style="height:30px; width:60px;">
        </div>
    </div>
    <div class="content-wrapper">
        <jsp:include page="../student-sidebar.jsp"></jsp:include>
        <div class="main-content">
            <div class="column h-100 px-4 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
                <div class="pb-3 is-flex is-justify-content-end is-align-items-center">
                    <input class="px-4 mx-4 my-1" type="text" placeholder="Search" style="width: 18rem; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    <span class="has-background-black" style="border-radius: 100%; width: 40px; height: 40px;">
                        <img src="">
                    </span>
                </div>
                <div class="custom-border p-6 w-100">
                    <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                        <div>
                            <label class="has-text-weight-bold has-text-grey is-size-5">List Of Lecturers</label>
                            <p class="has-text-grey-light is-size-7">More than 400+ Lecturers</p>
                        </div>
                    </div>
                    <div>
                        <div class="p-1" id="table">
                            <table class="">
                                <thead>
                                    <tr style="border-bottom: 2px solid #ddd;">
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Name</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Staff ID</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Contact</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Email</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="lecturer" items="${listLecturer}">
                                        <tr>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-start has-text-right-mobile p-4"><c:out value="${lecturer.lName}" /></td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"><c:out value="${lecturer.lId}" /></td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"><c:out value="${lecturer.phoneNum}" /></td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"><c:out value="${lecturer.email}" /></td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                                <div class="is-flex is-justify-content-center">
                                                    <a class="button is-custom3 is-small" href="${pageContext.request.contextPath}/ProposalSvServlet?lecturerId=${lecturer.lId}&svId=${lecturer.svId}">Submit Proposal</a>
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
