<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="com.fyp.model.bean.Faculty" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Register Lecturer</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            .grid-container {
                display: grid;
              }
              .grid-container {
                display: inline-grid;
              }
        </style>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../admin-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column px-6 py-4" style="background-color:#FFFFFF;">
                        <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                            Register Lecturer
                        </div>
                        <div class="p-4">
                            <form style="" class="columns m-0 p-0 is-multiline" action="${pageContext.request.contextPath}/AddLecturer" method="post" enctype="multipart/form-data">
                            <input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.admin_id}">
                            
                            <!-- Added Radio Button Section -->
                            <div class="column is-full p-2">
                                <label class="has-text-weight-semibold has-text-grey">Do this lecturer teach CSP600?</label>
                                <div class="">
                                    <label class="radio has-text-grey">
                                        <input type="radio" name="teaches_csp600" value="yes" required>
                                        Yes
                                    </label>
                                    <label class="radio has-text-grey">
                                        <input type="radio" name="teaches_csp600" value="no" required>
                                        No
                                    </label>
                                </div>
                            </div>
                            <!-- End of Radio Button Section -->

                            <div class="column is-half p-2">
                                <label for="username" class="has-text-weight-semibold has-text-grey">Username:</label>
                                <div class="">
                                    <input class="px-4 py-2" type="text" id="username" name="username" placeholder="Username" required 
                                           style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                                </div>
                            </div>

                            <div class="column is-half p-2">
                                <label for="password" class="has-text-weight-semibold has-text-grey">Password:</label>
                                <div class="">
                                    <input class="px-4 py-2" type="password" id="password" name="password" placeholder="Password" required 
                                           style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                                </div>
                            </div>
                            
                            <div class="column is-half p-2">
                                <label for="l_name" class="has-text-weight-semibold has-text-grey">Lecturer Name:</label>
                                <div class="">
                                    <input class="px-4 py-2" type="text" id="l_name" name="l_name" placeholder="Full Name" required 
                                           style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                                </div>
                            </div>
                            
                            <div class="column is-half p-2">
                                <label for="l_course" class="has-text-weight-semibold has-text-grey">Lecturer Course:</label>
                                <div class="py-2">
                                    <select id="l_course" name="l_course" class="px-4 py-2" type="text" required 
                                            style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                                        <option value="">Select Course</option>
                                        <c:forEach var="course" items="${courseList}">
                                            <option value="${course}">${course}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="column is-half p-2">
                                <label for="position" class="has-text-weight-semibold has-text-grey">Position:</label>
                                <div class="">
                                    <select id="position" name="position" class="p-2" required style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                                        <option value="">Select Position</option>
                                        <option value="N/A">N/A</option>
                                        <option value="Supervisor">Supervisor</option>
                                        <option value="Examiner">Examiner</option>
                                        <option value="Both">Both</option>
                                    </select>
                                </div>
                            </div>

                            <div class="column is-half p-2">
                                <label for="f_id" class="has-text-weight-semibold has-text-grey">Faculty:</label>
                                <div class="">
                                    <select id="f_id" name="f_id" class="p-2 dropdown" required 
                                            style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                                        <option value="">Select Faculty</option>
                                        <c:forEach var="faculty" items="${facultyList}">
                                            <option value="${faculty.fId}">${faculty.fName} :- ${faculty.fCourse}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="column is-half p-2">
                                <label for="phone_num" class="has-text-weight-semibold has-text-grey">Phone Number:</label>
                                <div class="">
                                    <input class="px-4 py-2" type="text" id="phone_num" name="phone_num" placeholder="e.g: 0112345678" required 
                                           style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                                </div>
                            </div>

                            <div class="column is-half p-2">
                                <label for="email" class="has-text-weight-semibold has-text-grey">Email:</label>
                                <div class="">
                                    <input class="px-4 py-2" type="email" id="email" name="email" placeholder="@email.com" required 
                                           style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                                </div>
                            </div>

                            <div class="column is-full p-2">
                                <label class="has-text-weight-semibold has-text-grey">Image</label>
                                <div class="py-2">
                                    <input type="file" name="l_image">
                                </div>
                            </div>

                            <div class="column is-full p-2 is-flex is-justify-content-end">
                                <button class="button is-success has-text-white" type="submit">Register</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>