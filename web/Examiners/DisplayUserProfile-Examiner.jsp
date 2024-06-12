<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>User Profile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../examiner-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column px-6 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
                        <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                            User Profile
                        </div>
                        <div class="columns m-0 pb-4">
                            <div class="column">
                                <div class="is-flex is-align-items-center">
                                    <p class="has-background-black" style="border-radius: 100%; width: 90px; height:90px;">
                                        <img src="">
                                    </p>
                                    <span class="p-4">
                                        <div class="has-text-weight-semibold has-text-grey p-1">Username</div>
                                        <div class="has-text-grey has-text-weight-semibold is-size-7 px-1">Student</div>
                                        <div class="has-text-grey px-1 is-size-7">College of Computing Informatics and Mathematics</div>
                                    </span>
                                </div>
                            </div>
                            <div class="column is-flex is-justify-content-end">
                            </div>
                        </div>
                        <div class="columns is-multiline m-0 pb-6 px-2">
                            <div class="column is-full">
                                <label class="has-text-weight-semibold has-text-grey">Name</label>
                                <div class="py-2">
                                    <p class="px-4 py-2">letak sini</p>
                                </div>
                            </div>
                            <div class="column is-full">
                                <label class="has-text-weight-semibold has-text-grey">Username</label>
                                <div class="py-2">
                                    <p class="px-4 py-2">letak sini</p>
                                </div>
                            </div>
                            <div class="column is-full">
                                <label class="has-text-weight-semibold has-text-grey">Email Address</label>
                                <div class="py-2">
                                    <p class="px-4 py-2">letak sini</p>
                                </div>
                            </div>
                            <div class="column is-full">
                                <label class="has-text-weight-semibold has-text-grey">Phone Number</label>
                                <div class="py-2">
                                    <p class="px-4 py-2">letak sini</p>
                                </div>
                            </div>
                        </div>
                        <div class="is-flex is-justify-content-space-between px-3 py-5">
                            <a class="button is-custom2"><span class="has-text-weight-semibold is-size-7">Change Password</span></a>
                            <a href="${pageContext.request.contextPath}/Examiner/UserProfile-Examiner.jsp" class="button is-custom"><span class="has-text-weight-semibold is-size-7">Edit Profile</span></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>