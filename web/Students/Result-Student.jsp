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
                                        <h1 class=" has-text-grey is-size-3 has-text-weight-bold"><%= ((Lecturer) request.getAttribute("lecturer")).getlName() %>    <span class="tag is-warning">Supervisor</span></h1>
                                        <p class=" has-text-grey">College of Computing, Informatics and Mathematics</p>
                                        <p class=" is-size-6 has-text-grey pb-3"><%= ((Lecturer) request.getAttribute("lecturer")).getEmail() %></p>
                                        <p class=" is-size-6 has-text-grey pb-3">0<%= ((Lecturer) request.getAttribute("lecturer")).getPhoneNum() %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>    

                    <div class="pt-5">
                        <div class="custom-border p-5 w-100">
                            <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                                <div>
                                    <label class="has-text-weight-semibold has-text-grey-dark is-size-5">Carry Marks </label>
                                </div>
                            </div>
                            <div>
                                <div class="p-1" id="table">
                                    <table class="">
                                        <thead>
                                            <tr style="border-bottom: 2px solid #ddd;">
                                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Form</th>
                                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Mark</th>
                                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Weightage</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <tr>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">Form 2</td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" id="form2T"></td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" id="form2W"></td>
                                            </tr>
                                            <tr>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">Form 3</td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" id="form3T"></td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" id="form3W"></td>
                                            </tr>
                                            <tr>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">Form 4</td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" id="form4T"></td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" id="form4W"></td>
                                            </tr>
                                            <tr>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">Form 8</td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" id="form8T"></td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" id="form8W"></td>
                                            </tr>
                                            <tr>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">Total</td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" id="TotalT"></td>
                                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" id="TotalW"></td>
                                            </tr>
                                        </tbody>
                                    </table>
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
                    
                    var form2= <%= ((Total) request.getAttribute("total")).getTotal2() %>;
                    var form3= <%= ((Total) request.getAttribute("total")).getTotal3() %>;
                    var form4= <%= ((Total) request.getAttribute("total")).getTotal4() %>;
                    var form8lec= total.total8lec;
                    var form8sv= total.total8sv;
                    var form8ex= total.total8ex;
                    var f8Total= form8lec;
                    var f8Marks= form8lecMarks;
                    var totalT= form2 + form3 + form4 + f8Total;
                    var totalW= form2Marks + form3Marks + form4Marks + f8Marks;

                    // Calculate sum for each category
                    

                    // Update HTML elements with calculated marks
                    
                    
                    document.getElementById('form2T').innerText =  form2.toFixed(2);
                    document.getElementById('form2W').innerText =  form2Marks.toFixed(2) + "%";
                    document.getElementById('form3T').innerText =  form3.toFixed(2);
                    document.getElementById('form3W').innerText =  form3Marks.toFixed(2) + "%";
                    document.getElementById('form4T').innerText =  form4.toFixed(2);
                    document.getElementById('form4W').innerText =  form4Marks.toFixed(2) + "%";
                    document.getElementById('form8T').innerText =  f8Total.toFixed(2);
                    document.getElementById('form8W').innerText =  f8Marks.toFixed(2) + "%";
                    document.getElementById('TotalT').innerText =  totalT.toFixed(2);
                    document.getElementById('TotalW').innerText =  totalW.toFixed(2) + "%";
                }

                // Call the function to calculate marks when the page loads
                calculateMarks();
            </script>
        </div>
    </body>
</html>