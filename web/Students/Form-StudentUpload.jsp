<%-- 
    Document   : Form-Student
    Created on : May 2, 2024, 6:13:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fyp.model.bean.Form6" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Forms</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>

            .tabs {
                margin-bottom: 1.5rem;
                border-bottom-color: #dbdbdb !important;
            }
            .tabs ul li.is-active a {
                border-color: #dbdbdb !important;
                color: #000;
                border-bottom-color: #dbdbdb !important
            }
            .tabs ul li a {
                color: #000;
                border-bottom-color: #dbdbdb !important
            }
            .tabs ul li a:hover {
                background-color: #dbdbdb !important;
                color: #000;
            }
            .tabs ul li.is-active.light-theme a {
                color: #000;
                border-bottom-color: #dbdbdb !important
            }

            .theme-preview {
                display: inline-block;
                width: 50px;
                height: 50px;
                border-radius: 5px;
                border: 2px solid transparent;
                cursor: pointer;
            }
            .theme-preview.light {
                background-color: #eee;
            }
            .tabs.is-boxed li.is-active a {
                background-color: #ffffff;
                border-color: #dbdbdb !important;
                border-bottom-color: #fff !important;
            }
            .custom-box {
                background-color: #fff;
                border-radius: 6px;
                color: #4a4a4a;
                display: inline-block;
                border: 1px solid #dbdbdb;
                width: 100%;
            }

            .custom-swal-popup {
                width: 300px !important;
                height: 250px !important;
            }
            .custom-icon {
                width: 50px;
                height: 65px;
            }
            .custom-swal-button{
                background-color: #384D6C;
                border-color: #fff;
                color: #fff;
                font-size: 10px;
            }

        </style>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../student-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column h-100 p-4" style="background-color:#FFFFFF; overflow-y: scroll;">
                        <div class="custom-border p-6 w-100">
                            <div class="pb-4">
                                <label class="has-text-weight-bold has-text-grey is-size-4 pb-5">Forms</label>
                                <p class="has-text-white has-background-grey-light is-size-7 px-3 py-1" style="border-radius: 4px;">Final Year Project has more than 7 forms</p>
                            </div>
                            <div class="container">
                                <div class="tabs is-boxed">
                                    <ul style="border-bottom-color: #dbdbdb !important">
                                        <li data-target="tab-1" class="is-active is-size-7"><a class="p-3 has-text-weight-semibold has-text-grey">Form 5-Formulation Presentation</a></li>
                                        <li data-target="tab-2" class="is-size-7"><a class="p-3 has-text-weight-semibold has-text-grey">Form 6-Evaluation Form</a></li>
                                    </ul>
                                </div>

                                <div id="tab-1" class="tab-content">
                                    <div class="p-3">
                                        <div class="is-flex is-justify-content-end is-align-items-center pb-4">
                                            <!-- Modal Trigger Button -->
                                            <button class="button is-custom4" style="height:2rem;" onclick="toggleModal('addForm5Modal')">
                                                <span class="is-size-7">New Activity</span>
                                            </button>
                                        </div>
                                        <div class="p-1" id="table">
                                            <table class="">
                                                <thead>
                                                    <tr style="border-bottom: 2px solid #ddd;">

                                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Date Meet</th>
                                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Completed Activity</th>
                                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Next Activity</th>
                                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Approval</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="form5" items="${form5List}">
                                                    <tr>

                                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.dateMeet}</td>
                                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.completeActivity}</td>
                                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.nextActivity}</td>
                                                        <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.approval}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <br>
                                        <a class="button is-custom2 is-size-7" href="${pageContext.request.contextPath}/StudentFormServlet">Back</a>
                                    </div>
                                </div>
                            </div>
                            <div id="tab-2" class="tab-content is-hidden">
                                <div class="custom-box pl-5 pb-5 pt-2">
                                    <p class="has-text-weight-semibold has-text-grey is-size-6 pt-3">Instructions to the student:</p>
                                    <ul class="pl-5" style="list-style-type: disc;">
                                        <li class="has-text-weight-normal has-text-grey is-size-7">The maximum percentage of the similarity index for plagiarism checking is <a class="has-text-weight-bold has-text-danger">30%.</a></li>
                                        <li class="has-text-weight-normal has-text-grey is-size-7">Ensure that the information needed in the form is completed before submission to the CSP600 lecturer.</li>
                                        <li class="has-text-weight-normal has-text-grey is-size-7">Obtain the endorsement of the Supervisor that the report has been screened for plagiarism.</li>
                                        <li class="has-text-weight-normal has-text-grey is-size-7">Only a completed form will be processed.</li>
                                    </ul>
                                </div>
                                <div class=" p-3">
                                    <div class="columns is-vcentered is-mobile m-0">
                                        <div class="column">
                                            <span class="is-size-6 has-text-weight-semibold has-text-grey" style="text-transform: uppercase;">
                                                You have already uploaded and approved this form. If you need to make any changes, please kindly contact your supervisor.
                                            </span>
                                        </div>
                                    </div>
                                    <!-- Table added here -->
                                    <div class="columns is-vcentered is-mobile m-0">
                                        <div class="column">
                                            <c:if test="${not empty form6}">
                                                <table class="">
                                                    <thead>
                                                        <tr>
                                                            <th class="has-text-grey">Result</th>
                                                            <th class="has-text-grey">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:choose>
                                                            <c:when test="${form6.similarityIndex == 0 || form6.similarityIndex == null}">
                                                                <tr>
                                                                    <td class="has-text-grey">Waiting for your supervisor to check</td>
                                                                    <td class="has-text-grey">-</td>
                                                                </tr>
                                                            </c:when>
                                                            <c:when test="${form6.similarityIndex <= 30}">
                                                                <tr>
                                                                    <td class="has-text-grey">${form6.similarityIndex}%</td>
                                                                    <td class="has-text-grey">Success!!! Your report is well approved</td>
                                                                </tr>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <tr>
                                                                    <td class="has-text-grey">${form6.similarityIndex}%</td>
                                                                    <td class="has-text-grey">
                                                                        <button class="button is-warning is-size-7">Redo</button>
                                                                    </td>
                                                                </tr>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                            <c:if test="${empty form6}">
                                                <p>No Form6 data available for the given student ID.</p>
                                            </c:if>
                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const tabs = document.querySelectorAll('.tabs ul li');
                const tabContents = document.querySelectorAll('.tab-content');

                tabs.forEach(tab => {
                    tab.addEventListener('click', () => {
                        tabs.forEach(item => item.classList.remove('is-active'));
                        tab.classList.add('is-active');

                        const target = tab.dataset.target;
                        tabContents.forEach(content => {
                            if (content.id === target) {
                                content.classList.remove('is-hidden');
                            } else {
                                content.classList.add('is-hidden');
                            }
                        });
                    });
                });
            });

            function toggleModal(modalId) {
                var modal = document.getElementById(modalId);
                modal.classList.toggle('is-active');
            }
            function toggleModal(modalId) {
                var modal = document.getElementById(modalId);
                modal.classList.toggle('is-active');
            }

            // Show modal when upload button is clicked
            document.getElementById('uploadBtn').addEventListener('click', function () {
                toggleModal('uploadModal');
            });
            const fileInput = document.querySelector("#file-js-example input[type=file]");
            fileInput.onchange = () => {
                if (fileInput.files.length > 0) {
                    const fileName = document.querySelector("#file-js-example .file-name");
                    fileName.textContent = fileInput.files[0].name;
                }
            };

        </script>    

        <script>
            function toggleModal(modalId) {
                var modal = document.getElementById(modalId);
                modal.classList.toggle('is-active');
            }

            function submitRedoForm() {
                document.getElementById('redoForm').submit();
            }

            function acceptRedo() {
                Swal.fire({
                    title: 'You have accepted the redo instructions.',
                    icon: 'success',
                    confirmButtonText: 'OK',
                    customClass: {
                        popup: 'custom-swal-popup',
                        title: 'is-size-7',
                        confirmButton: 'custom-swal-button'
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        submitRedoForm(); // Submit the form after confirmation
                        toggleModal('redoModal'); // Close the modal
                    }
                });
            }

            document.addEventListener('DOMContentLoaded', () => {
                document.querySelectorAll('.button.is-warning').forEach(button => {
                    button.addEventListener('click', function () {
                        toggleModal('redoModal');
                    });
                });
            });
        </script>
        <!-- Modal for Adding Form5 -->
        <div id="addForm5Modal" class="modal">
            <div class="modal-background"></div>
            <div class="modal-content">
                <div class="box">
                    <h1 class="title is-4 has-text-centered has-text-grey">Progress Form</h1>
                    <form action="${pageContext.request.contextPath}/Form5Servlet" method="post" class="p-4">
                        <div class="field">
                            <label class="has-text-grey has-text-weight-semibold">Date Meet</label>
                            <div class="control">
                                <input class="custom-input has-text-grey" type="date" name="dateMeet" placeholder="Enter Date Meet" required>
                            </div>
                        </div>
                        <div class="field">
                            <label class="has-text-grey has-text-weight-semibold">Completed Activity</label>
                            <div class="control">
                                <input class="custom-input has-text-grey" type="text" name="completeActivity" placeholder="Enter Completed Activity" required>
                            </div>
                        </div>
                        <input type="hidden" name="action" value="addForm5">
                        <div class="field is-flex is-justify-content-space-between mt-4">
                            <div class="control">
                                <button type="submit" class="button is-custom is-size-7">Submit</button>
                            </div>
                            <div class="control">
                                <button type="button" class="button is-custom2 is-size-7" onclick="toggleModal('addForm5Modal')">Cancel</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <button class="modal-close is-large" aria-label="close" onclick="toggleModal('addForm5Modal')"></button>
        </div>
        <!-- Redo Modal -->
        <div id="redoModal" class="modal">
            <div class="modal-background"></div>
            <div class="modal-content">
                <div class="box">
                    <h1 class="title is-size-5 has-text-centered has-text-danger">Redo Required</h1>
                    <div class="content">
                        <p class="has-text-start is-size-7">Please review the following instructions for redoing your report:</p>
                        <ul>
                            <p class="has-text-grey is-size-7">1. Recheck your report to avoid it reach more than 30% </p>
                            <p class="has-text-grey is-size-7">2. Verify the accuracy of your data.</p>
                            <p class="has-text-grey is-size-7">3. Follow the guidelines strictly.</p>
                        </ul>
                        <form id="redoForm" action="${pageContext.request.contextPath}/DeleteForm6Servlet" method="post">
                            <input type="hidden" name="formtId" value="<%= ((Form6) request.getAttribute("form6")).getFormTId() %>">
                        </form>
                        <div class="field is-grouped is-grouped-centered mt-4">
                            <div class="control">
                                <button type="button" class="button is-custom3 is-size-7" onclick="acceptRedo()">Accept</button>
                            </div>
                            <div class="control">
                                <button type="button" class="button is-custom2 is-size-7" onclick="toggleModal('redoModal')">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="modal-close is-large" aria-label="close" onclick="toggleModal('redoModal')"></button>
        </div>
    </body>
</html>