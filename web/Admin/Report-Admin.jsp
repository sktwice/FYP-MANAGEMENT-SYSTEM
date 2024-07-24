<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fyp.model.bean.PastProject" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Report</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <style>
        </style>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../admin-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column h-100 px-4 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
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
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Student"><c:out value="${report.studentName}" /></td> 
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Matric ID"><c:out value="${report.studentId}" /></td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Semester"><c:out value = "${report.session}"/></td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic"><c:out value = "${report.proTitle}"/></td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">
                                                    <div class="is-flex is-justify-content-center">
                                                        <a href="${pageContext.request.contextPath}/ViewPdfServlet?proId=${report.proId}"  target="_blank" class="button is-success is-outlined is-small mr-1">
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
            <div class="modal-card" style="border-radius: 5px;">
                <header class="modal-card-head has-background-white" style="box-shadow: 1px 1px 1px 1px #dbdbdb;">
                    <p class="modal-card-title has-text-weight-semibold has-text-grey-dark">Add New Past Report</p>
                    <button class="delete" aria-label="close" id="closeModalButton"></button>
                </header>
                <section class="modal-card-body has-background-white">
                    <form id="addReportForm" action="AddPastReportServlet" method="post" enctype="multipart/form-data">
                        <div class="p-4">
                            <input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.admin_id}"/>
                            <input type="hidden" name="l_id" value="0" />

                            <label class="has-text-weight-semibold has-text-grey">Student Name</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-2" type="text" name="stu_name" placeholder="Student Name">
                            </div>
                            <label class="has-text-weight-semibold has-text-grey">Student ID</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-2" type="text" name="student_id" placeholder="Student ID">
                            </div>  
                            <label class="has-text-weight-semibold has-text-grey">Project Title</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-2" type="text" name="pro_title" placeholder="Project Title">
                            </div>
                            <label class="has-text-weight-semibold has-text-grey">Semester</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-2" type="text"name="session" placeholder="Semester">
                            </div>
                            <div class="pt-3">
                                <div id="file-js-example" class="file has-name">
                                    <label class="file-label">
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
                            <footer class="modal-card-foot has-background-white is-justify-content-end p-4 w-100" style="border-top-color: #bdbdbd 1px solid;">
                                <button class="button is-custom" type="button" id="submitButton">Submit</button>
                            </footer>
                        </div>
                    </form>
                </section>
            </div>
        </div>                                
        <script>
            document.getElementById('searchInput').addEventListener('keyup', function () {
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

                // Adding event listener for SweetAlert2
                document.getElementById('submitButton').addEventListener('click', function (event) {
                    event.preventDefault(); // Prevent the default form submission

                    // Display the SweetAlert2 confirmation dialog
                    Swal.fire({
                        title: "Are you sure?",
                        text: "Do you want to add this Past Report?",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#3085d6",
                        cancelButtonColor: "#d33",
                        confirmButtonText: "Yes, add!"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // If confirmed, show success message and submit the form
                            Swal.fire({
                                title: "Added!",
                                text: "The Report has been added.",
                                icon: "success",
                                confirmButtonColor: "#3085d6",
                                cancelButtonColor: "#d33",
                                confirmButtonText: "OK"
                            }).then(() => {
                                // Find the form and submit it
                                var form = document.getElementById('addReportForm');
                                if (form) {
                                    form.submit();
                                }
                            });
                        }
                    });
                });
            });
        </script>
    </body>
</html>