<%-- Document : Form-Student Created on : May 2, 2024, 6:13:59 PM Author : User --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
        <title>PROJECT FORMULATION REPORT SUBMISSION FORM</title>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../supervisor-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column p-6 is-justify-content-center" style="background-color:#FFFFFF; overflow-y: scroll;">
                    <div class="has-text-weight-semibold has-text-grey is-size-5 p-3 mb-5"
                         style="border-bottom: 1px solid #bdbdbd">
                        F6 – PROJECT FORMULATION REPORT SUBMISSION FORM
                    </div>
                    <div class="pr-4 pl-1">
                        <div class="custom-border p-3 w-100">
                            <div class="is-flex is-justify-content-space-between is-align-items-center pb-0">
                                <div>
                                    <label class="has-text-weight-bold has-text-grey is-size-5">Instructions to the student: </label>
                                    <ol class="p-5 w-100">
                                        <li>Ensure that the information needed in the form is completed before
                                            submission to the CSP600 lecturer.</li>
                                        <li>Obtain the endorsement of the Supervisor that the report has been screened
                                            for plagiarism. </li>
                                        <li>Please attach the original Plagiarism Report.</li>
                                        <li>Only a completed form will be processed.</li>
                                    </ol>
                                    <label class="has-text-weight-bold has-text-danger is-size-6">Note: The maximum
                                        percentage of the similarity index for plagiarism checking is 30%. </label>
                                </div>
                            </div>
                        </div>
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
                            <label class="has-text-weight-semibold has-text-grey">Programme:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" placeholder="Programme"
                                       style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="column is-2" style="align-content: center">
                            <label class="has-text-weight-semibold has-text-grey">Supervisor</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" placeholder="Supervisor:"
                                       style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="column is-2" style="align-content: center">
                            <label class="has-text-weight-semibold has-text-grey">Project Tittle:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" placeholder="Tittle"
                                       style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="column is-2" style="align-content: center">
                            <label class="has-text-weight-semibold has-text-grey">Handover Date:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" placeholder="11-06-2024" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="pr-5 pl-3">
                            <div class="custom-border p-5 w-100">
                                <div class="is-flex is-justify-content-end is-align-items-center pb-4">
                                    <button class="button is-custom" style="height:2.5rem;">
                                        <span class="is-size-7 has-text-weight-semibold">Add</span>
                                    </button>
                                </div>
                                <div>
                                    <div class="p-1" id="table">
                                        <table class="">
                                            <thead>
                                                <tr style="border-bottom: 2px solid #ddd;">
                                                    <th
                                                        class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                        Created</th>
                                                    <th
                                                        class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                        Activity</th>
                                                    <th
                                                        class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                        Comments</th>
                                                    <th
                                                        class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                        Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                        data-label="Student">21.03.2021</td>
                                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                        data-label="Matric ID">Project Introductions</td>
                                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                        data-label="Semester">Objectives and project elaboration </td>
                                                    <td class="has-text-warning has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                        data-label="Topic">Pending</td>
                                                </tr>
                                                <tr>
                                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                        data-label="Student">21.03.2021</td>
                                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                        data-label="Matric ID">Project Introductions</td>
                                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                        data-label="Semester">Objectives and project elaboration </td>
                                                    <td class="has-text-warning has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4"
                                                        data-label="Topic">Pending</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="buttons pt-5 pl-3 pr-5 is-justify-content-space-between">
                        <a class="button is-custom2 is-soft" href="../Students/Form-Student.jsp">Cancel</a>
                        <a class="button is-custom4 is-soft">Save Changes</a>
                    </div>
                </div>
                <script>
                    window.onbeforeunload = function () {
                        return "Your work will be lost.";
                    };
                </script>
            </div>
        </div>
    </body>

</html>