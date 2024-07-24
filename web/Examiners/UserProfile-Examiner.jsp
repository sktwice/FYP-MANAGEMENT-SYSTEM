<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.fyp.model.bean.Lecturer" %>
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
        <title>Lecturer Profile</title>
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
        </style>
    </head>
    <body data-theme="light">
        <div class="content-wrapper">
            <jsp:include page="../examiner-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <section class="section">
                    <div class="container">
                        <h1 class="title has-text-grey" style="text-transform: uppercase"><%= ((Lecturer) request.getAttribute("Lecturer")).getlName() %></h1>
                        <div class="column is-one-two">
                            <figure class="image is-128x128">
                                <img id="profile-img" src="images/lecturers/<%= ((Lecturer) request.getAttribute("Lecturer")).getiImage() %>" alt="Profile Picture">
                            </figure>
                            <a id="remove-picture" href="#" class="has-text-danger is-size-7 hover-underline p-1">Remove picture</a>
                            <div class="file is-small">
                                <label class="file-label">
                                    <input class="file-input" type="file" name="profile-picture" id="profile-picture">
                                        <span class="button is-custom4 file-label">Upload picture</span>
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
                                                <input type="hidden" name="id" value="<%= ((Lecturer) request.getAttribute("Lecturer")).getlId() %>" />
                                                <label class="label has-text-grey">Name</label>
                                                <div class="control">
                                                    <input class="input custom-input2" type="text" placeholder="Name" value="<%= ((Lecturer) request.getAttribute("Lecturer")).getlName() %>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="column is-one-third">
                                            <div class="field">
                                                <label class="label has-text-grey">Phone Number</label>
                                                <div class="control">
                                                    <input class="input custom-input2" type="text" placeholder="Phone Number" value="0<%= ((Lecturer) request.getAttribute("Lecturer")).getPhoneNum() %>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="columns">
                                        <div class="column is-one-third">
                                            <div class="field">
                                                <label class="label has-text-grey">Email Address</label>
                                                <div class="control">
                                                    <input class="input custom-input2" type="text" placeholder="Email Address" value="<%= ((Lecturer) request.getAttribute("Lecturer")).getEmail() %>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="control">
                                            <button class="button is-custom4">Save settings</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div id="password-tab" class="tab-content hidden">
                                <form id="passwordForm" action="UpdatePasswordLecturer" method="post">
                                    <input type="hidden" name="loginId" id="loginId" value="<%= ((Login) request.getAttribute("login")).getLoginId() %>" />
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
                        title: "Error",
                        text: "Current password cannot be empty",
                        icon: "error",
                        confirmButtonColor: "#3085d6",
                        confirmButtonText: "OK"
                    });
                    return;
                }

                if (currentPassword !== storedPassword) {
                    Swal.fire({
                        title: "Error",
                        text: "Current password is incorrect",
                        icon: "error",
                        confirmButtonColor: "#3085d6",
                        confirmButtonText: "OK"
                    });
                    return;
                }

                if (newPassword === "" || confirmPassword === "") {
                    Swal.fire({
                        title: "Error",
                        text: "New password and confirm password cannot be empty",
                        icon: "error",
                        confirmButtonColor: "#3085d6",
                        confirmButtonText: "OK"
                    });
                    return;
                }

                if (newPassword !== confirmPassword) {
                    Swal.fire({
                        title: "Error",
                        text: "New password and confirm password do not match",
                        icon: "error",
                        confirmButtonColor: "#3085d6",
                        confirmButtonText: "OK"
                    });
                    return;
                }

                Swal.fire({
                    title: "Success",
                    text: "Password updated successfully. Please relogin",
                    icon: "success",
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: "OK"
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
