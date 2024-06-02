<%-- 
    Document   : Form-Student
    Created on : May 2, 2024, 6:13:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height:100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
        <title>F1 Page</title>
    </head>
    <body style="height:100%;">
        <div class="columns m-0 p-0 h-100">
            <div class="column p-6 is-justify-content-center" style="background-color:#FFFFFF; overflow-y: scroll;">
                <div class="has-text-weight-semibold has-text-grey is-size-5 p-4">
                    MUTUAL ACCEPTANCE FORM TERMS AND CONDITIONS 
                    <div class="has-text-weight-semibold has-text-grey is-size-6 p-3">
                        I. EXPECTATION OF STUDENT FROM THE SUPERVISOR & CO-SUPERVISOR
                        <li class="has-text-weight-normal">The supervisor should meet the student on a weekly basis at a mutually agreed day and time suitable to both parties. Any meeting changes should be communicated in advance to the student to facilitate re-scheduling.</li>
                        <li class="has-text-weight-normal">The supervisor should advice, guide, and assess the student’s proposal/project work throughout the duration of the project formulation/project course. </li>
                        <li class="has-text-weight-normal">The supervisor should motivate and encourage the student’s initiative in taking responsibility for his/her own project through to completion.</li>
                        <li class="has-text-weight-normal">The supervisor should regularly update the student on his/her performance. A weak or non- compliant performance from the student should be communicated to the course lecturer and/or project coordinator for further action.</li>
                        <li class="has-text-weight-normal">The supervisor reserves the right under special circumstances to discontinue his/her supervisory role with the student after the project formulation phase. This matter should be communicated to the project coordinator for further action. </li>
                        <li class="has-text-weight-normal">At all times, mutual respect and courtesy should be observed between the supervisor and the student. </li>
                    </div>
                    <div class=" has-text-grey is-size-6 p-3">
                        II. EXPECTATION OF SUPERVISOR(S ) FROM THE STUDENT
                        <li class="has-text-weight-normal">The student should apply his/her acquired skills and knowledge to produce a substantially successful and original project.</li>
                        <li class="has-text-weight-normal">The student should be responsible for the completion of his/her project without undue dependence on his/her supervisor. </li>
                        <li class="has-text-weight-normal">The student should be punctual for the weekly meetings with his/her supervisor. Any meeting changes should be communicated in advance to the supervisor to facilitate re-scheduling.</li>
                        <li class="has-text-weight-normal">The student reserves the right under special circumstances to discontinue his/her supervision with the supervisor after the project formulation phase. This matter should be communicated to the project coordinator for further action.</li>
                        <li class="has-text-weight-normal">At all times, mutual respect and courtesy should be observed between the supervisor and the student. </li><br>
                        <div class="control has-text-weight-normal">
                            <label class="checkbox">
                                <input type="checkbox"/>
                                I confirm that I have read and accept the terms and conditions and privacy policy.
                            </label>
                        </div>
                    </div>
                </div>

                <div class="has-text-weight-semibold has-text-grey is-size-5 p-4 has-text-centered" style="border-bottom: 1px solid #bdbdbd">
                    F1 - MUTUAL ACCEPTANCE FORM
                </div>
                <!--Students-->
                <div class="has-text-weight-semibold has-text-grey is-size-5 p-3">
                    a. Student
                </div>
                <div class="columns is-multiline m-0 p-0">
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Student Name:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Full Name" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Student ID:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Student ID" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Programme:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Programme" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Email: </label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="@gmail.com" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Contact:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="*** - *******" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div></div>
                <!--Supervisors-->
                <div class="has-text-weight-semibold has-text-grey is-size-5 p-3">
                    b. Supervisor
                </div>
                <div class="columns is-multiline m-0 p-0">
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Name:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Full Name" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Faculty:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Faculty" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Programme:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="@gmail.com" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Contact:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="*** - *******" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                </div>
                <!--Supervisors-->
                <div class="has-text-weight-semibold has-text-grey is-size-5 p-3">
                    c. Project
                </div>
                <div class="columns is-multiline m-0 p-0">
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Project Area:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Project Area/Scope" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="column is-2" style="align-content: center">
                        <label class="has-text-weight-semibold has-text-grey">Project Tittle:</label>
                    </div>
                    <div class="column is-10">
                        <div class="py-2">
                            <input class="px-4 py-2" type="text" placeholder="Project Tittle" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
