<%-- 
    Document   : UserProfile-Student
    Created on : May 2, 2024, 6:13:32 PM
    Author     : User
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.fyp.model.bean.Student" %>
<%@page import="com.fyp.model.bean.Login"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <title>Student Profile</title>
        <style>
            .custom-input2 {
                border-radius: 6px;
                border-width: 1px;
                border-color: #bdbdbd;
                outline: none;
                background-color: rgba(255, 255, 255, 0.3);
                color: #4a4a4a;
            }
            .custom-input2::placeholder {
                color: #bdbdbd;
            }
            .hidden {
                display: none;
            }
            .tabs {
                margin-bottom: 1.5rem;
            }
            .file-label .icon {
                margin-left: 10px;
            }
            .image.is-128x128 {
                margin-bottom: 10px;
            }
            #remove-picture {
                margin-top: 10px;
                display: inline-block;
            }
            .tabs ul li.is-active a {
                border-color: #000;
                color: #000;
            }
            .tabs ul li a {
                color: #000;
            }
            .tabs ul li a:hover {
                background-color: #00b89c;
            }
            .tabs ul li.is-active.light-theme a {
                color: #000;
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
    <body data-theme="light">
        <div class="content-wrapper">
            <jsp:include page="../student-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <section class="section">
                    <div class="container">
                        <h1 class="title has-text-grey" style="text-transform: uppercase;"><%= ((Student) request.getAttribute("Student")).getsName() %></h1>
                        <div class="column is-one-two">
                            <figure class="image is-128x128" style="border-radius: 50%; background-color: black;">
                                <img id="profile-img" src="images/lecturers/<%= ((Student) request.getAttribute("Student")).getsImage() %>" 
                                     alt="" style="height: -webkit-fill-available !important; border-radius: 50%;">
                            </figure>
                            <a id="remove-picture" href="#" class="has-text-danger is-size-6 hover-underline p-2">Remove picture</a>
                            <div class="file is-small">
                                <label class="file-label">
                                    <input class="file-input" type="file" name="profile-picture" id="profile-picture">
                                        <span class="button is-custom4 file-label is-size-6">Upload picture</span>
                                </label>
                            </div>
                        </div>
                        <div class="column">
                            <div class="tabs is-boxed">
                                <ul>
                                    <li class="is-active" data-tab="details-tab"><a>My details</a></li>
                                    <li data-tab="password-tab"><a>Password</a></li>
                                </ul>
                            </div>
                            <div id="details-tab" class="tab-content">
                                <form action=" " method="post">
                                    <div class="columns">
                                        <div class="column is-one-third">
                                            <div class="field">
                                                <input type="hidden" name="id" value="<%= ((Student) request.getAttribute("Student")).getStudentId() %>" />
                                                <label class="label has-text-grey">Name</label>
                                                <div class="control">
                                                    <input class="input custom-input2 has-text-grey" type="text" placeholder="Name" value="<%= ((Student) request.getAttribute("Student")).getsName() %>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="column is-one-third">
                                            <div class="field">
                                                <label class="label has-text-grey">Phone Number</label>
                                                <div class="control">
                                                    <input class="input custom-input2 has-text-grey" type="text" placeholder="Phone Number" value="0<%= ((Student) request.getAttribute("Student")).getPhoneNum() %>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="columns">
                                        <div class="column is-one-third">
                                            <div class="field">
                                                <label class="label has-text-grey">Course</label>
                                                <div class="control">
                                                    <input class="input custom-input2 has-text-grey" type="text" placeholder="Course" value="<%= ((Student) request.getAttribute("Student")).getsCourse() %>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="column is-one-third">
                                            <div class="field">
                                                <label class="label has-text-grey">Semester</label>
                                                <div class="control">
                                                    <input class="input custom-input2 has-text-grey" type="text" placeholder="Semester" value="<%= ((Student) request.getAttribute("Student")).getSemester() %>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="control">
                                            <button class="button is-custom4 is-size-6">Save settings</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div id="password-tab" class="tab-content hidden">
                                <form id="passwordForm" action="UpdatePasswordServlet" method="post">
                                    <input type="hidden" name="loginId" id="loginId" value="<%= ((Student) request.getAttribute("Student")).getLoginId() %>" />
                                    <input type="hidden" id="storedPassword" value="<%= ((Login) request.getAttribute("login")).getPassword() %>" />

                                    <div class="columns">
                                        <div class="column is-one-third">
                                            <div class="field">
                                                <label class="label has-text-grey">Current Password</label>
                                                <div class="control">
                                                    <input class="input custom-input2" type="password" name="currentPassword" id="currentPassword" placeholder="Current Password">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="column is-one-third">
                                            <div class="field">
                                                <label class="label has-text-grey">New Password</label>
                                                <div class="control">
                                                    <input class="input custom-input2" type="password" name="newPassword" id="newPassword" placeholder="New Password">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="columns">
                                        <div class="column is-one-third">
                                            <div class="field">
                                                <label class="label has-text-grey">Confirm New Password</label>
                                                <div class="control">
                                                    <input class="input custom-input2" type="password" id="confirmPassword" placeholder="Confirm New Password">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="control">
                                            <button type="button" id="updatePasswordBtn" class="button is-custom4">Update Password</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <script>
            document.getElementById('profile-picture').addEventListener('change', function (event) {
                const file = event.target.files[0];
                const reader = new FileReader();

                reader.onload = function (e) {
                    document.getElementById('profile-img').src = e.target.result;
                };

                reader.readAsDataURL(file);
            });

            document.getElementById('remove-picture').addEventListener('click', function (event) {
                event.preventDefault();
                document.getElementById('profile-img').src = 'https://via.placeholder.com/128';
                document.getElementById('profile-picture').value = '';
            });

            document.querySelectorAll('.tabs ul li').forEach(tab => {
                tab.addEventListener('click', function () {
                    document.querySelectorAll('.tabs ul li').forEach(tab => tab.classList.remove('is-active'));
                    tab.classList.add('is-active');

                    const targetTab = tab.getAttribute('data-tab');
                    document.querySelectorAll('.tab-content').forEach(content => content.classList.add('hidden'));
                    document.getElementById(targetTab).classList.remove('hidden');
                });
            });
        </script>
        <script>
            document.getElementById('updatePasswordBtn').addEventListener('click', function() {
    var currentPassword = document.getElementById('currentPassword').value;
    var newPassword = document.getElementById('newPassword').value;
    var confirmPassword = document.getElementById('confirmPassword').value;
    var storedPassword = document.getElementById('storedPassword').value;

    if (currentPassword === "") {
        Swal.fire({
            title: "Cannot be empty",
            icon: "error",
            confirmButtonColor: "#3085d6",
            confirmButtonText: "OK",
            customClass: {
                popup: 'custom-swal-popup',
                title: 'is-size-6',
                confirmButton: 'custom-swal-button'
            }
        });
        return;
    }

    if (currentPassword !== storedPassword) {
        Swal.fire({
            title: "Current password is incorrect",
            icon: "error",
            confirmButtonColor: "#3085d6",
            confirmButtonText: "OK",
            customClass: {
                popup: 'custom-swal-popup',
                title: 'is-size-6',
                confirmButton: 'custom-swal-button',
                cancelButton: 'custom-swal-button'
            }
        });
        return;
    }

    if (newPassword === "" || confirmPassword === "") {
        Swal.fire({
            title: "Cannot be empty",
            icon: "error",
            confirmButtonColor: "#3085d6",
            confirmButtonText: "OK",
            customClass: {
                popup: 'custom-swal-popup',
                title: 'is-size-6',
                confirmButton: 'custom-swal-button',
                cancelButton: 'custom-swal-button'
            }
        });
        return;
    }

    if (newPassword !== confirmPassword) {
        Swal.fire({
            title: "Do not match",
            icon: "error",
            confirmButtonColor: "#3085d6",
            confirmButtonText: "OK",
            customClass: {
                popup: 'custom-swal-popup',
                title: 'is-size-6',
                confirmButton: 'custom-swal-button',
                cancelButton: 'custom-swal-button'
            }
        });
        return;
    }

    Swal.fire({
        title: "Password updated successfully",
        icon: "success",
        confirmButtonColor: "#3085d6",
        confirmButtonText: "OK",
        customClass: {
            popup: 'custom-swal-popup',
            title: 'is-size-6',
            confirmButton: 'custom-swal-button',
            cancelButton: 'custom-swal-button'
        }
    }).then((result) => {
        if (result.isConfirmed) {
            // Submit the form if all validations pass
            document.getElementById('passwordForm').submit();
        }
    });
});

        </script>
    </body>
</html>