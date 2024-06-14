<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                    <form action="AddPastRepostSupervisor" method="post" enctype="multipart/form-data">
    <input type="hidden" id="admin_id" name="admin_id" value="0"/>
    <input type="hidden" id="l_id" name="l_id" value="${sessionScope.lecturer_id}" />

    <label class="has-text-weight-semibold has-text-grey">Student Name</label>
    <div class="py-2">
        <input class="custom-input px-4 py-2" type="text" name="stu_name" placeholder="Student Name" required>
    </div>
    <label class="has-text-weight-semibold has-text-grey">Student ID</label>
    <div class="py-2">
        <input class="custom-input px-4 py-2" type="text" name="student_id" placeholder="Student ID" required>
    </div>
    <label class="has-text-weight-semibold has-text-grey">Project Title</label>
    <div class="py-2">
        <input class="custom-input px-4 py-2" type="text" name="pro_title" placeholder="Project Title" required>
    </div>
    <label class="has-text-weight-semibold has-text-grey">Semester Session</label>
    <div class="py-2">
        <input class="custom-input px-4 py-2" type="text"name="session" placeholder="Semester Session" required>
    </div>
    <div class="pt-3">
        <div id="file-js-example" class="file has-name">
            <label class="file-label">
                <input class="file-input" type="file" name="pdfFile" required />
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
    <div class="is-flex p-4">
        <div class="is-flex-grow-1"></div>
        <div class="px-1">
            <input class="button is-custom has-background-grey-dark has-text-white-bis" type="submit" value="Submit">
        </div>
    </div>

    <div class="is-flex is-justify-content-space-between p-4">
        <a class="button is-custom2" href="../Lecturers/Report-Lecturer.jsp"><span class="has-text-weight-semibold is-size-7">Back</span></a>
    </div>
</form>

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
        </div>
    </body>
</html>