<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="height:100%;">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <title>F8 – PROJECT FORMULATION REPORT EVALUATION FORM</title>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../supervisor-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column px-4 py-4" style="background-color:#FFFFFF; overflow-y: scroll;">
                    
                    <div class="has-text-weight-semibold has-text-grey is-size-5 p-4"
                         style="border-bottom: 1px solid #bdbdbd">
                        F8 – PROJECT FORMULATION REPORT EVALUATION FORM
                    </div>
                    <form action="${pageContext.request.contextPath}/F8SupervisorServlet" method="post">
                    <div class="columns is-multiline m-0 p-0">
                                <input type="hidden" id="studentId" name="studentId" value="${param.studentId}">
                                <input type="hidden" id="formtId" name="formtId" value="${param.formtId}">
                                <div class="column is-2" style="align-content: center">
                                    <label class="has-text-weight-semibold has-text-grey">Student Name:</label>
                                </div>
                                <div class="column is-10">
                                    <div class="py-2">
                                        <input class="px-4 py-2" type="text" value="${studentDetails.studentName}" placeholder="Full Name"
                                            style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;" readonly>
                                    </div>
                                </div>
                                <div class="column is-2" style="align-content: center">
                                    <label class="has-text-weight-semibold has-text-grey">Student ID:</label>
                                </div>
                                <div class="column is-10">
                                    <div class="py-2">
                                        <input class="px-4 py-2" type="text" value="${studentDetails.studentId}" placeholder="Student ID"
                                            style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;" readonly>
                                    </div>
                                </div>
                                <div class="column is-2" style="align-content: center">
                                    <label class="has-text-weight-semibold has-text-grey">Programme:</label>
                                </div>
                                <div class="column is-10">
                                    <div class="py-2">
                                        <input class="px-4 py-2" type="text" value="${studentDetails.program}" placeholder="Programme"
                                            style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;" readonly>
                                    </div>
                                </div>
                                <div class="column is-2" style="align-content: center">
                                    <label class="has-text-weight-semibold has-text-grey">Supervisor:</label>
                                </div>
                                <div class="column is-10">
                                    <div class="py-2">
                                        <input class="px-4 py-2" type="text" value="${studentDetails.supervisorName}" placeholder="Supervisor"
                                            style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;" readonly>
                                    </div>
                                </div>
                                <div class="column is-2" style="align-content: center">
                                    <label class="has-text-weight-semibold has-text-grey">Project Title:</label>
                                </div>
                                <div class="column is-10">
                                    <div class="py-2">
                                        <input class="px-4 py-2" type="text" value="${studentDetails.projectTitle}" placeholder="Title"
                                            style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;" readonly>
                                    </div>
                                </div>
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
                                <input class="px-4 py-2" type="text" placeholder="Your comment" name="comment" id="comment"
                                       style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                            </div>
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
                                        <td class="has-text-centered has-text-grey has-text-weight-bold" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT1">3</td>
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
                                            <p class="has-text-weight-semibold is-size-7">2. Objectives</p>
                                            <p class="is-size-7">(Clear, measurable and achievable.)</p>
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
                                            <p class="has-text-weight-semibold is-size-7">3. Significance of the Study</p>
                                            <p class="is-size-7">(Relevant to the community and practitioners.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT3">1</td>
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
                                            <p class="has-text-weight-semibold is-size-7">4. Literature Review</p>
                                            <p class="is-size-7">(Able to identify, collect, summarize and analyze relevant and latest issues of subject matter.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT4">5</td>
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
                                            <p class="has-text-weight-semibold is-size-7">5. Project Methodology</p>
                                            <p class="is-size-7">(Appropriate approach, methods, sources and deliverable in accomplishing the project.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT5">6</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="t5" class="form-control" name="t5" onchange="getDataT5()">
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
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueT5" id="valueT5" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="data5" id="data5">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">6. Presentation of the Report</p>
                                            <p class="is-size-7">(Follow the given guidelines, consistency of the contents, clarity, and language of the report, contain valid references and citations.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT6">3</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="t6" class="form-control" name="t6" onchange="getDataT6()">
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
                                        <td class="has-text-centered" data-label="Marks (W*S)" anme="valueT6" id="valueT6" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="data6" id="data6">
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">7. Progress Evaluation</p>
                                            <p class="is-size-7">(This may include supervisory meetings (Project In-Progress Form- F3), supervisory independency, responsibilities, commitment, maturity, etc.) </p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT7">2</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                                            <select id="t7" class="form-control" name="t7" onchange="getDataT7()">
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
                                        <td class="has-text-centered" data-label="Marks (W*S)" name="valueT7" id="valueT7" style="border: 1px solid #dbdbdb; align-content:center;">0</td>
                                        <input type="hidden" name="data7" id="data7">
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
                        <!--                        rubric-->
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
                            <div class="is-flex is-justify-content-space-between p-4">
                                <a class="button is-custom2" href="Form-Lecturer.jsp"><span
                                        class="has-text-weight-semibold is-size-7">Back</span></a>
<!--                                <a class="button is-custom4"><span
                                        class="has-text-weight-semibold is-size-7" type="submit" >Submit</span></a>-->
                                <button class="button is-primary" type="submit">Submit</button>
                            </div>
                        </div>
                    </div>
                </form>
                </div>
            </div>
        </div>
            <script>
    function getDataT1() {
        let scoreT1 = document.getElementById("t1").value;
        let data1 = document.getElementById("data1");
        let weightT1 = document.getElementById("wT1").textContent;
        document.getElementById("valueT1").textContent = parseInt(scoreT1) * parseInt(weightT1);
        data1.value= parseInt(scoreT1) * parseInt(weightT1);
        updateTotalMarks();
    }

    function getDataT2() {
        let scoreT2 = document.getElementById("t2").value;
        let data2 = document.getElementById("data2");
        let weightT2 = document.getElementById("wT2").textContent;
        document.getElementById("valueT2").textContent = parseInt(scoreT2) * parseInt(weightT2);
        data2.value= parseInt(scoreT2) * parseInt(weightT2);
        updateTotalMarks();
    }

    function getDataT3() {
        let scoreT3 = document.getElementById("t3").value;
        let data3 = document.getElementById("data3");
        let weightT3 = document.getElementById("wT3").textContent;
        document.getElementById("valueT3").textContent = parseInt(scoreT3) * parseInt(weightT3);
        data3.value= parseInt(scoreT3) * parseInt(weightT3);
        updateTotalMarks();
    }

    function getDataT4() {
        let scoreT4 = document.getElementById("t4").value;
        let data4=document.getElementById("data4");
        let weightT4 = document.getElementById("wT4").textContent;
        document.getElementById("valueT4").textContent = parseInt(scoreT4) * parseInt(weightT4);
        data4.value= parseInt(scoreT4) * parseInt(weightT4);
        updateTotalMarks();
    }

    function getDataT5() {
        let scoreT5 = document.getElementById("t5").value;
        let data5=document.getElementById("data5");
        let weightT5 = document.getElementById("wT5").textContent;
        document.getElementById("valueT5").textContent = parseInt(scoreT5) * parseInt(weightT5);
        data5.value= parseInt(scoreT5) * parseInt(weightT5);
        updateTotalMarks();
    }

    function getDataT6() {
        let scoreT6 = document.getElementById("t6").value;
        let data6=document.getElementById("data6");
        let weightT6 = document.getElementById("wT6").textContent;
        document.getElementById("valueT6").textContent = parseInt(scoreT6) * parseInt(weightT6);
        data6.value= parseInt(scoreT6) * parseInt(weightT6);
        updateTotalMarks();
    }

    function getDataT7() {
        let scoreT7 = document.getElementById("t7").value;
        let data7 = document.getElementById("data7");
        let weightT7 = document.getElementById("wT7").textContent;
        document.getElementById("valueT7").textContent = parseInt(scoreT7) * parseInt(weightT7);
        data7.value= parseInt(scoreT7) * parseInt(weightT7);
        updateTotalMarks();
    }
//
//    function getDataT8() {
//        let scoreT8 = document.getElementById("t8").value;
//        let weightT8 = document.getElementById("wT8").textContent;
//        document.getElementById("valueT8").textContent = parseInt(scoreT8) * parseInt(weightT8);
//        updateTotalMarks();
//    }
//
//    function getDataT9() {
//        let scoreT9 = document.getElementById("t9").value;
//        let weightT9 = document.getElementById("wT9").textContent;
//        document.getElementById("valueT9").textContent = parseInt(scoreT9) * parseInt(weightT9);
//        updateTotalMarks();
//    }

    function updateTotalMarks() {
        let totalMarks = 0;
        let equal=0;
        for (let i = 1; i <= 7; i++) {
            console.log(i);
            let value = document.getElementById('valueT' + i).textContent;
            totalMarks += parseInt(value);

        }
        document.getElementById("totalMarks").textContent = totalMarks;
        document.getElementById("equal").value=totalMarks;
    }
</script>
    </body>

</html>