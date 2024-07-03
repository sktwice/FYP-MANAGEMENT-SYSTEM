<%-- 
    Document   : Proposal
    Created on : May 2, 2024, 6:16:35 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.fyp.model.bean.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proposal</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.14.0/js/all.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="content-wrapper">
        <jsp:include page="../student-sidebar.jsp"></jsp:include>
        <div class="main-content">
            <div class="column h-100 px-6 py-6" style="background-color: #FFFFFF;">
                <div class="pt-5">
                    <div class="custom-border p-3 pt-4">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                            <div>
                                <label class="pl-5 has-text-weight-bold has-text-grey is-size-5">My Proposal</label>
                            </div>
                        </div>
                        <div class="columns is-vcentered pl-4 is-mobile">
                            <div class="column is-narrow">
                                <figure class="image is-48x48">
                                    <img id="profile-img" src="images/lecturers/<%= ((Student) request.getAttribute("Student")).getsImage() %>" 
                                     alt="" style="height: -webkit-fill-available !important; border-radius: 50%;">
                                </figure>
                            </div>
                            <div class="column">
                                <span class="is-size-6 has-text-weight-semibold has-text-grey"><%= ((Student) request.getAttribute("Student")).getsName() %></span>
                            </div>
                            <div class="column is-narrow">
                                <button id="uploadBtn" class="button is-small is-link">Upload</button>
                            </div>
                        </div>
                    </div>
                </div> 
            </div> 
        </div> 
    </div>

    <!-- Modal for File Upload -->
    <div id="uploadModal" class="modal">
        <div class="modal-background"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">Upload Proposal</p>
                <button class="delete" aria-label="close" onclick="toggleModal('uploadModal')"></button>
            </header>
            <section class="modal-card-body">
                <form action="StudentUploadServlet" method="post" enctype="multipart/form-data">
                    <div class="field">
                        <label class="label">Select Proposal PDF:</label>
                        <div class="control">
                            <input type="file" name="pdfFile" class="input" required>
                        </div>
                    </div>
                    <div class="field is-grouped">
                        <div class="control">
                            <button type="submit" class="button is-link">Upload File</button>
                        </div>
                        <div class="control">
                            <button type="button" class="button" onclick="toggleModal('uploadModal')">Cancel</button>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>

    <script>
        function toggleModal(modalId) {
            var modal = document.getElementById(modalId);
            modal.classList.toggle('is-active');
        }

        // Show modal when upload button is clicked
        document.getElementById('uploadBtn').addEventListener('click', function() {
            toggleModal('uploadModal');
        });
    </script>
</body>
</html>
