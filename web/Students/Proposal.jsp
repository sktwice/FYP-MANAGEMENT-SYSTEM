<%-- 
    Document   : Proposal
    Created on : May 2, 2024, 6:16:35 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Proposal</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../student-sidebar.jsp"></jsp:include>
            <div class="main-content">
            <div class="column h-100 px-6 py-6" style="background-color: #FFFFFF; overflow-y: scroll;">
                <div class="pt-5">
                    <div class="custom-border p-3 pt-4 w-100">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                            <div>
                                <label class="pl-4 has-text-weight-bold has-text-grey is-size-5">My proposal</label>
                            </div>
                        </div>
                        <div>
                            <table>
                                <div class="columns is-vcentered pl-4 is-mobile">
                                    <div class="column">
                                        <span class="is-size-6 has-text-weight-semibold has-text-grey">There's no proposal has yet been submit!</span>
                                    </div>
                                    <div class="is-justify-content-end pr-5">
                                            <a href="../Students/Submit-Proposal-MainForm.jsp" class="is-justify-content-end button is-custom3 is-small" >Submit Proposal</a>
                                    </div>        
                                </div>
                            </table>
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
                </div> 
            </div> 
        </div> 
        </div>
    </body>
</html>