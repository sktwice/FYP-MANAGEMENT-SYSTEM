<%-- 
    Document   : Form-Student
    Created on : May 2, 2024, 6:13:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            .custom-swal-popup {
                width: 400px !important;
                height: 250px !important;
            }
            .custom-icon {
                width: 50px;
                height: 65px;
            }
            .custom-swal-content {
                font-size: 10px !important;
                margin-bottom: 10px !important;
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
                                <div class="p-3">
                                    <div class="columns is-vcentered is-mobile m-0">
                                        <div class="column">
                                            <span class="is-size-6 has-text-weight-semibold has-text-grey" style="text-transform: uppercase;">
                                                This form grants permission for supervisors to evaluate students' proposal reports.
                                            </span>
                                            <!-- New sentence added here -->
                                            <div>
                                                <span class="is-size-6 has-text-weight-normal has-text-grey">
                                                    This is for final proposal report. Make sure contact your supervisor before send it.
                                                </span>
                                            </div>
                                        </div>
                                        <div class="column is-narrow">
                                            <button id="uploadBtn" class="button is-custom4 is-small">Upload</button>
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
        <!-- Modal for Adding Form5 -->
        <div id="addForm5Modal" class="modal">
            <div class="modal-background"></div>
            <div class="modal-content">
                <div class="box">
                    <h1 class="title is-4 has-text-centered has-text-grey">New Activity Form</h1>
                    <form action="${pageContext.request.contextPath}/Form5Servlet" method="post" class="p-4">
                        <div class="field">
                            <label class="has-text-grey has-text-weight-semibold">Date Meet</label>
                            <div class="control">
                                <input class="has-text-grey" type="date" name="dateMeet" placeholder="Enter Date Meet" required>
                            </div>
                        </div>
                        <div class="field">
                            <label class="has-text-grey has-text-weight-semibold">Completed Activity</label>
                            <div class="control">
                                <input class="has-text-grey" type="text" name="completeActivity" placeholder="Enter Completed Activity" required>
                            </div>
                        </div>
                        <input type="hidden" name="action" value="addForm5">
                        <div class="field is-grouped is-grouped-centered mt-4">
                            <div class="control">
                                <button type="submit" class="button is-custom3 is-size-7">Submit</button>
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

        <div id="uploadModal" class="modal">
            <div class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head has-background-white">
                    <p class="modal-card-title has-text-weight-semibold has-text-centered has-text-grey-dark">Upload Proposal</p>
                </header>
                <form id="uploadForm" action="${pageContext.request.contextPath}/F6StudentServlet" method="post" enctype="multipart/form-data">
                    <section class="modal-card-body has-background-white">
                        <div class="field">
                            <div id="file-js-example" class="file has-name is-info is-small">
                                <label class="file-label is-size-7">
                                    <input class="file-input" type="file" name="pdfFile" />
                                    <span class="file-cta">
                                        <span class="file-icon has-text-white">
                                            <i class="fas fa-upload"></i>
                                        </span>
                                        <span class="file-label has-text-white"> Choose a file… </span>
                                    </span>
                                    <span class="file-name"> No file uploaded </span>
                                </label>
                            </div>
                        </div>
                    </section>
                    <footer class="modal-card-foot has-background-white is-flex is-justify-content-space-between p-5 w-100" 
                            style="border-top-color: #bdbdbd 1px solid;">
                        <div class="control">
                            <button type="button" class="button is-custom2 is-size-7" onclick="toggleModal('uploadModal')">Cancel</button>
                        </div>
                        <div class="control">
                            <a href="javascript:void(0);" class="button is-custom3 is-size-7" onclick="confirmUpload(event)">Upload</a>
                        </div>
                    </footer>
                </form>
            </div>
        </div>
        <script>
            function confirmUpload(event) {
                event.preventDefault(); // Prevent the default form submission

                // Display the SweetAlert2 confirmation dialog
                Swal.fire({
                    title: "Are you sure?",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#384D6C",
                    cancelButtonColor: "#35B638",
                    confirmButtonText: "Yes",
                    customClass: {
                        popup: 'custom-swal-popup',
                        title: 'is-size-6',
                        text: 'is-size-7',
                        confirmButton: 'custom-swal-button',
                        cancelButton: 'custom-swal-button'

                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        // If confirmed, show success message and submit the form
                        Swal.fire({
                            title: "The form has been approved!",
                            icon: "success",
                            confirmButtonColor: "#384D6C",
                            confirmButtonText: "OK",
                            customClass: {
                                popup: 'custom-swal-popup',
                                title: 'is-size-6',
                                text: 'is-size-7',
                                confirmButton: 'custom-swal-button'

                            }
                        }).then(() => {
                            // Find the form and submit it
                            var form = document.getElementById('uploadForm');
                            if (form) {
                                form.submit();
                            }
                        });
                    }
                });
            }
        </script>           
    </body>
</html>