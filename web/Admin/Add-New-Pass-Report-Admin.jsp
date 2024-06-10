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
    <style>
        .button.is-nav {
            background-color: #14161a;
            border-color: #fff;
            color: #fff;
        }
        .button.is-nav:hover, .button.nav.is-hovered {
            background-color: #a0e4d1;
            border-color: #14161a;
            color: #090a0c;
        }
        .button.is-nav.is-outlined:hover, .button.is-nav.is-outlined.is-hovered, .button.is-custom.is-outlined:focus, .button.is-nav.is-outlined.is-focused {
            background-color: #fff;
            border-color: #fff;
            color: #090a0c;
        }
    </style>
</head>
<body style="height:100%;">
    <div class="is-flex is-justify-content-space-between is-mobile-visible">
        <div class="is-mobile-visible p-2">
            <img src="${pageContext.request.contextPath}/assets/uitm-logo.png" style="height:30px; width:60px;">
        </div>
        <button role="button" class="navbar-burger is-mobile-visible" data-target="navMenu" aria-label="menu" aria-expanded="false">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
        </button>
    </div>
    <div class="p-2 navbar-menu is-mobile-visible" id="navMenu" style="">
        <nav class="navbar" role="navigation" aria-label="dropdown navigation">
            <div class="navbar-item has-dropdown">
                <div class="navbar-dropdown">
                    <a class="navbar-item p-4" href="../Admin/Dashboard-Admin.jsp">
                        <span class="fas fa-home pr-2"></span>
                        <span class="is-size-7">Dashboard</span>
                    </a>
                    <a class="navbar-item p-4" href="../Admin/UserProfile-Admin.jsp">
                        <span class="fas fa-user pr-4"></span>
                        <span class="is-size-7">Profile</span>
                    </a>
                    <a class="navbar-item p-4" href="../Admin/Report-Admin.jsp">
                        <span class="fas fa-book-open pr-4 is-size-7"></span>
                        <span class="is-size-7">Reports</span>
                    </a>
                    <a class="navbar-item p-4" href="../Admin/ListOfLecturer.jsp">
                        <span class="fas fa-users-viewfinder pr-4 is-size-7"></span>
                        <span class="is-size-7">Lecturer</span>
                    </a>
                    <a class="navbar-item p-4" href="../Admin/Examiner-List.jsp">
                        <span class="fas fa-user-tie pr-4 is-size-7"></span>
                        <span class="is-size-7">Examiner</span>
                    </a>
                    <a class="navbar-item p-4" href="../Admin/Student-List.jsp">
                        <span class="fas fa-user-graduate pr-4 is-size-7"></span>
                        <span class="is-size-7">Students</span>
                    </a> 
                    <a class="navbar-item p-4" href="../Admin/Scope-Admin.jsp">
                        <span class="fas fa-book pr-4 is-size-7"></span>
                        <span class="is-size-7">Scope</span>
                    </a>
                    <a class="navbar-item p-4" href="../Admin/StudenList-Supervision-Admin.jsp">
                        <span class="fas fa-bullseye pr-4 is-size-7"></span>
                        <span class="is-size-7">Supervision</span>
                    </a>
                    <a class="navbar-item p-4">
                        <span class="fas fa-arrow-right-from-bracket pr-4"></span>
                        <span class="is-size-7">Sign-out</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>
    <div class="columns m-0 p-0 h-100">
        <div class="p-2 column is-2 is-desktop-visible">
            <aside class="menu">
                <p class="menu-label p-1 m-0">
                    <img src="${pageContext.request.contextPath}/assets/uitm-logo.png" style="height:50px; width:142px;">
                </p>
                <ul class="menu-list">
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Admin/Dashboard-Admin.jsp">
                            <span class="fas fa-home pr-2 is-size-7"></span>
                            <span class="is-size-7">Dashboard</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="${pageContext.request.contextPath}/Admin/Dashboard-Admin.jsp">
                            <span class="fas fa-user pr-4 is-size-7"></span>
                            <span class="is-size-7">Profile</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="${pageContext.request.contextPath}/ListPastReport">
                            <span class="fas fa-book-open pr-4 is-size-7"></span>
                            <span class="is-size-7">Reports</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="${pageContext.request.contextPath}/LecturerListServlet">
                            <span class="fas fa-users-viewfinder pr-4 is-size-7"></span>
                            <span class="is-size-7">Lecturer</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Admin/Examiner-List.jsp">
                            <span class="fas fa-user-tie pr-4 is-size-7"></span>
                            <span class="is-size-7">Examiner</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Admin/Student-List.jsp">
                            <span class="fas fa-user-graduate pr-4 is-size-7"></span>
                            <span class="is-size-7">Students</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="${pageContext.request.contextPath}/ListScopeServlet">
                            <span class="fas fa-book pr-4 is-size-7"></span>
                            <span class="is-size-7">Scope</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Admin/StudenList-Supervision-Admin.jsp">
                            <span class="fas fa-bullseye pr-4 is-size-7"></span>
                            <span class="is-size-7">Supervision</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4">
                            <span class="fas fa-arrow-right-from-bracket pr-4 is-size-7"></span>
                            <span class="is-size-7">Sign-out</span>
                        </a>
                    </li>
                </ul>
            </aside>
        </div>
        <div class="column px-6 py-3" style="background-color:#FFFFFF;">
            <div <a href="${pageContext.request.contextPath}/addForm" class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                Add New Pass Report
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
                <label class="has-text-weight-semibold has-text-grey">Report Title</label>
                <div class="py-2">
                    <input class="custom-input px-4 py-2" type="text" name="pro_title" placeholder="Project Title">
                </div>
                <label class="has-text-weight-semibold has-text-grey">Semester</label>
                <div class="py-2">
                    <input class="custom-input px-4 py-2" type="text"name="session" placeholder="Session">
                </div>
                <div class="p-4">
                    <label class="has-text-weight-semibold has-text-grey">File</label>
                    <div class="py-2">
                        <input type="file" name="pdfFile">
                    </div>
                </div>
                <div class="is-flex p-4">
                    <div class="is-flex-grow-1"></div>
                    <div class="px-1">
                        <input class="button has-background-grey-dark has-text-white-bis" type="submit" value="Submit">
                    </div>
                    </div>
                </div>
            </form>
             </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#student-select').select2({
                ajax: {
                    url: 'GetStudentsServlet',
                    dataType: 'json',
                    delay: 250,
                    processResults: function (data) {
                        return {
                            results: data.map(function(student) {
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
