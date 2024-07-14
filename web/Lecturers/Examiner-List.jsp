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
        <jsp:include page="../lecturer-sidebar.jsp"></jsp:include>
        <div class="main-content">
            <div class="column h-100 px-6 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
                <div class="pb-3 is-flex is-justify-content-end is-align-items-center">
                    <input id="searchInput" class="px-4 mx-4 my-1" type="text" placeholder="Search" style="width: 18rem; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                    <span class="has-background-black" style="border-radius: 100%; width: 40px; height: 40px;">
                        <img src="">
                    </span>
                </div>
                <div class="custom-border p-6 w-100">
                    <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                                <div>
                                    <label class="has-text-weight-bold has-text-grey is-size-5">List of Examiner</label>
                                    <p class="has-text-grey-light is-size-7">More than ${examiner.size()} lecturers</p>
                                </div>
                                <button class="button is-custom" style="height:2rem;" id="openModalButton">
                            <span class="is-size-7">Assign</span>
                        </button>
                        </div>
                    <div class="pb-4">
                        <div>
                            <div class="p-1" id="table">
                                <table class="">
                                    <thead>
                                        <tr style="border-bottom: 2px solid #ddd;">
                                            <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Name</th>
                                            <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Staff ID</th>
                                            <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Contact</th>
                                            <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Email</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="lecturer" items="${examiner}">
                                            <tr>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Name">
                                                    <c:out value="${lecturer.LName}" />
                                                </td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Staff ID">
                                                    <c:out value="${lecturer.LId}" />
                                                </td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Contact">
                                                    <c:out value="0${lecturer.phoneNum}" />
                                                </td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Email" style='word-break: break-word'>
                                                    <c:out value="${lecturer.email}" />
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
           <div class="modal custom-modal" id="registerLecturerModal">
            <div class="modal-background"></div>
            <div class="modal-card" style="width: 80%;">
                <header class="modal-card-head has-background-white" style="box-shadow: 0px 1px 1px 1px #dbdbdb;">
                    <p class="modal-card-title has-text-weight-semibold has-text-grey-dark">Assign Examiner</p>
                    <button class="delete" aria-label="close" id="closeModalButton"></button>
                </header>
                <form action="${pageContext.request.contextPath}/UpdateExaminerServlet" method="post">
                <section class="modal-card-body has-background-white">
                        <input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.admin_id}">
                        
                    <table class="">
                        <thead>
                            <tr class="" style="border-bottom: 2px solid #ddd;">
                                <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Matric ID</th>
                                <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Student Name</th>
                                <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Project Title</th>
                                <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Select Examiner</th>
                                <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Action</th>
                            </tr>
                        </thead>
                        
                            <tbody>
                                <c:forEach var="assign" items="${projectStudents}">
                                    <tr>
                                        <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Matric ID">${assign.studentId}</td>
                                        <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Student Name">${assign.studentName}</td>
                                        <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Project Title">${assign.projectTitle}</td>
                                        <td class="is-size-7 has-text-centered" data-label="Select Examiner">
                                            <select name="examinerId" id="examinerId">
                                                <option value="" disabled selected>Select Examiner</option>
                                                <c:forEach var="examiner" items="${examiners}">
                                                    <option value="${examiner.exId}">${examiner.LName}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="is-size-7 has-text-centered" data-label="Action">
                                            <button type="submit" class="button is-small is-info">Assign</button>
                                            <input type="hidden" name="studentId" value="${assign.studentId}">
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        

                    </table>

                        
                </section>
                            <footer class="modal-card-foot has-background-white is-flex is-justify-content-space-between p-4 w-100" style="border-top-color: #bdbdbd 1px solid;">
                        </footer>
                            </form>
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
        
        document.addEventListener('DOMContentLoaded', () => {
                const openModalButton = document.getElementById('openModalButton');
                const closeModalButton = document.getElementById('closeModalButton');
                const modal = document.getElementById('registerLecturerModal');

                openModalButton.addEventListener('click', () => {
                    modal.classList.add('is-active');
                });

                closeModalButton.addEventListener('click', () => {
                    modal.classList.remove('is-active');
                });

                modal.querySelector('.modal-background').addEventListener('click', () => {
                    modal.classList.remove('is-active');
                });
            });
    </script>
</body>
</html>