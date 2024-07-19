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
        <title>Title</title>
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
                    <button class="button is-custom" style="height:2rem;" onclick="toggleModal('addForm5Modal')">
                        <span class="is-size-7">Add</span>
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
                        <a class="button is-custom2" href="${pageContext.request.contextPath}/StudentFormServlet">Back</a>
                    </div>
                        </div>
                    </div>

                    <div id="tab-2" class="tab-content is-hidden">
                        <div class="p-3">
    <div class="columns is-vcentered is-mobile m-0">
        <div class="column">
            <span class="is-size-6 has-text-weight-semibold has-text-grey" style="text-transform: uppercase;">
                You already upload and approved this form!!!
            </span>
            <!-- New sentence added here -->
            <div>
                <span class="is-size-6 has-text-weight-normal has-text-grey">
                    For any changes please refer to your supervisor back.
                </span>
            </div>
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
                                    <button class="button is-warning">Redo</button>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            <p class="has-text-weight-bold mt-4">
                IMPORTANCE!!!<br>
                If your similarity is more than 30%, you need to click redo. It will delete your past report, and you need to resend the latest one based on the pop-up instruction.<br>
                If your similarity is less than 30%, that means your report is clean to go and approved by your supervisor.<br>
                For any information, please refer to your supervisor.
            </p>
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
            window.onbeforeunload = function () {
                return "Your work will be lost.";
            };

            function toggleModal(modalId) {
                var modal = document.getElementById(modalId);
                modal.classList.toggle('is-active');
            }
            function toggleModal(modalId) {
            var modal = document.getElementById(modalId);
            modal.classList.toggle('is-active');
        }

        // Show modal when upload button is clicked
        document.getElementById('uploadBtn').addEventListener('click', function() {
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
            title: 'Accepted!',
            text: 'You have accepted the redo instructions.',
            icon: 'success',
            confirmButtonText: 'OK'
        }).then((result) => {
            if (result.isConfirmed) {
                submitRedoForm(); // Submit the form after confirmation
                toggleModal('redoModal'); // Close the modal
            }
        });
    }

    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.button.is-warning').forEach(button => {
            button.addEventListener('click', function() {
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
            <h1 class="title is-4 has-text-centered has-text-grey">Add Form 5 Entry</h1>
            <form action="${pageContext.request.contextPath}/Form5Servlet" method="post" class="p-4">
                <div class="field">
                    <label class="">Date Meet</label>
                    <div class="control">
                        <input class="" type="date" name="dateMeet" placeholder="Enter Date Meet" required>
                    </div>
                </div>
                <div class="field">
                    <label class="">Completed Activity</label>
                    <div class="control">
                        <input class="" type="text" name="completeActivity" placeholder="Enter Completed Activity" required>
                    </div>
                </div>
                <input type="hidden" name="action" value="addForm5">
                <div class="field is-grouped is-grouped-centered mt-4">
                    <div class="control">
                        <button type="submit" class="button is-custom3 is-outlined">Submit</button>
                    </div>
                    <div class="control">
                        <button type="button" class="button is-custom2 is-outlined" onclick="toggleModal('addForm5Modal')">Cancel</button>
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
            <h1 class="title is-4 has-text-centered has-text-grey">Redo Required</h1>
            <div class="content">
                <p class="has-text-centered">Please review the following instructions for redoing your report:</p>
                <ul>
                    <li>1. Recheck your report to avoid it reach more than 30% </li>
                    <li>2. Verify the accuracy of your data.</li>
                    <li>3. Follow the guidelines strictly.</li>
                </ul>
                <form id="redoForm" action="${pageContext.request.contextPath}/DeleteForm6Servlet" method="post">
                    <input type="hidden" name="formtId" value="<%= ((Form6) request.getAttribute("form6")).getFormTId() %>">
                </form>
                <div class="field is-grouped is-grouped-centered mt-4">
                    <div class="control">
                        <button type="button" class="button is-success" onclick="acceptRedo()">Accept</button>
                    </div>
                    <div class="control">
                        <button type="button" class="button is-danger" onclick="toggleModal('redoModal')">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <button class="modal-close is-large" aria-label="close" onclick="toggleModal('redoModal')"></button>
</div>


                        
    </body>
</html>