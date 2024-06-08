<%-- 
    Document   : Submit-Proposal-SV
    Created on : May 2, 2024, 6:15:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html style="height:100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
        <title>Submit Proposal</title>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../sidebar.jsp"></jsp:include>
            <div class="main-content">
            <div class="column p-6 is-justify-content-center" style="background-color:#FFFFFF; overflow-y: scroll;">
                <div class="has-text-weight-semibold has-text-grey is-size-5 p-4"
                    style="border-bottom: 1px solid #bdbdbd">
                    Submit Proposal
                </div>
                <div class="columns is-multiline m-0 p-0">
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Student Name:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Full Name"
                                style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Student ID:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Student ID"
                                style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                     <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Semester:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Semester"
                                style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Proposal Tittle:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Proposal Tittle"
                                style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Scope: </label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Scope"
                                style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="pl-3">
                        <div id="file-js-example" class="file has-name">
                            <label class="file-label">
                                <input class="file-input" type="file" name="resume" />
                                <span class="file-cta" style="background-color: #3699FF; border: none;">
                                    <span class="file-icon">
                                        <i class="fas fa-upload"></i>
                                    </span>
                                    <span class="file-label">Choose a file…</span>
                                </span>
                                <span class="file-name has-text-grey">No file uploaded</span>
                            </label>
                        </div>
                    </div>
                    <script>
                        const fileInput = document.querySelector("#file-js-example input[type=file]");
                        fileInput.onchange = () => {
                            if (fileInput.files.length > 0) {
                                const fileName = document.querySelector("#file-js-example .file-name");
                                fileName.textContent = fileInput.files[0].name;
                            }
                        };
                    </script>

                </div>
                <div class="buttons pt-5 pl-3 pr-5 is-justify-content-space-between">
                    <a class="button is-custom is-soft">Cancel</a>
                    <a class="button is-custom is-soft">Save Changes</a>
                </div>
            </div>
        </div>
    </div>
    <script>
        window.onbeforeunload = function () {
            return "Your work will be lost.";
        };
    </script>
    </body>
    </html>