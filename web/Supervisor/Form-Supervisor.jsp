<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Forms</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script defer src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"></script>
        <style>
        .custom-modal .modal-card {
    background-color: white;
    color: #333;
    width: 80%; /* Adjust this value to make the modal wider or narrower */
    max-width: none; /* Ensure the modal can grow beyond the default max-width */
}

.custom-modal .modal-card-head,
.custom-modal .modal-card-foot {
    background-color: #f5f5f5;
}

.custom-modal .modal-card-title {
    color: #333;
}

.custom-modal .modal-card-body {
    background-color: white;
}

.custom-modal .modal-background {
    background-color: rgba(10, 10, 10, 0.86);
}
</style>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../supervisor-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column h-100 p-6" style="background-color:#FFFFFF; overflow-y: scroll;">
                    <div class="custom-border p-6 w-100">
                        <div class="container">
                            <div class="tabs is-boxed">
                            <ul>
                                <li data-target="tab-1"><a>Form 5-Formulation Presentation</a></li>
                                <li data-target="tab-2"><a>Form 6-Evaluation Form</a></li>
                                <li data-target="tab-3"><a>Form 7-Formulation Presentation</a></li>
                                <li data-target="tab-4"><a>Form 8-Evaluation Form</a></li>
                            </ul>
                            </div>
                            <div id="tab-1" class="tab-content is-hidden">
                                <div class="p-3">
                                    <div class="p-1" id="table">
                                <table class="">
                                    <thead>
                                    <tr style="border-bottom: 2px solid #ddd;">
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Matric ID</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Student</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Project Title</th>
                                        <th class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="report" items="${listReportsF5}">
                                        <tr>
                                            <td class="has-text-centered">${report.studentId}</td>
                                            <td class="has-text-centered">${report.studentName}</td>
                                            <td class="has-text-centered">${report.projectTitle}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered p-4" data-label="Actions">
                                            <div class="buttons has-text-centered is-flex is-justify-content-center">
                                                <form action="${pageContext.request.contextPath}/SupervisorProjectDetailsServlet" method="post">
                                                    <input type="hidden" name="proId" value="${report.proId}">
                                                    <input type="hidden" name="studentId" value="${report.studentId}">
                                                    <button type="submit" class="button is-success is-outlined is-small">
                                                        <i class="fas fa-eye"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                                </div>
                            </div>
                            <div id="tab-2" class="tab-content is-hidden">
                                <div class="p-3">
                                    
                                </div>
                            </div>
                            <div id="tab-3" class="tab-content is-hidden">
                                <div class="p-3">
                                    <div class="p-1" id="table">
                                <table class="">
                                    <thead>
                                    <tr style="border-bottom: 2px solid #ddd;">
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Matric ID</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Student</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Project Title</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Report</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Supervisor Name</th>
                                        <th class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="report" items="${listReports}">
                                        <tr>
                                            <td class="has-text-centered">${report.studentId}</td>
                                            <td class="has-text-centered">${report.studentName}</td>
                                            <td class="has-text-centered">${report.projectTitle}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">
                                                <div class="is-flex is-justify-content-center">
                                                    <a href="${pageContext.request.contextPath}/ViewProjectServlet?proId=${report.proId}"  target="_blank" class="button is-success is-outlined is-small mr-1">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="has-text-centered">${report.supervisorName}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                                <button class="button is-small is-info" onclick="openModal(${report.formtId})">View Details</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                                    <div class="p-3">        
                                 <div class="pb-3 has-text-grey has-text-weight-semibold">CSP600 - PROJECT FORMULATION PRESENTATION EVALUATION (F7) RUBRIC</div>
                        <table class="">
                            <thead>
                                <tr class="has-background-grey" style="border-bottom: 2px solid #ddd;">
                                    <th class="has-text-white is-size-7 has-text-centered">No</th>
                                    <th class="has-text-white is-size-7 has-text-centered">Assessment Criteria</th>
                                    <th class="has-text-white is-size-7 has-text-centered">Excellent (8-10)</th>
                                    <th class="has-text-white is-size-7 has-text-centered">Good (6-7)</th>
                                    <th class="has-text-white is-size-7 has-text-centered">Satisfactory (5)</th>
                                    <th class="has-text-white is-size-7 has-text-centered">Poor (1-4)</th>
                                    <th class="has-text-white is-size-7 has-text-centered">0</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey" data-label="No">1</td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Assessment Criteria">Depth of Knowledge</td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Excellent (8-10)">
                                        <ul>
                                            <li>&bull; The presenter is clear and easily understood.</li>
                                            <li>&bull; Shows depth of thought.</li>
                                            <li>&bull; Able to answer questions in an intelligent manner.</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Good (6-7)">
                                        <ul>
                                            <li>&bull; The presenter shows depth of thought in some areas.</li>
                                            <li>&bull; Mostly clear with little confusion in the presentation.</li>
                                            <li>&bull; Able to answer questions.</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Satisfactory (5)">
                                        <ul>
                                            <li>&bull; The presenter shows some understanding of the subject matter but little depth.</li>
                                            <li>&bull; Somewhat clear with some confusion in the presentation.</li>
                                            <li>&bull; Able to answer some questions.</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Poor (1-4)">
                                        <ul>
                                            <li>&bull; The presenter shows a surface knowledge only.</li>
                                            <li>&bull; Lack clarity and is confusing.</li>
                                            <li>&bull; Unable to respond to questions.</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey" data-label="No">2</td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Assessment Criteria">Overall Organization of The Project Presentation</td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Excellent (8-10)">
                                        <ul>
                                            <li>&bull; The presenter delivers an excellent presentation with a smooth flow and provides good explanations and/or elaboration.</li>
                                            <li>&bull; Time is used wisely.</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Good (6-7)">
                                        <ul>
                                            <li>&bull; The presenter delivers a good presentation and provides explanation and/or elaboration.</li>
                                            <li>&bull; Time is used wisely.</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Satisfactory (5)">
                                        <ul>
                                            <li>&bull; The presenter delivers a fair presentation and provides explanation and/or insufficient elaboration.</li>
                                            <li>&bull; Time is fairly used..</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Poor (1-4)">
                                        <ul>
                                            <li>&bull; The presenter delivers a poor presentation there is no presentation flow.</li>
                                            <li>&bull; Time limit is exceeded and/or the topics are not well covered.</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey" data-label="No">3</td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Assessment Criteria">Use Variety of Presentation Materials</td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Excellent (8-10)">
                                        <ul>
                                            <li>&bull; There is a variety of materials/media used.</li>
                                            <li>&bull; Presentation materials/media are of good quality and useful.</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Good (6-7)">
                                        <ul>
                                            <li>&bull; There is a variety of materials/media used.</li>
                                            <li>&bull; Most of the presentation materials/media are of good quality.</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Satisfactory (5)">
                                        <ul>
                                            <li>&bull; There is a fair variety of materials/media used.</li>
                                            <li>&bull; Materials/media are adequate with some questionable sources.</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Poor (1-4)">
                                        <ul>
                                            <li>&bull; There is little variety of materials/media used.</li>
                                            <li>&bull; Materials/media are inadequate with many questionable sources.</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey" data-label="No">4</td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Assessment Criteria">Delivery Skills</td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Excellent (8-10)">
                                        <ul>
                                            <li>&bull; The presenter speaks clearly and is audible to the audience.</li>
                                            <li>&bull; Grammatical errors are insignificant and pronunciation is very good.</li>
                                            <li>&bull; Excellent eye contact.</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Good (6-7)">
                                        <ul>
                                            <li>&bull; The presenter speaks clearly and is audible to most of the audience.</li>
                                            <li>&bull; Relatively few grammatical errors and pronunciation is good.</li>
                                            <li>&bull; Good eye contact.</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Satisfactory (5)">
                                        <ul>
                                            <li>&bull; The presenter speaks relatively clear, but may not be audible to the back audience.</li>
                                            <li>&bull; Some grammatical errors and some mispronunciation.</li>
                                            <li>&bull; Some eye contact.</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Poor (1-4)">
                                        <ul>
                                            <li>&bull; The presenter does not speak clearly and may not be audible to most of the audience.</li>
                                            <li>&bull; Persistent grammatical errors and serious mispronunciation.</li>
                                            <li>&bull; Very poor eye contact.</li>
                                        </ul>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                                </div>         
                                </div>
                            </div>
                            <div id="tab-4" class="tab-content is-hidden">
                                <div class="p-3">
                                    <div class="p-1" id="table">
                                <table class="">
                                    <thead>
                                    <tr style="border-bottom: 2px solid #ddd;">
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Matric ID</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Student</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Project Title</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Report</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Supervisor Name</th>
                                        <th class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="report" items="${listReportsF8}">
                                        <tr>
                                            <td class="has-text-centered">${report.studentId}</td>
                                            <td class="has-text-centered">${report.studentName}</td>
                                            <td class="has-text-centered">${report.projectTitle}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">
                                                <div class="is-flex is-justify-content-center">
                                                    <a href="${pageContext.request.contextPath}/ViewProjectServlet?proId=${report.proId}"  target="_blank" class="button is-success is-outlined is-small mr-1">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="has-text-centered">${report.supervisorName}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                                <button class="button is-small is-info" onclick="openModal2(${report.formtId})">View Details</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                                    <div class="p-3">
                                        <div class="pb-3 has-text-grey has-text-weight-semibold">CSP600 - PROJECT
                                FORMULATION REPORT EVALUATION (F8) RUBRIC</div>
                            <table class="">
                                <thead>
                                    <tr class="has-background-grey" style="border-bottom: 2px solid #ddd;">
                                        <th class="has-text-white is-size-7 has-text-centered"
                                            style="width:7%;">No</th>
                                        <th class="has-text-white is-size-7 has-text-centered">Assessment
                                            Criteria</th>
                                        <th class="has-text-white is-size-7 has-text-centered">Excellent
                                            (8-10)</th>
                                        <th class="has-text-white is-size-7 has-text-centered">Good (6-7)
                                        </th>
                                        <th class="has-text-white is-size-7 has-text-centered">Satisfactory
                                            (5)</th>
                                        <th class="has-text-white is-size-7 has-text-centered">Poor (1-4)
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="has-text-grey has-text-centered is-size-7 has-text-right-mobile"
                                            data-label="No">1</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Assessment Criteria">Project Background and Problem
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Excellent (8-10)">
                                            <ul>
                                                <li>&bull; Working title that clearly reflects the project.
                                                </li>
                                                <li>&bull; Well-defined problem statement. Provides
                                                    exceptionally clear context supporting rationale for
                                                    proposed project; clear statement of why project is
                                                    needed.</li>
                                                <li>&bull; Well-defined problem statement.</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Good (6-7)">
                                            <ul>
                                                <li>&bull; Working title that reflects the project.</li>
                                                <li>&bull; Clear problem statement. Provides clear context
                                                    supporting rationale for proposed project; clear
                                                    statement of why project is needed.</li>
                                                <li>&bull;Clear project scope.</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Satisfactory (5)">
                                            <ul>
                                                <li>&bull; Appropriate working title.</li>
                                                <li>&bull; Adequate statement of context supporting
                                                    rationale for proposed project, statement of why project
                                                    is needed.</li>
                                                <li>&bull; Adequate project scope.</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Poor (1-4)">
                                            <ul>
                                                <li>&bull; Inappropriate working title.</li>
                                                <li>&bull; Unclear problem statement.</li>
                                                <li>&bull; Poor statement of context supporting rationale
                                                    for proposed project, statement of why project is
                                                    needed.</li>
                                                <li>&bull; Not well-defined project scope.</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="has-text-grey has-text-centered is-size-7 has-text-right-mobile"
                                            data-label="No">2</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Assessment Criteria">Objectives</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Excellent (8-10)">
                                            <ul>
                                                <li>&bull; Highly reflect the following elements:</li>
                                                <li>&bull; Specific</li>
                                                <li>&bull; Measurable</li>
                                                <li>&bull; Achievable</li>
                                                <li>&bull; Realistic</li>
                                                <li>&bull; Timeliness</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Good (6-7)">
                                            <ul>
                                                <li>&bull; Clearly reflect the following elements:</li>
                                                <li>&bull; Specific</li>
                                                <li>&bull; Measurable</li>
                                                <li>&bull; Achievable</li>
                                                <li>&bull; Realistic</li>
                                                <li>&bull; Timeliness</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Satisfactory (5)">
                                            <ul>
                                                <li>&bull; Adequately reflect the following elements:</li>
                                                <li>&bull; Specific</li>
                                                <li>&bull; Measurable</li>
                                                <li>&bull; Achievable</li>
                                                <li>&bull; Realistic</li>
                                                <li>&bull; Timeliness</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Poor (1-4)">
                                            <ul>
                                                <li>&bull; Does not reflect the following elements:</li>
                                                <li>&bull; Specific</li>
                                                <li>&bull; Measurable</li>
                                                <li>&bull; Achievable</li>
                                                <li>&bull; Realistic</li>
                                                <li>&bull; Timeliness</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="has-text-grey has-text-centered is-size-7 has-text-right-mobile"
                                            data-label="No">3</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Assessment Criteria">Significance of The Study</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Excellent (8-10)">
                                            <ul>
                                                <li>&bull; Highly relevant to the community and
                                                    practitioners.</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Good (6-7)">
                                            <ul>
                                                <li>&bull; Relevant to the community and practitioners.</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Satisfactory (5)">
                                            <ul>
                                                <li>&bull; Adequately relevant to the community and
                                                    practitioners.</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Poor (1-4)">
                                            <ul>
                                                <li>&bull; Not relevant to the community and practitioners.
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="has-text-grey has-text-centered is-size-7 has-text-right-mobile"
                                            data-label="No">4</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Assessment Criteria">Literature Review</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Excellent (8-10)">
                                            <ul>
                                                <li>&bull; Thorough review of relevant and empirical
                                                    sources, citing seminal works in the field.</li>
                                                <li>&bull; Exemplary synthesis and organization of
                                                    literature that is clearly linked to project question.
                                                </li>
                                                <li>&bull; Specific attention to diversity issues pertaining
                                                    to project topic.</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Good (6-7)">
                                            <ul>
                                                <li>&bull; Good review of relevant and empirical sources,
                                                    citing seminal works in the field.</li>
                                                <li>&bull; Good synthesis and literature organization of
                                                    that is clearly linked to project question.</li>
                                                <li>&bull; Attention to diversity issues pertaining to
                                                    project topic.</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Satisfactory (5)">
                                            <ul>
                                                <li>&bull; Adequate review of relevant and empirical
                                                    sources.</li>
                                                <li>&bull; Adequate synthesis and organization of literature
                                                    that is linked to project question.</li>
                                                <li>&bull; Some attention to diversity issues pertaining to
                                                    project topic.</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Poor (1-4)">
                                            <ul>
                                                <li>&bull; Incomplete or poorly developed review of
                                                    literature.</li>
                                                <li>&bull; Problems with organization</li>
                                                <li>&bull; Weak linkage to project topic.</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="has-text-grey has-text-centered is-size-7 has-text-right-mobile"
                                            data-label="No">5</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Assessment Criteria">Project Methodology</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Excellent (8-10)">
                                            <ul>
                                                <li>&bull; Highly reflects the following elements:</li>
                                                <li>&bull; Approach</li>
                                                <li>&bull; Methods</li>
                                                <li>&bull; Design</li>
                                                <li>&bull; Deliverables</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Good (6-7)">
                                            <ul>
                                                <li>&bull; Clearly reflex the following elements:</li>
                                                <li>&bull; Approach</li>
                                                <li>&bull; Methods</li>
                                                <li>&bull; Design</li>
                                                <li>&bull; Deliverables</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Satisfactory (5)">
                                            <ul>
                                                <li>&bull; Adequately reflects the following elements:</li>
                                                <li>&bull; Approach</li>
                                                <li>&bull; Methods</li>
                                                <li>&bull; Design</li>
                                                <li>&bull; Deliverables</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Poor (1-4)">
                                            <ul>
                                                <li>&bull; Poor reflects the following elements:</li>
                                                <li>&bull; Approach</li>
                                                <li>&bull; Methods</li>
                                                <li>&bull; Design</li>
                                                <li>&bull; Deliverables</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="has-text-grey has-text-centered is-size-7 has-text-right-mobile"
                                            data-label="No">6</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Assessment Criteria">Presentation of Report</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Excellent (8-10)">
                                            <ul>
                                                <li>&bull; The report is well structured and organized
                                                    following the standard research reporting
                                                    procedure/format.</li>
                                                <li>&bull; Sentences are complete and no grammatical error,
                                                    and they flow together easily.</li>
                                                <li>&bull; All figures, graphs, charts and drawings are
                                                    accurate, consistent with the text and of good quality.
                                                </li>
                                                <li>&bull; Contain most relevant references and citations.
                                                </li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Good (6-7)">
                                            <ul>
                                                <li>&bull; The report is structured and organized following
                                                    the standard research reporting procedure/format.</li>
                                                <li>&bull; Sentences are complete with minor grammatical
                                                    error.</li>
                                                <li>&bull; Some figures, graphs, charts and drawings are
                                                    accurate, consistent with the text and of good quality.
                                                </li>
                                                <li>&bull; Contain some relevant references and citations.
                                                </li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Satisfactory (5)">
                                            <ul>
                                                <li>&bull; The report is poorly structured and organized
                                                    following the standard research reporting
                                                    procedure/format.</li>
                                                <li>&bull; Sentences are complete with minor grammatical
                                                    error.</li>
                                                <li>&bull; Some figures, graphs, charts and drawings are not
                                                    accurate, consistent with the text and of good quality.
                                                </li>
                                                <li>&bull; Contain a few relevant references and citations.
                                                </li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Poor (1-4)">
                                            <ul>
                                                <li>&bull; The report does not follow the standard research
                                                    reporting procedure/format.</li>
                                                <li>&bull; Poor grammar structure.</li>
                                                <li>&bull; Figures, graphs, charts and drawings are not
                                                    accurate, inconsistent with the text and of good
                                                    quality.</li>
                                                <li>&bull; Contain irrelevant references and citations.</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="has-text-grey has-text-centered is-size-7 has-text-right-mobile"
                                            data-label="No">7</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Assessment Criteria">Progress Evaluation (
                                            Supervisor Only)</td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Excellent (8-10)">
                                            <ul>
                                                <li>&bull; Students highly adhere to the following elements:
                                                </li>
                                                <li>&bull; Meetings</li>
                                                <li>&bull; Responsibilities</li>
                                                <li>&bull; Commitment</li>
                                                <li>&bull; Independence</li>
                                                <li>&bull; Maturity</li>
                                                <li>&bull; Attitude</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Good (6-7)">
                                            <ul>
                                                <li>&bull; Students adhere to the following elements:</li>
                                                <li>&bull; Meetings</li>
                                                <li>&bull; Responsibilities</li>
                                                <li>&bull; Commitment</li>
                                                <li>&bull; Independence</li>
                                                <li>&bull; Maturity</li>
                                                <li>&bull; Attitude</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Satisfactory (5)">
                                            <ul>
                                                <li>&bull; Students moderately adhere to the following
                                                    elements:</li>
                                                <li>&bull; Meetings</li>
                                                <li>&bull; Responsibilities</li>
                                                <li>&bull; Commitment</li>
                                                <li>&bull; Independence</li>
                                                <li>&bull; Maturity</li>
                                                <li>&bull; Attitude</li>
                                            </ul>
                                        </td>
                                        <td class="has-text-grey is-size-7 has-text-right-mobile"
                                            data-label="Poor (1-4)">
                                            <ul>
                                                <li>&bull; Students poorly adhere to the following elements:
                                                </li>
                                                <li>&bull; Meetings</li>
                                                <li>&bull; Responsibilities</li>
                                                <li>&bull; Commitment</li>
                                                <li>&bull; Independence</li>
                                                <li>&bull; Maturity</li>
                                                <li>&bull; Attitude</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                                    </div>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      <!-- Modal Structure -->
      
      <div class="modal custom-modal" id="detailModal2">
    <div class="modal-background"></div>
    <div class="modal-card">
        <header class="modal-card-head">
            <p class="modal-card-title">Project Details</p>
            <button class="delete" aria-label="close" onclick="closeModal2()"></button>
        </header>
        <section class="modal-card-body">
            <!-- Content -->
            <div class="columns is-multiline">
                <form action="F8SupervisorServlet" method="post">
                    <input type="hidden" id="modalFormtId2" name="formtId2" value="">
                       <div class="column is-2" style="align-content: center">
                                    <label class="has-text-weight-semibold has-text-grey">Handover Date :</label>
                                </div>
                                <div class="column is-10">
                                    <div class="py-2">
                                    <input class="px-4 py-2" name="handoverDate" id="handoverDate" type="date" placeholder="" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                                </div>
                            </div>
                                            <div class="column is-2" style="align-content: center">
                            <label class="has-text-weight-semibold has-text-grey">Comment:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" placeholder="Your comment" name="comment2" id="comment2"
                                       style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                <div class="column is-12">
                    <div class="p-3">
                        <div class="is-flex is-justify-content-space-between py-4">
                            <table class="">
                                <thead>
                                    <tr>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Assessment Criteria</th>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Weight (W)</th>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Score (s) [1-10]</th>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Marks (W*S)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="p-5" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7 has-text-grey">1. Project Background and Problem</p>
                                            <p class="is-size-7 has-text-grey">(Appropriate working title, clear problem statement, well-defined project scope.)</p>
                                        </td>
                                        <td class="has-text-centered has-text-grey has-text-weight-bold" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT1">3</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft1" class="form-control" name="ft1" onchange="getDataFT1()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT1" id="valueFT1" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF1" id="dataF1">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">2. Objectives</p>
                                            <p class="is-size-7">(Clear, measurable and achievable.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT2">2</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft2" class="form-control" name="ft2" onchange="getDataFT2()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT2" id="valueFT2" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF2" id="dataF2">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">3. Significance of the Study</p>
                                            <p class="is-size-7">(Relevant to the community and practitioners.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT3">1</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft3" class="form-control" name="ft3" onchange="getDataFT3()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT3" id="valueFT3" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF3" id="dataF3">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">4. Literature Review</p>
                                            <p class="is-size-7">(Able to identify, collect, summarize and analyze relevant and latest issues of subject matter.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT4">5</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft4" class="form-control" name="ft4" onchange="getDataFT4()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT4" id="valueFT4" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF4" id="dataF4">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">5. Project Methodology</p>
                                            <p class="is-size-7">(Appropriate approach, methods, sources and deliverable in accomplishing the project.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT5">6</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft5" class="form-control" name="ft5" onchange="getDataFT5()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT5" id="valueFT5" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF5" id="dataF5">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">6. Presentation of the Report</p>
                                            <p class="is-size-7">(Follow the given guidelines, consistency of the contents, clarity, and language of the report, contain valid references and citations.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT6">3</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft6" class="form-control" name="ft6" onchange="getDataFT6()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" anme="valueFT6" id="valueFT6" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF6" id="dataF6">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">7. Progress Evaluation</p>
                                            <p class="is-size-7">(This may include supervisory meetings (Project In-Progress Form- F3), supervisory independency, responsibilities, commitment, maturity, etc.) </p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT7">2</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft7" class="form-control" name="ft7" onchange="getDataFT7()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT7" id="valueFT7" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF7" id="dataF7">
                                    </tr> 
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">Total Marks</p>
                                        </td>
                                        <td class="has-text-centered has-text-weight-bold" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                        <td class="has-text-centered has-text-weight-bold" data-label="Marks (W*S)" id="totalFMarks" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="equalF" id="equalF">
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="columns p-3">
                        <div class="column" style="justify-content: flex-end; align-items: flex-end;">
                            <div style="float: right;">
                                <button type="submit" class="button is-small is-info">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
                </form>     
            </div>
        </section>
        <footer class="modal-card-foot">
                <button class="button" onclick="closeModal2()">Close</button>
            </footer>
    </div>
</div>  
<div class="modal custom-modal" id="detailModal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <header class="modal-card-head">
            <p class="modal-card-title">Project Details</p>
            <button class="delete" aria-label="close" onclick="closeModal()"></button>
        </header>
        <section class="modal-card-body">
            <!-- Content -->
            <div class="columns is-multiline">
                <form action="F7Servlet" method="post">
                    <input type="hidden" id="modalFormtId" name="formtId" value="">
                <div class="column is-2" style="align-content: center">
                    <label class="has-text-weight-semibold has-text-grey">Presentation Date :</label>
                </div>
                <div class="column is-10">
                    <div class="py-2">
                        <input class="px-4 py-2" name="presentDate" id="presentDate" type="date" placeholder="" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    </div>
                </div>
                <div class="column is-2" style="align-content: center">
                    <label class="has-text-weight-semibold has-text-grey">Comment:</label>
                </div>
                <div class="column is-10">
                    <div class="py-2">
                        <input class="px-4 py-2" type="text" placeholder="Your comment" name="comment" id="comment" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    </div>
                </div>
                <div class="column is-12">
                    <div class="p-3">
                        <div class="is-flex is-justify-content-space-between py-4">
                            <table class="">
                                <thead>
                                <tr>
                                    <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Assessment Criteria</th>
                                    <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Weight (W)</th>
                                    <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Score (s) [1-10] (refer to F7 rubric)</th>
                                    <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Marks (W*S)</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">1. Depth of Knowledge</p>
                                            <p class="is-size-7 has-text-grey-dark">(Possess a clear understanding and able to explain the subject matter.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT1">3</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="t1" class="form-control" name="t1" onchange="getDataT1()">
                                                <option hidden>Score</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueT1" id="valueT1" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="data1" id="data1">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">2. Overall Organization of the Project Presentation</p>
                                            <p class="is-size-7 has-text-grey-dark">(Exhibit/Present the project in a clear, engaging and appropriate form.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT2">2</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="t2" class="form-control" name="t2" onchange="getDataT2()">
                                                <option hidden>Score</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueT2" id="valueT2" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="data2" id="data2">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">3. Use Quality of Presentation Materials</p>
                                            <p class="is-size-7 has-text-grey-dark">(Use several materials or media in presenting the project.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT3">2</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="t3" class="form-control" name="t3" onchange="getDataT3()">
                                                <option hidden>Score</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueT3" id="valueT3" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="data3" id="data3">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">4. Delivery Skills</p>
                                            <p class="is-size-7 has-text-grey-dark">(Proper language used, speak clearly, loudly and at appropriate pace, effective eye contact and presentable attitude.) </p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT4">3</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="t4" class="form-control" name="t4" onchange="getDataT4()">
                                                <option hidden>Score</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueT4" id="valueT4" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="data4" id="data4">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">Total Marks</p>
                                        </td>
                                        <td class="has-text-centered has-text-weight-bold" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                        <td class="has-text-centered has-text-weight-bold" data-label="Marks (W*S)" id="totalMarks" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="equal" id="equal">
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="columns p-3">
                        <div class="column" style="justify-content: flex-end; align-items: flex-end;">
                            <div style="float: right;">
                                <button type="submit" class="button is-small is-info">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
                </form>     
            </div>
        </section>
        <footer class="modal-card-foot">
                <button class="button" onclick="closeModal()">Close</button>
            </footer>
    </div>
</div>
      

<div class="modal custom-modal" id="detailModal2">
    <div class="modal-background"></div>
    <div class="modal-card">
        <header class="modal-card-head">
            <p class="modal-card-title">Project Details</p>
            <button class="delete" aria-label="close" onclick="closeModal2()"></button>
        </header>
        <section class="modal-card-body">
            <!-- Content -->
            <div class="columns is-multiline">
                <form action="F8SupervisorServlet" method="post">
                    <input type="hidden" id="modalFormtId2" name="formtId2" value="">
                 <div class="column is-2" style="align-content: center">
                                    <label class="has-text-weight-semibold has-text-grey">Handover Date :</label>
                                </div>
                                <div class="column is-10">
                                    <div class="py-2">
                                    <input class="px-4 py-2" name="handoverDate" id="handoverDate" type="date" placeholder="" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                                </div>
                            </div>
                                            <div class="column is-2" style="align-content: center">
                            <label class="has-text-weight-semibold has-text-grey">Comment:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" placeholder="Your comment" name="comment2" id="comment2"
                                       style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                <div class="column is-12">
                    <div class="p-3">
                        <div class="is-flex is-justify-content-space-between py-4">
                            <table class="">
                                <thead>
                                    <tr>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Assessment Criteria</th>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Weight (W)</th>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Score (s) [1-10]</th>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Marks (W*S)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="p-5" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7 has-text-grey">1. Project Background and Problem</p>
                                            <p class="is-size-7 has-text-grey">(Appropriate working title, clear problem statement, well-defined project scope.)</p>
                                        </td>
                                        <td class="has-text-centered has-text-grey has-text-weight-bold" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT1">3</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft1" class="form-control" name="ft1" onchange="getDataFT1()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT1" id="valueFT1" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF1" id="dataF1">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">2. Objectives</p>
                                            <p class="is-size-7">(Clear, measurable and achievable.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT2">2</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft2" class="form-control" name="ft2" onchange="getDataFT2()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT2" id="valueFT2" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF2" id="dataF2">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">3. Significance of the Study</p>
                                            <p class="is-size-7">(Relevant to the community and practitioners.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT3">1</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft3" class="form-control" name="ft3" onchange="getDataFT3()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT3" id="valueFT3" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF3" id="dataF3">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">4. Literature Review</p>
                                            <p class="is-size-7">(Able to identify, collect, summarize and analyze relevant and latest issues of subject matter.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT4">5</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft4" class="form-control" name="ft4" onchange="getDataFT4()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT4" id="valueFT4" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF4" id="dataF4">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">5. Project Methodology</p>
                                            <p class="is-size-7">(Appropriate approach, methods, sources and deliverable in accomplishing the project.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT5">6</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft5" class="form-control" name="ft5" onchange="getDataFT5()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT5" id="valueFT5" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF5" id="dataF5">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">6. Presentation of the Report</p>
                                            <p class="is-size-7">(Follow the given guidelines, consistency of the contents, clarity, and language of the report, contain valid references and citations.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT6">3</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft6" class="form-control" name="ft6" onchange="getDataFT6()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" anme="valueFT6" id="valueFT6" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF6" id="dataF6">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">7. Progress Evaluation</p>
                                            <p class="is-size-7">(This may include supervisory meetings (Project In-Progress Form- F3), supervisory independency, responsibilities, commitment, maturity, etc.) </p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wFT7">2</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="ft7" class="form-control" name="ft7" onchange="getDataFT7()">
                                                <option hidden>Score</option>        
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueFT7" id="valueFT7" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="dataF7" id="dataF7">
                                    </tr> 
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">Total Marks</p>
                                        </td>
                                        <td class="has-text-centered has-text-weight-bold" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                        <td class="has-text-centered has-text-weight-bold" data-label="Marks (W*S)" id="totalFMarks" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="equalF" id="equalF">
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="columns p-3">
                        <div class="column" style="justify-content: flex-end; align-items: flex-end;">
                            <div style="float: right;">
                                <button type="submit" class="button is-small is-info">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
                </form>     
            </div>
        </section>
        <footer class="modal-card-foot">
                <button class="button" onclick="closeModal2()">Close</button>
            </footer>
    </div>
</div>      
      <script>
            document.addEventListener('DOMContentLoaded', () => {
            const tabs = document.querySelectorAll('.tabs ul li');
            const tabContents = document.querySelectorAll('.tab-content');

            tabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    tabs.forEach(item => item.classList.remove('is-active'));
                    tab.classList.add('is-active');

                    const target = tab.dataset.target;
                    tabContents.forEach(content => {
                        if (content.id === target) {
                            content.classList.remove('is-hidden');
                        } else {
                            content.classList.add('is-hidden');
                        }
                    });
                });
            });
        });
        
            // Function to open the modal and populate it with data
    function openModal(formtId) {
            document.getElementById("detailModal").classList.add("is-active");
            document.getElementById("modalFormtId").value = formtId; // Set formtId to hidden input
        }
        
    function openModal2(formtId) {
            document.getElementById("detailModal2").classList.add("is-active");
            document.getElementById("modalFormtId2").value = formtId; // Set formtId to hidden input
        }
        
    function openModal5(proId) {
            document.getElementById("detailModal5").classList.add("is-active");
            document.getElementById("proId").value = formtId; // Set formtId to hidden input
        }     
    

    // Function to close the modal
    function closeModal() {
        document.getElementById("detailModal").classList.remove("is-active");
    }
    
    function closeModal2() {
        document.getElementById("detailModal2").classList.remove("is-active");
    }
    
    function closeModal5() {
        document.getElementById("detailModal5").classList.remove("is-active");
    }
    
     function getDataT1() {
            let scoreT1 = document.getElementById("t1").value;
            let data1 = document.getElementById("data1");
            let weightT1 = document.getElementById("wT1").textContent;
            document.getElementById("valueT1").textContent = parseInt(scoreT1) * parseInt(weightT1);
            data1.value = parseInt(scoreT1) * parseInt(weightT1);
            updateTotalMarks();
        }

        function getDataT2() {
            let scoreT2 = document.getElementById("t2").value;
            let data2 = document.getElementById("data2");
            let weightT2 = document.getElementById("wT2").textContent;
            document.getElementById("valueT2").textContent = parseInt(scoreT2) * parseInt(weightT2);
            data2.value = parseInt(scoreT2) * parseInt(weightT2);
            updateTotalMarks();
        }

        function getDataT3() {
            let scoreT3 = document.getElementById("t3").value;
            let data3 = document.getElementById("data3");
            let weightT3 = document.getElementById("wT3").textContent;
            document.getElementById("valueT3").textContent = parseInt(scoreT3) * parseInt(weightT3);
            data3.value = parseInt(scoreT3) * parseInt(weightT3);
            updateTotalMarks();
        }

        function getDataT4() {
            let scoreT4 = document.getElementById("t4").value;
            let data4 = document.getElementById("data4");
            let weightT4 = document.getElementById("wT4").textContent;
            document.getElementById("valueT4").textContent = parseInt(scoreT4) * parseInt(weightT4);
            data4.value = parseInt(scoreT4) * parseInt(weightT4);
            updateTotalMarks();
        }

        function updateTotalMarks() {
            let totalMarks = 0;
            for (let i = 1; i <= 4; i++) {
                let value = document.getElementById('valueT' + i).textContent;
                totalMarks += parseInt(value);
            }
            document.getElementById("totalMarks").textContent = totalMarks;
            document.getElementById("equal").value = totalMarks;
        }
        
        function getDataFT1() {
        let scoreFT1 = document.getElementById("ft1").value;
        let dataF1 = document.getElementById("dataF1");
        let weightFT1 = document.getElementById("wFT1").textContent;
        document.getElementById("valueFT1").textContent = parseInt(scoreFT1) * parseInt(weightFT1);
        dataF1.value= parseInt(scoreFT1) * parseInt(weightFT1);
        updateTotalMarksF();
    }

    function getDataFT2() {
        let scoreFT2 = document.getElementById("ft2").value;
        let dataF2 = document.getElementById("dataF2");
        let weightFT2 = document.getElementById("wFT2").textContent;
        document.getElementById("valueFT2").textContent = parseInt(scoreFT2) * parseInt(weightFT2);
        dataF2.value= parseInt(scoreFT2) * parseInt(weightFT2);
        updateTotalMarksF();
    }

    function getDataFT3() {
        let scoreFT3 = document.getElementById("ft3").value;
        let dataF3 = document.getElementById("dataF3");
        let weightFT3 = document.getElementById("wFT3").textContent;
        document.getElementById("valueFT3").textContent = parseInt(scoreFT3) * parseInt(weightFT3);
        dataF3.value= parseInt(scoreFT3) * parseInt(weightFT3);
        updateTotalMarksF();
    }

    function getDataFT4() {
        let scoreFT4 = document.getElementById("ft4").value;
        let dataF4=document.getElementById("dataF4");
        let weightFT4 = document.getElementById("wFT4").textContent;
        document.getElementById("valueFT4").textContent = parseInt(scoreFT4) * parseInt(weightFT4);
        dataF4.value= parseInt(scoreFT4) * parseInt(weightFT4);
        updateTotalMarksF();
    }

    function getDataFT5() {
        let scoreFT5 = document.getElementById("ft5").value;
        let dataF5=document.getElementById("dataF5");
        let weightFT5 = document.getElementById("wFT5").textContent;
        document.getElementById("valueFT5").textContent = parseInt(scoreFT5) * parseInt(weightFT5);
        dataF5.value= parseInt(scoreFT5) * parseInt(weightFT5);
        updateTotalMarksF();
    }

    function getDataFT6() {
        let scoreFT6 = document.getElementById("ft6").value;
        let dataF6=document.getElementById("dataF6");
        let weightFT6 = document.getElementById("wFT6").textContent;
        document.getElementById("valueFT6").textContent = parseInt(scoreFT6) * parseInt(weightFT6);
        dataF6.value= parseInt(scoreFT6) * parseInt(weightFT6);
        updateTotalMarksF();
    }

    function getDataFT7() {
        let scoreFT7 = document.getElementById("ft7").value;
        let dataF7 = document.getElementById("dataF7");
        let weightFT7 = document.getElementById("wFT7").textContent;
        document.getElementById("valueFT7").textContent = parseInt(scoreFT7) * parseInt(weightFT7);
        dataF7.value= parseInt(scoreFT7) * parseInt(weightFT7);
        updateTotalMarksF();
    }
    
    function updateTotalMarksF() {
        let totalFMarks = 0;
        let equalF=0;
        for (let i = 1; i <= 7; i++) {
            console.log(i);
            let valueF = document.getElementById('valueFT' + i).textContent;
            totalFMarks += parseInt(valueF);

        }
        document.getElementById("totalFMarks").textContent = totalFMarks;
        document.getElementById("equalF").value=totalFMarks;
    }   
      </script>     
    </body>
</html>