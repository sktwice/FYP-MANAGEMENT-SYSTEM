<%-- 
    Document   : Result-Student
    Created on : May 2, 2024, 6:18:43 PM
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
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../sidebar.jsp"></jsp:include>
            <div class="main-content">
            <div class="column h-100 px-4 py-2" style="background-color: #FFFFFF; overflow-y: scroll;">
                <div class="custom-border p-6 pt-4 w-100">
                    <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                        <div>
                            <div class="columns is-vcentered is-multiline is-mobile">
                                <!-- Profile Image -->
                                <div class="column is-narrow">
                                    <figure class="image is-128x128">
                                        <img class="is-rounded" src="https://via.placeholder.com/128" alt="Profile Image">
                                    </figure>
                                </div>
                                <!-- Profile Information -->
                                <div class="column">
                                    <h1 class="title has-text-grey is-size-3">SV Name <span class="tag is-warning">Supervisor</span></h1>
                                    <p class="subtitle has-text-grey">College of Computing, Informatics and Mathematics</p>
                                    <p class=""><span class="icon has-text-info"><i class="fas fa-users"></i></span><strong class="has-text-grey">12</strong> students</p>
                                </div>
                                <!-- Contact Information -->
                                <div class="column is-narrow profile-info is-justify-content-end">
                                    <p class="subtitle is-size-6 is-justify-content-end">@uitm.edu.my</p>
                                    <div class="buttons">
                                        <button class="button is-light"><span class="icon"><i class="fab fa-linkedin"></i></span></button>
                                        <button class="button is-light"><span class="icon"><i class="fab fa-instagram"></i></span></button>
                                        <button class="button is-light"><span class="icon"><i class="fab fa-whatsapp"></i></span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>              
                <div class="pt-5">
                    <div class="custom-border p-3 pt-4 w-100">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                            <div>
                                <label class="pl-5 has-text-weight-bold has-text-grey is-size-5">My proposal</label>
                            </div>
                        </div>
                        <div>
                            <table>
                                <div class="columns is-vcentered pl-4 is-mobile">
                                    <div class="column is-narrow">
                                        <figure class="image is-48x48">
                                            <img class="is-rounded" src="https://via.placeholder.com/48" alt="Profile Image">
                                        </figure>
                                    </div>
                                    <div class="column">
                                        <span class="is-size-6 has-text-weight-semibold has-text-grey">Kristin Watson</span>
                                    </div>
                                    <div class="is-justify-content-end pr-5">
                                        <button class="button is-update is-small">Update</button>
                                        <button class="button is-delete is-small">Delete</button>
                                    </div>        
                                </div>
                            </table>
                        </div>
                    </div>
                    <div class="columns pt-5">
                        <div class="column is-half">
                            <div class="box custom-border">
                                <h2 class="title is-5 has-text-grey">My Progress</h2>
                                <div class="columns is-vcentered">
                                    <div class="column is-narrow">
                                        <div class="circular-progress">
                                            <div class="percentage is-size-5"><strong class="has-text-black">38%</strong></div>
                                        </div>
                                    </div>
                                    <div class="column">
                                        <h3 class="title is-1 has-text-danger">06</h3>
                                        <p>Overdue reports</p>
                                        <p>More than 3 reports in progress</p>
                                    </div>
                                </div>
                                <p>0 report created with no time</p>
                            </div>
                        </div>
                        <div class="column is-half">
                            <div class="box custom-border">
                                <div class="is-flex is-justify-content-space-between pb-3">
                                    <h2 class="title is-5 has-text-grey">Recent Activity</h2>
                                    <div class="dropdown is-right">
                                        <div class="dropdown-trigger">
                                            <button class="button is-white" aria-haspopup="true" aria-controls="dropdown-menu">
                                                <span>Today</span>
                                                <span class="icon is-small">
                                                    <i class="fas fa-angle-down" aria-hidden="true"></i>
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="media">
                                    <figure class="media-left">
                                        <span class="icon has-text-white has-background-danger is-medium" style="border-radius: 20px;">
                                            <i class="fas fa-comment"></i>
                                        </span>
                                    </figure>
                                    <div class="media-content">
                                        <p><strong class="has-text-grey">User</strong> update proposal file for Madam/Sir</p>
                                        <p class="is-size-7 has-text-grey">Just now</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <figure class="media-left">
                                        <span class="icon has-text-white has-background-danger is-medium" style="border-radius: 20px;">
                                            <i class="fas fa-star"></i>
                                        </span>
                                    </figure>
                                    <div class="media-content">
                                        <p><strong class="has-text-grey">User</strong> update proposal file for Madam/Sir</p>
                                        <p class="is-size-7 has-text-grey">5 mins ago</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <figure class="media-left">
                                        <span class="icon has-text-white has-background-danger is-medium" style="border-radius: 20px;">
                                            <i class="fas fa-star"></i>
                                        </span>
                                    </figure>
                                    <div class="media-content">
                                        <p><strong class="has-text-grey">User</strong> update proposal file for Madam/Sir</p>
                                        <p class="is-size-7 has-text-grey">5 mins ago</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <figure class="media-left">
                                        <span class="icon has-text-white has-background-danger is-medium" style="border-radius: 20px;">
                                            <i class="fas fa-star"></i>
                                        </span>
                                    </figure>
                                    <div class="media-content">
                                        <p><strong class="has-text-grey">User</strong> update proposal file for Madam/Sir</p>
                                        <p class="is-size-7 has-text-grey">5 mins ago</p>
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
                    const dropdown = document.getElementById('activity-dropdown');
                    const trigger = dropdown.querySelector('.dropdown-trigger');
                    const menu = dropdown.querySelector('.dropdown-menu');

                    trigger.addEventListener('click', () => {
                        dropdown.classList.toggle('is-active');
                    });

                    document.addEventListener('click', (event) => {
                        if (!dropdown.contains(event.target)) {
                            dropdown.classList.remove('is-active');
                        }
                    });
                });
            </script>
            </div>
    </body>
</html>

