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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <div class="content-wrapper">
        <jsp:include page="../student-sidebar.jsp"></jsp:include>
        <div class="main-content">
            <div class="column h-100 px-6 py-6" style="background-color: #FFFFFF;">
                <div class="pt-5">
                    <div class="custom-border p-5">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                            <div>
                                <label class="has-text-weight-bold has-text-grey is-size-5">My Proposal</label>
                            </div>
                        </div>
                        <div class="columns is-vcentered is-mobile m-0">
                            <div class="column is-narrow">
                                <figure class="image is-48x48">
                                    <img id="profile-img" src="images/lecturers/<%= ((Student) request.getAttribute("Student")).getsImage() %>" 
                                     alt="" style="height: -webkit-fill-available !important; border-radius: 50%;">
                                </figure>
                            </div>
                            <div class="column">
                                <span class="is-size-6 has-text-weight-semibold has-text-grey" style="text-transform: uppercase;"><%= ((Student) request.getAttribute("Student")).getsName() %></span>
                            </div>
                            <div class="column is-narrow">
                                <button id="uploadBtn" class="button is-custom4 is-size-7">Upload</button>
                            </div>
                        </div>
                    </div>
                </div> 
            </div> 
        </div> 
    </div>

    <!-- Hidden fields to store the hasForm6 and hasProject values -->
    <input type="hidden" id="hasForm6" value="<%= request.getAttribute("hasForm6") %>" />
    <input type="hidden" id="hasProject" value="<%= request.getAttribute("hasProject") %>" />

    <!-- Modal for File Upload -->
    <div id="uploadModal" class="modal">
        <div class="modal-background"></div>
        <div class="modal-card">
            <header class="modal-card-head has-background-white">
                <p class="modal-card-title has-text-weight-semibold has-text-grey-dark">Upload Proposal</p>
                <button class="delete" aria-label="close" onclick="toggleModal('uploadModal')"></button>
            </header>
            <form action="StudentUploadServlet" method="post" enctype="multipart/form-data">
            <section class="modal-card-body has-background-white">
                    <div class="field">
                        <label class="has-text-weight-semibold has-text-grey">Select Proposal PDF:</label>
                        <div id="file-js-example" class="file has-name is-info is-small">
                            <label class="file-label">
                              <input class="file-input" type="file" name="pdfFile" />
                              <span class="file-cta">
                                <span class="file-icon has-text-white">
                                  <i class="fas fa-upload"></i>
                                </span>
                                <span class="file-label has-text-white"> Choose a file… </span>
                              </span>
                              <span class="file-name"> No file uploaded </span>
                            </label>
                        </div>
                    </div>
            </section>
                <footer class="modal-card-foot has-background-white is-flex is-justify-content-space-between p-5 w-100" 
                        style="border-top-color: #bdbdbd 1px solid;">
                    <div class="control">
                            <button type="button" class="button is-custom2" onclick="toggleModal('uploadModal')">Cancel</button>
                        </div>
                    <div class="control">
                            <button type="submit" class="button is-custom3">Upload File</button>
                        </div>
                </footer>
                </form>
        </div>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        function toggleModal(modalId) {
            var modal = document.getElementById(modalId);
            modal.classList.toggle('is-active');
        }

        // Show modal when upload button is clicked
        document.getElementById('uploadBtn').addEventListener('click', function() {
            var hasForm6 = document.getElementById('hasForm6').value === 'true';
            var hasProject = document.getElementById('hasProject').value === 'true';

            if (hasForm6) {
                Swal.fire({
                    title: "Function Closed",
                    text: "This function is closed because you already sent your report to be checked by your supervisor. Please refer to your supervisor.",
                    icon: "warning",
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: "OK"
                });
            } else if (hasProject) {
                toggleModal('uploadModal');
            } else {
                Swal.fire({
                    title: "Function Closed",
                    text: "Please find a supervisor first.",
                    icon: "warning",
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: "OK"
                });
            }
        });

        // Update file name display when file is selected
        const fileInput = document.querySelector("#file-js-example input[type=file]");
        fileInput.onchange = () => {
            if (fileInput.files.length > 0) {
                const fileName = document.querySelector("#file-js-example .file-name");
                fileName.textContent = fileInput.files[0].name;
            }
        };

        // Close modal when the close button is clicked
        document.querySelectorAll('.modal .delete, .modal-background').forEach(function(element) {
            element.addEventListener('click', function() {
                element.closest('.modal').classList.remove('is-active');
            });
        });
    });
    </script>

</body>
</html>
