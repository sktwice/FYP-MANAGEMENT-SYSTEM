<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en" style="height: 100%;">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Title</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
            <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        </head>

        <body>
            <div class="content-wrapper">
                <jsp:include page="../admin-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column px-6 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
                        <div class="has-text-weight-semibold has-text-grey is-size-5 p-4"
                            style="border-bottom: 1px solid #bdbdbd">
                            User Profile
                        </div>
                        <div class="columns m-0 p-0">
                            <div class="column">
                                <div class="is-flex is-align-items-center">
                                    <p class="has-background-black"
                                        style="border-radius: 100%; width: 90px; height:90px;">
                                        <img src="">
                                    </p>
                                    <span class="p-2">
                                        <div class="has-text-weight-semibold has-text-grey p-1">Username</div>
                                        <div class="has-text-grey has-text-weight-semibold is-size-7 px-1">Lecturer
                                        </div>
                                        <div class="has-text-grey px-1 is-size-7">College of Computing Informatics and
                                            Mathematics</div>
                                    </span>
                                </div>
                            </div>
                            <div class="column is-flex is-justify-content-end">
                                <div class="p-1">
                                    <button class="button is-custom"><span
                                            class="has-text-weight-semibold is-size-7">Upload Photo</span></button>
                                </div>
                                <div class="p-1">
                                    <button class="button is-delete is-outlined"><span
                                            class="has-text-weight-semibold is-size-7">Delete</span></button>
                                </div>
                            </div>
                        </div>

                        <div class="columns is-multiline m-0 p-0">
                            <form>

                                <div class="column is-full">
                                    <label class="has-text-weight-semibold has-text-grey">Name</label>
                                    <div class="py-2">
                                        <input class="px-4 py-2" type="text" placeholder=""
                                            style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                                    </div>
                                </div>
                                <div class="column is-full">
                                    <label class="has-text-weight-semibold has-text-grey">Username</label>
                                    <div class="py-2">
                                        <input class="custom-input px-4 py-2" type="text" placeholder="">
                                    </div>
                                </div>
                                <div class="column is-half">
                                    <label class="has-text-weight-semibold has-text-grey">Email Address</label>
                                    <div class="py-2">
                                        <input class="custom-input px-4 py-2" type="text" placeholder="">
                                    </div>
                                </div>
                                <div class="column is-half">
                                    <label class="has-text-weight-semibold has-text-grey">Phone Number</label>
                                    <div class="py-2">
                                        <input class="custom-input px-4 py-2" type="text" placeholder="">
                                    </div>
                                </div>
                                <div class="column is-half">
                                    <label class="has-text-weight-semibold has-text-grey">New Password</label>
                                    <div class="py-2">
                                        <input class="custom-input px-4 py-2" type="password">
                                    </div>
                                </div>
                                <div class="column is-half">
                                    <label class="has-text-weight-semibold has-text-grey">Current Password</label>
                                    <div class="py-2">
                                        <input class="custom-input px-4 py-2" type="password">
                                    </div>
                                </div>
                                <div class="column is-full">
                                    <label class="has-text-weight-semibold has-text-grey">Confirm New Password</label>
                                    <div class="py-2">
                                        <input class="custom-input px-4 py-2" type="password">
                                    </div>
                                </div>

                            </form>
                        </div>
                        <div class="is-flex is-justify-content-space-between px-3 py-6">
                            <button class="button is-custom2"><span
                                    class="has-text-weight-semibold is-size-7">Back</span></button>
                            <button class="button is-custom"><span class="has-text-weight-semibold is-size-7">Save
                                    Changes</span></button>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>