<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>New Past Report</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../supervisor-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column px-6 py-3" style="background-color:#FFFFFF;">
                    <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                        Add New Past Report
                    </div>
                    <div class="p-4">
                        <label class="has-text-weight-semibold has-text-grey">Name</label>
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Full Name" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                        <label class="has-text-weight-semibold has-text-grey">Student ID</label>
                        <div class="py-2">
                            <input class="custom-input px-4 py-2" type="text" placeholder="Student ID">
                        </div>
                        <label class="has-text-weight-semibold has-text-grey">Report Title</label>
                        <div class="py-2">
                            <input class="custom-input px-4 py-2" type="text" placeholder="Report Title">
                        </div>
                        <label class="has-text-weight-semibold has-text-grey">Semester</label>
                        <div class="py-2">
                            <input class="custom-input px-4 py-2" type="text" placeholder="Semester">
                        </div>
                        <div class="pt-2">
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
                    <div class="is-flex is-justify-content-space-between p-4">
                        <a class="button is-custom2" href="../Lecturers/Report-Lecturer.jsp"><span class="has-text-weight-semibold is-size-7">Back</span></a>
                        <a class="button is-custom4"><span class="has-text-weight-semibold is-size-7">Save Changes</span></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>