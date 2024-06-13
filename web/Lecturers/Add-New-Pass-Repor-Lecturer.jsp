<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.fyp.model.bean.Student" %>
<%@ page import="com.fyp.model.bean.Lecturer" %>
<%@ page import="com.fyp.model.bean.PastProject" %>
<%@ page import="com.fyp.Lecturer.Examiner.ShowFormReportExaminer" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en" style="height: 100%;">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
    </head>

    <body style="height:100%;">
        <div class="content-wrapper">
            <% String userCategory=(String) session.getAttribute("userCategory"); if(userCategory.equals("lecturer")){
                %>
                <jsp:include page="../lecturer-sidebar.jsp"></jsp:include>
                <% } else if(userCategory.equals("admin")){ %>
                    <jsp:include page="../admin-sidebar.jsp"></jsp:include>
                    <% } %>
                        <div class="main-content">
                            <div class="column px-6 py-3" style="background-color:#FFFFFF;">
                                <div class="has-text-weight-semibold has-text-grey is-size-5 p-4"
                                    style="border-bottom: 1px solid #bdbdbd">
                                    Add New Pass Report
                                </div>
                                 <div <a href="${pageContext.request.contextPath}/addExaminerForm" class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                Add New Pass Report
                </a>
            </div>
            <form action="AddPastReportServlet" method="post" enctype="multipart/form-data">
                <div class="p-4">
                    <input type="hidden" id="admin_id" name="admin_id" value="0"/>
                    <input type="hidden" name="l_id" value="${sessionScope.l_id}" />
                    
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
                                <div class="is-flex is-justify-content-space-between p-4">
                                    <a class="button is-custom2" href="../Lecturers/Report-Lecturer.jsp"><span
                                            class="has-text-weight-semibold is-size-7">Back</span></a>
                                    <a class="button is-custom" href="../Lecturers/Report-Lecturer.jsp"><span
                                            class="has-text-weight-semibold is-size-7">Save Changes</span></a>
                                </div>
                            </div>
                        </div>
        </div>
    </body>

    </html>