<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.fyp.model.bean.Admin" %>
<%@ page import="com.fyp.model.bean.Student" %>
<%@ page import="com.fyp.model.bean.PastProject" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add New Pass Report</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../admin-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column px-6 py-3" style="background-color:#FFFFFF;">
                        <div <a href="${pageContext.request.contextPath}/addForm" class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                            Add New Past Report
                        </a>
                    </div>
                    <form action="AddPastReportServlet" method="post" enctype="multipart/form-data">
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
                            <div class="is-flex p-4">
                                <div class="is-flex-grow-1"></div>
                                <div class="px-1">
                                    <input class="button is-custom has-background-grey-dark has-text-white-bis" type="submit" value="Submit">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            const fileInput = document.querySelector("#file-js-example input[type=file]");
            fileInput.onchange = () => {
                if (fileInput.files.length > 0) {
                    const fileName = document.querySelector("#file-js-example .file-name");
                    fileName.textContent = fileInput.files[0].name;
                }
            };
        </script>
        <script>
            $(document).ready(function () {
                $('#student-select').select2({
                    ajax: {
                        url: 'GetStudentsServlet',
                        dataType: 'json',
                        delay: 250,
                        processResults: function (data) {
                            return {
                                results: data.map(function (student) {
                                    return {
                                        id: student.id,
                                        text: student.name
                                    };
                                })
                            };
                        },
                        cache: true
                    },
                    placeholder: 'Select a student',
                    minimumInputLength: 1,
                });
            });
        </script>
    </body>
</html>
