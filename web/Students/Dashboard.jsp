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
        <title>Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../student-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="py-1 px-5 is-flex is-justify-content-end is-align-items-center">
                    <input class="px-4 mx-4 my-1" type="text" placeholder="Search here..." style="width: 18rem; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    <span class="has-background-black" style="border-radius: 100%; width: 40px; height: 40px;">
                        <img src="">
                    </span>
                </div>
                <div class="columns is-multiline m-0 p-0">
                    <div class="column is-one-quarter">
                        <div class="box custom-bg w-100 h-100">
                            <div class="is-size-4 fas fa-user-graduate has-text-grey"></div>
                            <p class="has-text-grey has-text-weight-semibold is-size-5">${totalStudents}</p>
                            <p class="has-text-grey is-size-6">Total Students</p>
                        </div>
                    </div>
                    <div class="column is-one-quarter">
                        <div class="box custom-bg2 w-100 h-100">
                            <div class="is-size-4 fas fa-chalkboard-teacher has-text-grey"></div>
                            <p class="has-text-grey has-text-weight-semibold is-size-5">${totalLecturer}</p>
                            <p class="has-text-grey is-size-6">Total Lecturers</p>
                        </div>
                    </div>
                    <div class="column is-one-quarter">
                        <div class="box custom-bg3 w-100 h-100">
                            <div class="is-size-4 fas fa-book has-text-grey"></div>
                            <p class="has-text-grey has-text-weight-semibold is-size-5">${totalScope}</p>
                            <p class="has-text-grey is-size-6">Total Scope</p>
                        </div>
                    </div>
                    <div class="column is-one-quarter">
                        <div class="box custom-bg4 w-100 h-100">
                            <div class="is-size-4 fas fa-file-alt has-text-grey"></div>
                            <p class="has-text-grey has-text-weight-semibold is-size-5">${totalProject}</p>
                            <p class="has-text-grey is-size-6">Total Reports</p>
                        </div>
                    </div>
                </div>
                <div class="columns m-0 p-0">
                    <div class="column is-full">
                        <div class="card">
                            <div class="card-image">
                                <figure style="">
                                    <img src="${pageContext.request.contextPath}/assets/uitm_background.jpeg" style="height:17rem; width:100rem;">
                                </figure>
                            </div>
                            <div class="card-content">
                                <div class="media">
                                    <div class="media-content">
                                        <p class="title is-4 has-text-grey">Frequently Asked Questions (FAQs) for Student</p>
                                    </div>
                                </div>
                                <div class="content">
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="1">
                                        1.<label class=" hover-underline p-1"> What is the Final Year Project (FYP)?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        The Final Year Project (FYP) is a project that needs to be undertaken by the final year student as a partial fulfillment of the requirements for the Computing Sciences bachelor degree.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="2">
                                        2.<label class=" hover-underline p-1"> What is the importance of the FYP?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        The FYP is normally used by the bachelor students who have graduated to market themselves during their interviews. Most of the companies will refer to the graduate’s thesis (or FYP report) as a part of the evaluation criteria.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="3">
                                        3.<label class=" hover-underline p-1"> I am thinking of changing my supervisor. How do I go about it?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        The changing of the supervisor is not encouraged. However, if you still insist on a change, please refer to the Terms and Conditions in the Mutual Acceptance Form (F1).
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="4">
                                        4.<label class=" hover-underline p-1"> I am thinking of changing the topic/title during CSP650. Will I be able to do so?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        The changing of the topic/title is strongly discouraged as it may affect your overall project evaluation.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="5">
                                        5.<label class=" hover-underline p-1"> How do I get an ‘A’ grade for CSP650?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        You may get an ‘A’ grade if both the system/research/finding and report are good. For the system, it should be successfully implemented together with test data analysis to demonstrate its worth.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="6">
                                        6.<label class=" hover-underline p-1"> My project is still incomplete. Do I still need to present/exhibit during the Final Year Project Exhibition?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        You will still need to present or exhibit it, otherwise an ‘F’ grade will be given.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="7">
                                        7.<label class=" hover-underline p-1"> What does an Incomplete (TL) or Fail result mean?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        If the Supervisor and Examiner agree that your project is halfway through completion and can be submitted within a specific duration, an ‘Incomplete’ result is given. However, if there is no progress at all and if the Supervisor and Examiner foresee the problems in the project (e.g., student attitude, level of completeness) then a ‘Fail’ result is given.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="8">
                                        8.<label class=" hover-underline p-1"> Does the faculty provide any printing facilities for poster, pamphlets, etc.?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        Yes, the faculty will provide the printing facilities for poster, pamphlets, etc. However, you are free to seek printing facilities elsewhere at your own expense.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="9">
                                        9.<label class=" hover-underline p-1"> When is the FYP exhibition held?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        Normally, the FYP exhibition is held after the final examination.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="10">
                                        10.<label class=" hover-underline p-1"> What is the penalty for late submission of the final report draft?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        The penalty imposed will affect your final grade.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="11">
                                        11.<label class=" hover-underline p-1"> You have to submit the whole report for the plagiarism checking.</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        The changing of the supervisor is not encouraged. However, if you still insist on a change, please refer to the Terms and Conditions in the Mutual Acceptance Form (F1).
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="12">
                                        12.<label class=" hover-underline p-1"> What is the maximum percentage of the similarity index for plagiarism checking?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        The maximum percentage of the similarity index for plagiarism checking is 30%.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="13">
                                        13.<label class=" hover-underline p-1"> When can the hardbound report be prepared?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        You can only submit the hardbound report once the amendments, based on the examiner’s comments, have been made, and it should be done after the examiner has signed the Confirmation of Correction Form (F12).
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="14">
                                        14.<label class=" hover-underline p-1"> What if I can not complete the correction required by the examiner?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        The examiner has the right not to sign the Confirmation of Correction Form (F12) and your grade will be downgraded.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="15">
                                        15.<label class=" hover-underline p-1"> How many academic references should I include in the report?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        The minimum number of academic references for the Proposal Report is 15 while that for the Final Year Report is 30.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="16">
                                        16.<label class=" hover-underline p-1"> What types of literature should be included in the references?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        It should consist of a mix of journal articles, conference proceedings, book chapters, technical report, white papers, etc. Academic references such as journal articles, conference proceedings, book chapters, etc. should contribute to at least half of the references.
                                    </div>
                                    <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="17">
                                        17.<label class=" hover-underline p-1"> What are the minimum numbers of pages for the Proposal and Final Year Reports?</label>
                                    </a>
                                    <div class="grid__description px-6">
                                        The minimum number of pages for the Proposal report is 30 pages and for the Final Year Report, is 50 page
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>