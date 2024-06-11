<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <% 
            String userCategory = (String) session.getAttribute("userCategory");
    
        if(userCategory.equals("lecturer")){
            %> <jsp:include page="../lecturer-sidebar.jsp"></jsp:include> <%
                } 
            %>
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
                                    <div class="has-text-weight-semibold has-text-grey p-1 is-size-5">Username</div>
                                    <div class="has-text-grey has-text-weight-semibold is-size-6 px-1">Lecturer</div>
                                    <div class="has-text-grey px-1 is-size-6">College of Computing Informatics and Mathematics</div>
                                </span>
                            </div>
                        </div>
                        <div class="column is-flex is-justify-content-end">
                            <div class="p-1">
                                <button class="button is-custom4"><span class="has-text-weight-semibold is-size-7">Upload Photo</span></button>
                            </div>
                            <div class="p-1">
                                <button class="button is-delete is-outlined"><span class="has-text-weight-semibold is-size-7">Delete</span></button>
                            </div>
                        </div>
                    </div>
                    <div class="columns is-multiline m-0 p-0">
                        <div class="column is-full">
                            <label class="has-text-weight-semibold has-text-grey">Name</label>
                            <div class="py-2">
                                <input class="px-4 py-3" type="text" placeholder="Full Name" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="column is-full">
                            <label class="has-text-weight-semibold has-text-grey">Username</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-3" type="text" placeholder="e.g. haha">
                            </div>
                        </div>
                        <div class="column is-half">
                            <label class="has-text-weight-semibold has-text-grey">Email Address</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-3" type="text" placeholder="@gmail.com">
                            </div>
                        </div>
                        <div class="column is-half">
                            <label class="has-text-weight-semibold has-text-grey">Phone Number</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-3" type="text" placeholder="Phone Number">
                            </div>
                        </div>
                        <div class="column is-half">
                            <label class="has-text-weight-semibold has-text-grey">New Password</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-3" type="password" placeholder="Password">
                            </div>
                        </div>
                        <div class="column is-half">
                            <label class="has-text-weight-semibold has-text-grey">Current Password</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-3" type="password" placeholder="Password">
                            </div>
                        </div>
                        <div class="column is-full">
                            <label class="has-text-weight-semibold has-text-grey">Confirm New Password</label>
                            <div class="py-2">
                                <input class="custom-input px-4 py-3" type="password" placeholder="Password">
                            </div>
                        </div>
                    </div>
                    <div class="is-flex is-justify-content-space-between p-4">
                        <a class="button is-custom2" href="Dashboard-Lecturer.jsp"><span class="has-text-weight-semibold is-size-7">Back</span></a>
                        <a class="button is-custom4" href="Dashboard-Lecturer.jsp"><span class="has-text-weight-semibold is-size-7">Save Changes</span></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>