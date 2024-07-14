<%-- 
    Document   : Result-Student
    Created on : May 2, 2024, 6:18:43 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.fyp.model.bean.Lecturer" %>
<%@ page import="com.fyp.Student.SubmitProposalSV.LecturerDAO.Total" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.io.*,java.sql.*" %>

<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .marks-section {
            margin-bottom: 20px;
        }
        .marks-section h2, .marks-section p {
            margin: 5px 0;
        }
        #result {
            margin-top: 20px;
            font-size: 1.2em;
            font-weight: bold;
        }
    </style>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../student-sidebar.jsp"></jsp:include>
            <div class="main-content">
            <div class="column h-100 px-4 py-2" style="background-color: #FFFFFF; overflow-y: scroll;">
                <div class="custom-border p-6 pt-4 w-100">
                    <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                        <div>
                            <div class="columns is-vcentered is-multiline is-mobile">
                                <!-- Profile Image -->
                                <div class="column is-narrow">
                                    <figure class="image is-128x128" style="border-radius: 50%; background-color: black;">
                                <img id="profile-img" src="../images/lecturers/<%= ((Lecturer) request.getAttribute("lecturer")).getiImage() %>" 
                                     alt="" style="height: -webkit-fill-available !important; border-radius: 50%;">
                            </figure>
                                </div>
                                <!-- Profile Information -->
                                <div class="column">
                                    <h1 class="title has-text-grey is-size-3"><%= ((Lecturer) request.getAttribute("lecturer")).getlName() %><span class="tag is-warning">Supervisor</span></h1>
                                    <p class="subtitle has-text-grey">College of Computing, Informatics and Mathematics</p>
                                    <p class=""><span class="icon has-text-info"><i class="fas fa-users"></i></span><strong class="has-text-grey">12</strong> students</p>
                                </div>
                                <!-- Contact Information -->
                                <div class="column is-narrow profile-info is-justify-content-end">
                                    <p class="subtitle is-size-6 is-justify-content-end"><%= ((Lecturer) request.getAttribute("lecturer")).getEmail() %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>              
                <div class="pt-5">
                    <div class="custom-border p-3 pt-4 w-100">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                            <div>
                                <label class="pl-5 has-text-weight-bold has-text-grey is-size-5">Marks</label>
                            </div>
                        </div>
                        <div>
                            <div class="marks-section">
                                <h2>Lecturer</h2>
                                <p id="lecturerMarks">Marks: </p>
                            </div>

                            <div class="marks-section">
                                <h2>Supervisor</h2>
                                <p id="supervisorMarks">Marks: </p>
                            </div>

                            <div class="marks-section">
                                <h2>Examiner</h2>
                                <p id="examinerMarks">Marks: </p>
                            </div>

                            <div class="marks-section">
                                <h2>Total Marks</h2>
                                <p id="totalMarks">Total Marks: </p>
                            </div>
                        </div>
                    </div>
                    
                </div> 
            </div> 
            </div> 
            <script>
                // Function to calculate and update marks
                function calculateMarks() {
                    // Replace with your actual data or retrieve from server
                    var total = {
                        total2: <%= ((Total) request.getAttribute("total")).getTotal2() %>,
                        total3: <%= ((Total) request.getAttribute("total")).getTotal3() %>,
                        total4: <%= ((Total) request.getAttribute("total")).getTotal4() %>,
                        total7sv: <%= ((Total) request.getAttribute("total")).getTotal7sv() %>,
                        total7ex: <%= ((Total) request.getAttribute("total")).getTotal7ex() %>,
                        total8lec: <%= ((Total) request.getAttribute("total")).getTotal8lec() %>,
                        total8sv: <%= ((Total) request.getAttribute("total")).getTotal8sv() %>,
                        total8ex: <%= ((Total) request.getAttribute("total")).getTotal8ex() %>
                    };

                    // Calculate marks for each section
                    var form2Marks = (total.total2 / 100) * 10;
                    var form3Marks = (total.total3 / 100) * 10;
                    var form4Marks = (total.total4 / 100) * 10;
                    var form7svMarks = (total.total7sv / 100) * 30;
                    var form7exMarks = (total.total7ex / 100) * 15;
                    var form8lecMarks = (total.total8lec / 220) * 10;
                    var form8svMarks = (total.total8sv / 220) * 10;
                    var form8exMarks = (total.total8ex / 220) * 5;

                    // Calculate sum for each category
                    var lecturerMarks = form2Marks + form3Marks + form4Marks + form8lecMarks;
                    var supervisorMarks = form7svMarks + form8svMarks;
                    var examinerMarks = form7exMarks + form8exMarks;
                    var totalMarks = lecturerMarks + supervisorMarks + examinerMarks;

                    // Update HTML elements with calculated marks
                    document.getElementById('lecturerMarks').innerText = "Marks: " + lecturerMarks.toFixed(2)+"%";
                    document.getElementById('supervisorMarks').innerText = "Marks: " + supervisorMarks.toFixed(2)+"%";
                    document.getElementById('examinerMarks').innerText = "Marks: " + examinerMarks.toFixed(2)+"%";
                    document.getElementById('totalMarks').innerText = "Total Marks: " + totalMarks.toFixed(2)+"%";
                }

                // Call the function to calculate marks when the page loads
                calculateMarks();
            </script>
            </div>
    </body>
</html>

