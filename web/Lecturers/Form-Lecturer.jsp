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
            <jsp:include page="../lecturer-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column h-100 p-6" style="background-color:#FFFFFF; overflow-y: scroll;">
                    <div class="custom-border p-6 w-100">
                        <div class="container">
                            <div class="tabs is-boxed">
                            <ul>
                                <li data-target="tab-1"><a>Form 2-Formulation Presentation</a></li>
                                <li data-target="tab-2"><a>Form 3-Evaluation Form</a></li>
                                <li data-target="tab-3"><a>Form 4-Formulation Presentation</a></li>
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
                                    <div class="is-size-5 has-text-weight-bold has-text-grey pt-2 pb-4">F2 - PROJECT
                                    MOTIVATION EVALUATION RUBRIC</div>
                                <table class="">
                                    <thead>
                                        <tr class="has-background-grey" style="border-bottom: 2px solid #ddd;">
                                            <th class="has-text-white is-size-7 has-text-centered">No</th>
                                            <th class="has-text-white is-size-7 has-text-centered">Assessment Criteria
                                            </th>
                                            <th class="has-text-white is-size-7 has-text-centered">Excellent (8-10)</th>
                                            <th class="has-text-white is-size-7 has-text-centered">Good (6-7)</th>
                                            <th class="has-text-white is-size-7 has-text-centered">Satisfactory (5)</th>
                                            <th class="has-text-white is-size-7 has-text-centered">Poor (1-4)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="No">1</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Assessment Criteria">Problem identification</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Excellent (8-10)">&bull; Well-defined problem statement.
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Good (6-7)">&bull; Clear problem statement.</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Satisfactory (5)">&bull; Adequate problem statement.</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Poor (1-4)">&bull; Unclear problem statement.</td>
                                        </tr>
                                        <tr>
                                            <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="No">2</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Assessment Criteria">Evidences</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Excellent (8-10)">
                                                <ul>
                                                    <li>&bull; Provides well-supported evidences for project.</li>
                                                    <li>&bull; Very-clear statement of why project is needed.</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Good (6-7)">
                                                <ul>
                                                    <li>&bull; Provides appropriate evidences for project.</li>
                                                    <li>&bull; Clear statement of why project is needed</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Satisfactory (5)">
                                                <ul>
                                                    <li>&bull; Provides some evidences for project.</li>
                                                    <li>&bull; Adequate statement of why project is needed.</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Poor (1-4)">
                                                <ul>
                                                    <li>&bull; Poor or no evidence for project.</li>
                                                    <li>&bull; Not-clear statement of why project is needed.</li>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="No">3</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Assessment Criteria">Solutions</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Excellent (8-10)">&bull; Well documented, reasoned and
                                                appropriate solutions.</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Good (6-7)">&bull; Appropriate solutions.</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Satisfactory (5)">&bull; Reasonable solutions.</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Poor (1-4)">&bull; Inappropriate or no solutions.</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                            </div>
                            <div id="tab-2" class="tab-content is-hidden">
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
                                    <c:forEach var="report" items="${listReportsF3}">
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
                                                <button class="button is-small is-info" onclick="openModal3(${report.formtId})">View Details</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                                    <div class="is-size-5 has-text-weight-bold has-text-grey pt-2 pb-4">F3 - LITERATURE
                                    REVIEW EVALUATION RUBRIC</div>
                                <table class="">
                                    <thead>
                                        <tr class="has-background-grey" style="border-bottom: 2px solid #ddd;">
                                            <th class="has-text-white is-size-7 has-text-centered">No</th>
                                            <th class="has-text-white is-size-7 has-text-centered">Assessment Criteria
                                            </th>
                                            <th class="has-text-white is-size-7 has-text-centered">Excellent (8-10)</th>
                                            <th class="has-text-white is-size-7 has-text-centered">Good (6-7)</th>
                                            <th class="has-text-white is-size-7 has-text-centered">Satisfactory (5)</th>
                                            <th class="has-text-white is-size-7 has-text-centered">Poor (1-4)</th>
                                            <th class="has-text-white is-size-7 has-text-centered">0</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="No">1</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Assessment Criteria">Relevance and context</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Excellent (8-10)">
                                                <ul>
                                                    <li>&bull; Shows exceptional understanding of project's relevance.
                                                    </li>
                                                    <li>&bull; Skillfully aligns the literature with project's context.
                                                    </li>
                                                    <li>&bull; Sets in-depth context for the problem.</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Good (6-7)">
                                                <ul>
                                                    <li>&bull; Shows capable understanding of project's relevance.</li>
                                                    <li>&bull; Makes some associations of the literature with project's
                                                        context.</li>
                                                    <li>&bull; Places the problem in context beyond basic leave.</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Satisfactory (5)">
                                                <ul>
                                                    <li>&bull; Shows limited understanding of project's relevance.</li>
                                                    <li>&bull; Displays some perspective of project's context.</li>
                                                    <li>&bull; Sets a basic context for the problem.</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Poor (1-4)">
                                                <ul>
                                                    <li>&bull; Does not explain project's relevance.</li>
                                                    <li>&bull; Does not place the project into context of the
                                                        literature.</li>
                                                    <li>&bull; Does not set the context for the problem .</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey has-text-centered"
                                                data-label="0">
                                                No Evidence
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="No">2</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Assessment Criteria">Knowledge of the field/sources</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Excellent (8-10)">
                                                <ul>
                                                    <li>&bull; Demonstrates exceptional depth of knowledge of the field.
                                                    </li>
                                                    <li>&bull; Comprehensive use of most recent and relevant sources.
                                                    </li>
                                                    <li>&bull; Clearly discriminates among seminal sources.</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Good (6-7)">
                                                <ul>
                                                    <li>&bull; Demonstrates proficient knowledge of the field.</li>
                                                    <li>&bull; Thorough selection of sources pertinent to project.</li>
                                                    <li>&bull; Shows some discrimination among relevant sources.</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Satisfactory (5)">
                                                <ul>
                                                    <li>&bull; Demonstrates a basic knowledge of the field.</li>
                                                    <li>&bull; Selected sources relevant to project.</li>
                                                    <li>&bull; Limited discrimination among relevant sources.</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Poor (1-4)">
                                                <ul>
                                                    <li>&bull; Lacks a basic knowledge of the field.</li>
                                                    <li>&bull; Selected sources irrelevant to project.</li>
                                                    <li>&bull; Does not discriminate among relevant sources.</li>
                                                    <li>&bull; Misinterprets sources.</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey has-text-centered"
                                                data-label="0">
                                                No Evidence
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="No">3</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Assessment Criteria">Writing</td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Excellent (8-10)">
                                                <ul>
                                                    <li>&bull; Exemplary writing quality</li>
                                                    <li>&bull; Components are connected in a seamless way.</li>
                                                    <li>&bull; No grammatical, punctuation, and/or errors</li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Good (6-7)">
                                                <ul>
                                                    <li>&bull; Is well written and coherently organized.</li>
                                                    <li>&bull; Few grammatical, punctuation, and/or spelling errors.
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Satisfactory (5)">
                                                <ul>
                                                    <li>&bull; Adequate writing quality.</li>
                                                    <li>&bull; Organized but tends to discuss papers in succession.</li>
                                                    <li>&bull; Several grammatical, punctuation, and/or spelling errors.
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey"
                                                data-label="Poor (1-4)">
                                                <ul>
                                                    <li>&bull; Writing is confusing.</li>
                                                    <li>&bull; Structure is disorganized..</li>
                                                    <li>&bull; Many grammatical, punctuation, and/or spelling errors.
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="is-size-7 has-text-right-mobile has-text-grey has-text-centered"
                                                data-label="0">
                                                No Evidence
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
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
                                    <c:forEach var="report" items="${listReportsF4}">
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
                                                <button class="button is-small is-info" onclick="openModal4(${report.formtId})">View Details</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                              <div class="is-size-5 has-text-weight-bold has-text-grey pt-2 pb-4">F4 - METHODOLOGY EVALUATION RUBRIC</div>
                        <table class="mb-4">
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
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Assessment Criteria">
                                        Design of the methodology
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Excellent (8-10)">
                                        <ul>
                                            <li>&bull; The design is correct and complete</li>
                                            <li>&bull; Additional appropriate ideas and components are presented</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Good (6-7)">
                                        <ul>
                                            <li>&bull; The design is reasonable and complete</li>
                                            <li>&bull; Some of the component presented but not appropriate</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Satisfactory (5)">
                                        <ul>
                                            <li>&bull; The design goes in the right direction</li>
                                            <li>&bull; Some of the components are not complete</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Poor (1-4)">
                                        <ul>
                                            <li>&bull; The design component is missing or not appropriate</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey has-text-centered" data-label="0">
                                        No Evidence
                                    </td>
                                </tr>
                                <tr>
                                    <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey" data-label="No">2</td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Assessment Criteria">
                                        Description
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Excellent (8-10)">
                                        <ul>
                                            <li>&bull; Description of the components is detailed</li>
                                            <li>&bull; Every component description is presented in correct and appropriate relation</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Good (6-7)">
                                        <ul>
                                            <li>&bull; Description of the components is reasonable and complete</li>
                                            <li>&bull; Some of the components’ description are presented but not appropriate</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Satisfactory (5)">
                                        <ul>
                                            <li>&bull; Part of the components’ description are reasonable</li>
                                            <li>&bull; Some of the components’ description are not complete</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Poor (1-4)">
                                        <ul>
                                            <li>&bull; Description of the components are missing, not understandable, or not relevant</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey has-text-centered" data-label="0">
                                        No Evidence
                                    </td>
                                </tr>
                                <tr>
                                    <td class="has-text-centered is-size-7 has-text-right-mobile has-text-grey" data-label="No">3</td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Assessment Criteria">
                                        Model/Technique/Method
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Excellent (8-10)">
                                        <ul>
                                            <li>&bull; Model/technique/ method employed is clear, complete, precise and follows logical order</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Good (6-7)">
                                        <ul>
                                            <li>&bull; Model/technique/ method employed appears complete but is either unclear, imprecise or fails to follow a logical order</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Satisfactory (5)">
                                        <ul>
                                            <li>&bull; Model/technique/ method employed appears not complete with either unclear, imprecise or fails to follow a logical order</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey" data-label="Poor (1-4)">
                                        <ul>
                                            <li>&bull; Model/technique/ method employed is unclear, incomplete, imprecise and fails to follow a logical order</li>
                                        </ul>
                                    </td>
                                    <td class="is-size-7 has-text-right-mobile has-text-grey has-text-centered" data-label="0">
                                        No Evidence
                                    </td>
                                </tr>
                            </tbody>
                        </table>  
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
                <form action="${pageContext.request.contextPath}/F2Servlet" method="post">
                    <input type="hidden" id="modalFormtId" name="formtId" value="">
                <div class="column is-12">
                    <div class="p-3">
                        <div class="is-flex is-justify-content-space-between py-4">
                            <table class="">
                                        <thead>
                                            <tr>
                                                <th class="has-text-grey has-text-weight-bold has-text-centered"
                                                    style="border: 1px solid #dbdbdb;">Assessment Criteria</th>
                                                <th class="has-text-grey has-text-weight-bold has-text-centered"
                                                    style="border: 1px solid #dbdbdb;">Weight (W)</th>
                                                <th class="has-text-grey has-text-weight-bold has-text-centered"
                                                    style="border: 1px solid #dbdbdb;">Score (s) [1-10] (refer to F7
                                                    rubric)</th>
                                                <th class="has-text-grey has-text-weight-bold has-text-centered"
                                                    style="border: 1px solid #dbdbdb;">Marks (W*S)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="p-5" data-label="Assessment Criteria"
                                                    style="border: 1px solid #dbdbdb;">
                                                    <p class="has-text-weight-semibold is-size-7 has-text-grey">1. Problem identification</p>
                                                    <p class="is-size-7 has-text-grey">(Identify problems/ issues/ opportunities)</p>
                                                </td>
                                                <td id="wT1" class="has-text-centered has-text-grey has-text-weight-bold"
                                                    data-label="Weight (W)"
                                                    style="border: 1px solid #dbdbdb; align-content:center;">3</td>
                                                <td class="has-text-centered" data-label="Score (s) [1-10]"
                                                    style="border: 1px solid #dbdbdb; align-content:center;">
                                                    <select id="t1" name="t1" onchange="getDataT1()">
                                                        <option value="0">Select Score</option>
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
                                                <td id="valueT1" class="has-text-centered" data-label="Marks (W*S)"
                                                    style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                                <input type="hidden" name="data1" id="data1">
                                            </tr>
                                            <tr>
                                                <td class="p-5" data-label="Assessment Criteria"
                                                    style="border: 1px solid #dbdbdb;">
                                                    <p class="has-text-weight-semibold is-size-7 has-text-grey">2. Evidences</p>
                                                    <p class="is-size-7 has-text-grey">(Evidences to support problems/ issues/ opportunities identified.)</p>
                                                </td>
                                                <td id="wT2" class="has-text-centered has-text-grey has-text-weight-bold"
                                                    data-label="Weight (W)"
                                                    style="border: 1px solid #dbdbdb; align-content:center;">5</td>
                                                <td class="has-text-centered" data-label="Score (s) [1-10]"
                                                    style="border: 1px solid #dbdbdb; align-content:center;">
                                                    <select id="t2" name="t2" onchange="getDataT2()">
                                                        <option value="0">Select Score</option>
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
                                                <td id="valueT2" class="has-text-centered" data-label="Marks (W*S)"
                                                    style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                                <input type="hidden" name="data2" id="data2">
                                            </tr>
                                            <tr>
                                                <td class="p-5" data-label="Assessment Criteria"
                                                    style="border: 1px solid #dbdbdb;">
                                                    <p class="has-text-weight-semibold is-size-7 has-text-grey">3. Solutions</p>
                                                    <p class="is-size-7 has-text-grey">(Propose solutions.)</p>
                                                </td>
                                                <td id="wT3" class="has-text-centered has-text-grey has-text-weight-bold"
                                                    data-label="Weight (W)"
                                                    style="border: 1px solid #dbdbdb; align-content:center;">2</td>
                                                <td class="has-text-centered" data-label="Score (s) [1-10]"
                                                    style="border: 1px solid #dbdbdb; align-content:center;">
                                                    <select id="t3" name="t3" onchange="getDataT3()">
                                                        <option value="0">Select Score</option>
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
                                                <td id="valueT3" class="has-text-centered" data-label="Marks (W*S)"
                                                    style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                                <input type="hidden" name="data3" id="data3">
                                            </tr>
                                            <tr>
                                                <td class="p-5" data-label="Assessment Criteria"
                                                    style="border: 1px solid #dbdbdb;">
                                                    <p class="has-text-weight-bold has-text-grey is-size-7">Total</p>
                                                    <p class="is-size-7"></p>
                                                </td>
                                                <td class="has-text-centered" data-label="Weight (W)"
                                                    style="border: 1px solid #dbdbdb; align-content:center;"> </td>
                                                <td class="has-text-centered" data-label="Score (s) [1-10]"
                                                    style="border: 1px solid #dbdbdb; align-content:center;">

                                                </td>
                                                <td class="has-text-centered" id="totalMarks" data-label="Marks (W*S)"
                                                    style="border: 1px solid #dbdbdb; align-content:center;">0</td>
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
                <form action="F8LecturerServlet" method="post">
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
                    
<div class="modal custom-modal" id="detailModal3">
    <div class="modal-background"></div>
    <div class="modal-card">
        <header class="modal-card-head">
            <p class="modal-card-title">Project Details</p>
            <button class="delete" aria-label="close" onclick="closeModal3()"></button>
        </header>
        <section class="modal-card-body">
            <!-- Content -->
            <div class="columns is-multiline">
                <form action="${pageContext.request.contextPath}/F3Servlet" method="post">
                    <input type="hidden" id="modalFormtId3" name="formtId3" value="">
                <div class="column is-12">
                    <div class="p-3">
                        <div class="is-flex is-justify-content-space-between py-4">
                            <table class="">
                                <thead>
                                    <tr>
                                        <th class="has-text-grey has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Assessment Criteria</th>
                                        <th class="has-text-grey has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Weight (W)</th>
                                        <th class="has-text-grey has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Score (s) [1-10] (refer to F7 rubric)</th>
                                        <th class="has-text-grey has-text-weight-bold has-text-centered" style="border: 1px solid #dbdbdb;">Marks (W*S)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                     <tr>
                                        <td class="p-5" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7 has-text-grey">Relevance and context</p>
                                            <p class="is-size-7 has-text-grey">Relevance and context (Identify problems / issues / opportunities)</p>
                                        </td>
                                        <td class="has-text-centered has-text-grey has-text-weight-bold" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="weight1">2</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="score1" name="score1" class="form-control" onchange="calculateMarks1()">
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
                                        <td class="has-text-centered" data-label="Marks (W*S)" style="border: 1px solid #dbdbdb; align-content:center;" id="marks1">0</td>
                                        <input type="hidden" name="hiddenMarks1" id="hiddenMarks1">
                                    </tr>
                                    <tr>
                                        <td class="p-5" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7 has-text-grey">Knowledge of the field/sources</p>
                                            <p class="is-size-7 has-text-grey">(Knowledge of the field/sources)</p>
                                        </td>
                                        <td class="has-text-centered has-text-grey has-text-weight-bold" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="weight2">4</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="score2" name="score2" class="form-control" onchange="calculateMarks2()">
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
                                        <td class="has-text-centered" data-label="Marks (W*S)" style="border: 1px solid #dbdbdb; align-content:center;" id="marks2">0</td>
                                        <input type="hidden" name="hiddenMarks2" id="hiddenMarks2">
                                    </tr>
                                     <tr>
                                        <td class="p-5" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7 has-text-grey">Writing</p>
                                            <p class="is-size-7 has-text-grey">(Summary based on references)</p>
                                        </td>
                                        <td class="has-text-centered has-text-grey has-text-weight-bold" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="weight3">4</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="score3" name="score3" class="form-control" onchange="calculateMarks3()">
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
                                        <td class="has-text-centered" data-label="Marks (W*S)" style="border: 1px solid #dbdbdb; align-content:center;" id="marks3">0</td>
                                        <input type="hidden" name="hiddenMarks3" id="hiddenMarks3">
                                    </tr>
                                    <tr>
                                        <td class="p-5" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-bold has-text-grey is-size-7">Total</p>
                                            <p class="is-size-7"></p>
                                        </td>
                                        <td class="has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                        <td class="has-text-centered" data-label="Marks (W*S)" style="border: 1px solid #dbdbdb; align-content:center;" id="totalMarks3">0</td>
                                        <input type="hidden" name="hiddenTotalMarks" id="hiddenTotalMarks">
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
                <button class="button" onclick="closeModal3()">Close</button>
            </footer>
    </div>
</div> 
                    
<div class="modal custom-modal" id="detailModal4">
    <div class="modal-background"></div>
    <div class="modal-card">
        <header class="modal-card-head">
            <p class="modal-card-title">Project Details</p>
            <button class="delete" aria-label="close" onclick="closeModal4()"></button>
        </header>
        <section class="modal-card-body">
            <!-- Content -->
            <div class="columns is-multiline">
                <form action="${pageContext.request.contextPath}/F4Servlet" method="post">
                    <input type="hidden" id="modalFormtId4" name="formtId4" value="">
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
                                            <p class="has-text-weight-semibold is-size-7">1. Design of the methodology</p>
                                            <p class="is-size-7 has-text-grey-dark">(Appropriate and comprehensible design of the methodology)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="weightA">3</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="scoreA" class="form-control" name="scoreA" onchange="calculateResultA()">
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
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="resultA" id="result1" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="hiddenResultA" id="hiddenResultA">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">2. Description</p>
                                            <p class="is-size-7 has-text-grey-dark">(Comprehensible and detailed description of each component in methodology)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="weightB">3</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="scoreB" class="form-control" name="scoreB" onchange="calculateResultB()">
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
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="resultB" id="result2" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="hiddenResultB" id="hiddenResultB">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">3. Model/Technique/Method </p>
                                            <p class="is-size-7 has-text-grey-dark">(Model/Technique/Method employed) </p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="weightC">4</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="scoreC" class="form-control" name="scoreC" onchange="calculateResultC()">
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
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="resultC" id="result3" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="hiddenResultC" id="hiddenResultC">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">Total Marks</p>
                                        </td>
                                        <td class="has-text-centered has-text-weight-bold" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                        <td class="has-text-centered has-text-weight-bold" data-label="Marks (W*S)" id="totalResult" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="hiddenTotalResult" id="hiddenTotalResult">
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
                <button class="button" onclick="closeModal4()">Close</button>
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
    function openModal3(formtId) {
            document.getElementById("detailModal3").classList.add("is-active");
            document.getElementById("modalFormtId3").value = formtId; // Set formtId to hidden input
        } 
    function openModal4(formtId) {
            document.getElementById("detailModal4").classList.add("is-active");
            document.getElementById("modalFormtId4").value = formtId; // Set formtId to hidden input
        }     

    // Function to close the modal
    function closeModal() {
        document.getElementById("detailModal").classList.remove("is-active");
    }
    
    function closeModal2() {
        document.getElementById("detailModal2").classList.remove("is-active");
    }
    
    function closeModal3() {
        document.getElementById("detailModal3").classList.remove("is-active");
    }
    
    function closeModal4() {
        document.getElementById("detailModal4").classList.remove("is-active");
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

    function updateTotalMarks() {
        let totalMarks = 0;
        for (let i = 1; i <= 3; i++) {
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
    function calculateMarks1() {
        let score1 = document.getElementById("score1").value;
        let hiddenMarks1 = document.getElementById("hiddenMarks1");
        let weight1 = document.getElementById("weight1").textContent;
        document.getElementById("marks1").textContent = parseInt(score1) * parseInt(weight1);
        hiddenMarks1.value = parseInt(score1) * parseInt(weight1);
        updateTotalMarks3();
    }

    function calculateMarks2() {
        let score2 = document.getElementById("score2").value;
        let hiddenMarks2 = document.getElementById("hiddenMarks2");
        let weight2 = document.getElementById("weight2").textContent;
        document.getElementById("marks2").textContent = parseInt(score2) * parseInt(weight2);
        hiddenMarks2.value = parseInt(score2) * parseInt(weight2);
        updateTotalMarks3();
    }

    function calculateMarks3() {
        let score3 = document.getElementById("score3").value;
        let hiddenMarks3 = document.getElementById("hiddenMarks3");
        let weight3 = document.getElementById("weight3").textContent;
        document.getElementById("marks3").textContent = parseInt(score3) * parseInt(weight3);
        hiddenMarks3.value = parseInt(score3) * parseInt(weight3);
        updateTotalMarks3();
    }

    function updateTotalMarks3() {
        let totalMarks3 = 0;
        for (let i = 1; i <= 3; i++) {
            let value = document.getElementById('marks' + i).textContent;
            totalMarks3 += parseInt(value);
        }
        document.getElementById("totalMarks3").textContent = totalMarks3;
        document.getElementById("hiddenTotalMarks").value = totalMarks3;
    }
    
    function calculateResultA() {
        let scoreA = document.getElementById("scoreA").value;
        let hiddenResultA = document.getElementById("hiddenResultA");
        let weightA = document.getElementById("weightA").textContent;
        document.getElementById("result1").textContent = parseInt(scoreA) * parseInt(weightA);
        hiddenResultA.value = parseInt(scoreA) * parseInt(weightA);
        updateTotalResult();
    }

    function calculateResultB() {
        let scoreB = document.getElementById("scoreB").value;
        let hiddenResultB = document.getElementById("hiddenResultB");
        let weightB = document.getElementById("weightB").textContent;
        document.getElementById("result2").textContent = parseInt(scoreB) * parseInt(weightB);
        hiddenResultB.value = parseInt(scoreB) * parseInt(weightB);
        updateTotalResult();
    }

    function calculateResultC() {
        let scoreC = document.getElementById("scoreC").value;
        let hiddenResultC = document.getElementById("hiddenResultC");
        let weightC = document.getElementById("weightC").textContent;
        document.getElementById("result3").textContent = parseInt(scoreC) * parseInt(weightC);
        hiddenResultC.value = parseInt(scoreC) * parseInt(weightC);
        updateTotalResult();
    }

    function updateTotalResult() {
        let totalResult = 0;
        for (let i = 1; i <= 3; i++) {
            let value = document.getElementById('result' + i).textContent;
            totalResult += parseInt(value);
        }
        document.getElementById("totalResult").textContent = totalResult;
        document.getElementById("hiddenTotalResult").value = totalResult;
    }
      </script>     
    </body>
</html>