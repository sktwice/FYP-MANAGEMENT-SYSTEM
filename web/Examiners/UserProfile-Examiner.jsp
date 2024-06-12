<%-- 
    Document   : UserProfile-Examiner
    Created on : May 2, 2024, 6:54:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <link rel="stylesheet" href="../css/style.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        
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
        </style>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../examiner-sidebar.jsp"></jsp:include>
            <div class="main-content">
            <div class="column px-6 py-3" style="background-color:#FFFFFF;">
                <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                    User Profile
                </div>
                <div class="columns m-0 p-0">
                    <div class="column">
                        <div class="is-flex is-align-items-center">
                            <p class="has-background-black" style="border-radius: 100%; width: 90px; height:90px;">
                                <img src="">
                            </p>
                            <span class="p-2">
                                <div class="has-text-weight-semibold has-text-grey is-size-5">Username</div>
                                <div class="has-text-grey has-text-weight-semibold is-size-6 px-1">Examiner</div>
                                <div class="has-text-grey px-1 is-size-7">College of Computing Informatics and Mathematics</div>
                            </span>
                        </div>
                    </div>
                    <div class="column is-flex is-justify-content-end">
                        <div class="p-1">
                            <button class="button is-custom"><span class="has-text-weight-semibold is-size-7">Upload Photo</span></button>
                        </div>
                        <div class="p-1">
                            <button class="button is-delete is-outlined"><span class="has-text-weight-semibold is-size-7">Delete</span></button>
                        </div>
                    </div>
                </div>
                <div class="columns is-multiline m-0 p-0">
                    <div class="column is-full">
                        <label class="has-text-weight-semibold has-text-grey">Name</label>
                        <div class="field">
                            <div class="control has-icons-left">
                                <input class="input custom-input2 px-7 py-3"  type="text" placeholder="Full Name">
                                <span class="icon is-small is-left pt-4">
                                    <i class="fas fa-user"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                     <div class="column is-full">
                        <label class="has-text-weight-semibold has-text-grey">Username</label>
                        <div class="field">
                            <div class="control has-icons-left">
                                <input class="input custom-input2 px-7 py-3" type="text" placeholder="Username">
                                <span class="icon is-small is-left pt-4">
                                    <i class="fas fa-phone"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="column is-half">
                        <label class="has-text-weight-semibold has-text-grey">Email Address</label>
                        <div class="field pt-1">
                            <div class="control has-icons-left">
                                <input class="input custom-input2 px-7 py-3" type="email" placeholder="@uitm.edu.my">
                                <span class="icon is-small is-left">
                                    <i class="fas fa-envelope"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="column is-half">
                        <label class="has-text-weight-semibold has-text-grey">Phone Number</label>
                        <div class="field pt-1">
                            <div class="control has-icons-left">
                                <input class="input custom-input2 px-7 py-3" type="tel" placeholder="+60 12345546">
                                <span class="icon is-small is-left">
                                    <i class="fas fa-phone"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="column is-half">
                        <label class="has-text-weight-semibold has-text-grey">Password</label>
                        <div class="field">
                            <div class="control has-icons-left">
                                <input class="input custom-input2 px-7 py-3" type="password" placeholder="+60 12345546">
                                <span class="icon is-small is-left pt-4">
                                    <i class="fas fa-phone"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="column is-half">
                        <label class="has-text-weight-semibold has-text-grey">New Password</label>
                        <div class="field">
                            <div class="control has-icons-left has-icons-right">
                                <input class="input custom-input2 px-7 py-3" type="Password" placeholder="New Password">
                                <span class="icon is-small is-left pt-4">
                                    <i class="fas fa-key"></i>
                                </span>
                                <span class="icon is-small is-right pt-4">
                                    <i class="fas fa-eye"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="column is-full">
                        <label class="has-text-weight-semibold has-text-grey">Confirm New Password</label>
                        <div class="field">
                            <div class="control has-icons-left">
                                <input class="input custom-input2 px-7 py-3" type="password" placeholder="confirm new password">
                                <span class="icon is-small is-left pt-4">
                                    <i class="fas fa-lock"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="is-flex is-justify-content-space-between px-3 pt-6">
                    <button class="button is-custom2"><span class="has-text-weight-semibold is-size-7">Back</span></button>
                    <button class="button is-custom"><span class="has-text-weight-semibold is-size-7">Save Changes</span></button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
