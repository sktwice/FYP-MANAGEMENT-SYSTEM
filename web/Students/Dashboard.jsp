<%-- 
    Document   : Dashboard
    Created on : May 2, 2024, 6:13:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body style="height:auto;">
        <div class="columns m-0 p-0 h-100">
            <div class="column px-6 py-2" style="background-color:#FFFFFF;">
                <div class="py-1 px-5 is-flex is-justify-content-end is-align-items-center">
                    <input class="px-4 mx-4 my-1" type="text" placeholder="Search" style="width: 18rem; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    <span class="has-background-black" style="border-radius: 100%; width: 40px; height: 40px;">
                        <img src="">
                    </span>
                </div>
                <div class="columns m-0 p-0">
                    <div class="column is-full">
                        <div class="custom-border p-3 h-100 w-100">
                            <label class="has-text-weight-semibold has-text-grey">
                                Today's Summary
                            </label>
                            <div class="columns m-0 p-0">
                                <div class="column">
                                    <div class="box custom-bg w-100 h-100">
                                        <div class="is-size-5 fas fa-user-graduate has-text-grey"></div>
                                        <p class="has-text-grey has-text-weight-semibold">20</p>
                                        <p class="has-text-grey is-size-7">Total Students</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="box custom-bg2 w-100 h-100">
                                        <div class="is-size-5 fas fa-book-open-reader has-text-grey"></div>
                                        <p class="has-text-grey has-text-weight-semibold">20</p>
                                        <p class="has-text-grey is-size-7">Ongoing Report</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="box custom-bg3 w-100 h-100">
                                        <div class="is-size-5 fas fa-book-open-reader has-text-grey"></div>
                                        <p class="has-text-grey has-text-weight-semibold">20</p>
                                        <p class="has-text-grey is-size-7">Past Report</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="box custom-bg4 w-100 h-100">
                                        <div class="is-size-5 fas fa-list-check has-text-grey"></div>
                                        <p class="has-text-grey has-text-weight-semibold">20</p>
                                        <p class="has-text-grey is-size-7">Ongoing Task</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="columns m-0 p-0">
                    <div class="column is-one-third">
                        <div class="card">
                            <div class="card-image">
                                <figure class="image is-4by3">
                                    <img src="../web/assets/uitm_background.jpeg">
                                </figure>
                            </div>
                            <div class="card-content">
                                <div class="media">
                                    <div class="media-content">
                                        <p class="title is-4 has-text-grey">Topic 1</p>
                                    </div>
                                </div>
                                <div class="content">
                                    Welcome to Ocean view Retreat, an exquisite beachfront property located in the vibrant city of Miami, Florida. Situated along the pristine shores of the Atlantic Ocean...
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Card 2 -->
                    <div class="column is-one-third">
                        <div class="card">
                            <div class="card-image">
                                <figure class="image is-4by3">
                                    <img src="/web/assets/uitm_background.jpeg" alt="">
                                </figure>
                            </div>
                            <div class="card-content">
                                <div class="media">
                                    <div class="media-content">
                                        <p class="title is-4 has-text-grey">Topic 2</p>
                                    </div>
                                </div>
                                <div class="content">
                                    Welcome to Ocean view Retreat, an exquisite beachfront property located in the vibrant city of Miami, Florida. Situated along the pristine shores of the Atlantic Ocean...
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Card 3 -->
                    <div class="column is-one-third">
                        <div class="card">
                            <div class="card-image">
                                <figure class="image is-4by3">
                                    <img src="/web/assets/uitm_background.jpeg" alt="">
                                </figure>
                            </div>
                            <div class="card-content">
                                <div class="media">
                                    <div class="media-content">
                                        <p class="title is-4 has-text-grey">Topic 3</p>
                                    </div>
                                </div>
                                <div class="content">
                                    Welcome to Ocean view Retreat, an exquisite beachfront property located in the vibrant city of Miami, Florida. Situated along the pristine shores of the Atlantic Ocean...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>