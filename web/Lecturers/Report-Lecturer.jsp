<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fyp.model.bean.PastProject" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Reports</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../lecturer-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column h-100 px-6 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
                    <div class="custom-border p-6 w-100">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                            <div>
                                <label class="has-text-weight-bold has-text-grey is-size-5">Past Reports</label>
                                <p class="has-text-grey-light is-size-7">More than ${listPastReport.size()} students' past reports</p>
                            </div>
                            <div class="columns m-0 p-0" style="width:28%;">
                                <div class="column is-two-thirds p-1">
                                    <input id="searchInput" class="px-4 py-3" type="text" placeholder="Search" style="width: 100%; border-radius: 6px; outline: none;">
                                </div>
                                <div class="column p-1" style="align-content:center;">
                                    <button class="button is-custom4 px-4 py-3 w-90" style="height:2.6rem;" id="openModalButton">
                                        <span class="is-size-7 has-text-weight-semibold">New Report</span>
                                    </button>
                                </div>
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
                                            <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Topic</th>
                                            <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableBody">
                                        <c:forEach var="report" items="${listPastReport}">
                                            <tr>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"><c:out value="${report.studentName}" /></td> 
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"><c:out value="${report.studentId}" /></td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"><c:out value="${report.session}"/></td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"><c:out value="${report.proTitle}"/></td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                                    <div class="is-flex is-justify-content-center">
                                                        <a href="${pageContext.request.contextPath}/ViewPdfServlet?proId=${report.proId}" target="_blank" class="button is-success is-outlined is-small mr-1">
                                                            <i class="fas fa-eye"></i>
                                                        </a>
                                                        <a class="button is-info is-outlined is-small" href="${pageContext.request.contextPath}/DownloadPastReportServlet?proId=${report.proId}">
                                                            <i class="fas fa-download"></i>
                                                        </a>
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
        <div class="modal custom-modal" id="registerLecturerModal">
            <div class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head has-background-white" style="box-shadow: 0px 1px 1px 1px #dbdbdb;">
                    <p class="modal-card-title has-text-weight-semibold has-text-grey-dark">Register Lecturer</p>
                    <button class="delete" aria-label="close" id="closeModalButton"></button>
                </header>
                <form action="LecturerPastReportServlet" method="post" enctype="multipart/form-data">
                <section class="modal-card-body has-background-white">
                    
                        <div class="p-4">
                            <input type="hidden" id="admin_id" name="admin_id" value="0"/>
                            <input type="hidden" name="l_id" value="${sessionScope.lecturer_id}" />

                            <label class="has-text-weight-semibold has-text-grey">Student Name</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-2 has-text-grey" type="text" name="stu_name" placeholder="Student Name">
                            </div>
                            <label class="has-text-weight-semibold has-text-grey">Student ID</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-2 has-text-grey" type="text" name="student_id" placeholder="Student ID">
                            </div>  
                            <label class="has-text-weight-semibold has-text-grey">Project Title</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-2 has-text-grey" type="text" name="pro_title" placeholder="Project Title">
                            </div>
                            <label class="has-text-weight-semibold has-text-grey">Semester</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-2 has-text-grey" type="text" name="session" placeholder="Semester">
                            </div>
                            <div class="pt-3">
                                <div id="file-js-example" class="file has-name">
                                    <label class="file-label is-size-7">
                                        <input class="file-input" type="file" name="pdfFile" />
                                        <span class="file-cta" style="background-color: #3699FF; border: none;">
                                            <span class="file-icon">
                                                <i class="fas fa-upload"></i>
                                            </span>
                                            <span class="file-label">Choose a file…</span>
                                        </span>
                                        <span class="file-name has-text-grey">No file uploaded</span>
                                    </label>
                                </div>
                            </div>
                            
                        </div>
                    
                </section>
                <footer class="modal-card-foot has-background-white is-flex is-justify-content-end p-4 w-100" style="border-top-color: #bdbdbd 1px solid;">
                    <button class="button is-custom3 is-size-7" type="submit">Submit</button>
                </footer>
                </form>
            </div>
        </div>
        <script>
            document.getElementById('searchInput').addEventListener('keyup', function() {
                var input = document.getElementById('searchInput');
                var filter = input.value.toLowerCase();
                var tableBody = document.getElementById('tableBody');
                var tr = tableBody.getElementsByTagName('tr');

                for (var i = 0; i < tr.length; i++) {
                    var td = tr[i].getElementsByTagName('td');
                    var textValue = '';
                    for (var j = 0; j < td.length; j++) {
                        textValue += td[j].textContent || td[j].innerText;
                    }
                    if (textValue.toLowerCase().indexOf(filter) > -1) {
                        tr[i].style.display = '';
                    } else {
                        tr[i].style.display = 'none';
                    }
                }
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