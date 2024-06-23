<%-- 
    Document   : F4-Methodology Evaluation Form
    Created on : 28 May 2024, 3:57:48 pm
    Author     : sarahyasmin
--%>

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
        <title>F4 Methodology Evaluation Form</title>
    </head>
    <body style="height:100%;">
        <div class="content-wrapper">
            <jsp:include page="../lecturer-sidebar.jsp"></jsp:include> 
                
            <div class="main-content">
                <div class="column px-4 py-4" style="background-color:#FFFFFF; overflow-y: scroll;">
                    <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                        F4 - METHODOLOGY EVALUATION FORM
                    </div>
                    <form action="${pageContext.request.contextPath}/F4Servlet" method="post">
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
                            </div>
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
                                     <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">2. Description</p>
                                            <p class="is-size-7 has-text-grey-dark">(Comprehensible and detailed description of each component in methodology)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT2">3</td>
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
                                            <p class="has-text-weight-semibold is-size-7">3. Model/Technique/Method </p>
                                            <p class="is-size-7 has-text-grey-dark">(Model/Technique/Method employed) </p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;" id="wT3">4</td>
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
                        <!-- Start Rubric Jangan Usik!! -->
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
                        <div class="is-flex is-justify-content-space-between p-4">
                            <a class="button is-custom2" href="Form-Lecturer.jsp"><span class="has-text-weight-semibold is-size-7">Back</span></a>
                            <!<!-- comment <a class="button is-custom" href="Form-Lecturer.jsp"><span class="has-text-weight-semibold is-size-7">Save Changes</span></a>-->
                            <button class="button is-primary" type="submit">Submit</button>
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
</script>

    </body>
</html>

