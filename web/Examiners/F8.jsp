<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html style="height:100%;">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="../css/style.css">
        <title>F8 – PROJECT FORMULATION REPORT EVALUATION FORM</title>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../examiner-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column px-4 py-4" style="background-color:#FFFFFF; overflow-y: scroll;">
                    <div class="has-text-weight-semibold has-text-grey is-size-5 p-4"
                         style="border-bottom: 1px solid #bdbdbd">
                        F8 – PROJECT FORMULATION REPORT EVALUATION FORM
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
                            <label class="has-text-weight-semibold has-text-grey">Supervisor:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" placeholder="Supervisor"
                                       style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="column is-2" style="align-content: center">
                            <label class="has-text-weight-semibold has-text-grey">Project Title:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" placeholder="Title"
                                       style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="column is-2" style="align-content: center">
                            <label class="has-text-weight-semibold has-text-grey">Handover Date :</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="date" placeholder=""
                                       style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                    </div>
                    <div class="p-3">
                        <div class="is-flex is-justify-content-space-between py-4">
                            <table class="">
                                <thead>
                                    <tr>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered"
                                            style="border: 1px solid #dbdbdb;">Assessment Criteria</th>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered"
                                            style="border: 1px solid #dbdbdb;">Weight (W)</th>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered"
                                            style="border: 1px solid #dbdbdb;">Score (s) [1-10] (refer to F7
                                            rubric)</th>
                                        <th class="has-text-grey-dark has-text-weight-bold has-text-centered"
                                            style="border: 1px solid #dbdbdb;">Marks (W*S)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="p-5" data-label="Assessment Criteria"
                                            style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7 has-text-grey">1.
                                                Project Background and Problem</p>
                                            <p class="is-size-7 has-text-grey">(Appropriate working title,
                                                clear problem statement, well-defined project scope.)</p>
                                        </td>
                                        <td class="has-text-centered has-text-grey has-text-weight-bold"
                                            data-label="Weight (W)"
                                            style="border: 1px solid #dbdbdb; align-content:center;">3</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]"
                                            style="border: 1px solid #dbdbdb; align-content:center;">
                                            <div class="dropdown is-hoverable">
                                                <div class="dropdown-trigger">
                                                    <button class="button is-white"
                                                            style="border: 0.9px solid;" aria-haspopup="true"
                                                            aria-controls="dropdown-menu3">
                                                        <span class=" is-size-7">Score</span>
                                                        <span class="icon is-small">
                                                            <i class="fas fa-angle-down"
                                                               aria-hidden="true"></i>
                                                        </span>
                                                    </button>
                                                </div>
                                                <div class="dropdown-menu is-size-7" id="dropdown-menu1"
                                                     role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item is-size-7"> 1 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 2 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 3 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 4 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 5 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 6 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 7 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 8 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 9 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 10 </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)"
                                            style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                    </tr>
                                    <tr>
                                        <td class=" p-5 has-text-grey" data-label="Assessment Criteria"
                                            style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">2. Objectives</p>
                                            <p class="is-size-7">(Clear, measurable and achievable.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered"
                                            data-label="Weight (W)"
                                            style="border: 1px solid #dbdbdb; align-content:center;">2</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]"
                                            style="border: 1px solid #dbdbdb; align-content:center;">
                                            <div class="dropdown is-hoverable">
                                                <div class="dropdown-trigger">
                                                    <button class="button is-white"
                                                            style="border: 0.9px solid;" aria-haspopup="true"
                                                            aria-controls="dropdown-menu3">
                                                        <span class=" is-size-7">Score</span>
                                                        <span class="icon is-small">
                                                            <i class="fas fa-angle-down"
                                                               aria-hidden="true"></i>
                                                        </span>
                                                    </button>
                                                </div>
                                                <div class="dropdown-menu is-size-7" id="dropdown-menu2"
                                                     role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item is-size-7"> 1 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 2 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 3 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 4 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 5 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 6 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 7 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 8 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 9 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 10 </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)"
                                            style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria"
                                            style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">3. Significance of
                                                the Study</p>
                                            <p class="is-size-7">(Relevant to the community and
                                                practitioners.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered"
                                            data-label="Weight (W)"
                                            style="border: 1px solid #dbdbdb; align-content:center;">1</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]"
                                            style="border: 1px solid #dbdbdb; align-content:center;">
                                            <div class="dropdown is-hoverable">
                                                <div class="dropdown-trigger">
                                                    <button class="button is-white"
                                                            style="border: 0.9px solid;" aria-haspopup="true"
                                                            aria-controls="dropdown-menu3">
                                                        <span class=" is-size-7">Score</span>
                                                        <span class="icon is-small">
                                                            <i class="fas fa-angle-down"
                                                               aria-hidden="true"></i>
                                                        </span>
                                                    </button>
                                                </div>
                                                <div class="dropdown-menu is-size-7" id="dropdown-menu3"
                                                     role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item is-size-7"> 1 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 2 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 3 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 4 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 5 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 6 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 7 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 8 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 9 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 10 </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)"
                                            style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria"
                                            style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">4. Literature
                                                Review</p>
                                            <p class="is-size-7">(Able to identify, collect, summarize and
                                                analyze relevant and latest issues of subject matter.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered"
                                            data-label="Weight (W)"
                                            style="border: 1px solid #dbdbdb; align-content:center;">5</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]"
                                            style="border: 1px solid #dbdbdb; align-content:center;">
                                            <div class="dropdown is-hoverable">
                                                <div class="dropdown-trigger">
                                                    <button class="button is-white"
                                                            style="border: 0.9px solid;" aria-haspopup="true"
                                                            aria-controls="dropdown-menu3">
                                                        <span class=" is-size-7">Score</span>
                                                        <span class="icon is-small">
                                                            <i class="fas fa-angle-down"
                                                               aria-hidden="true"></i>
                                                        </span>
                                                    </button>
                                                </div>
                                                <div class="dropdown-menu is-size-7" id="dropdown-menu4"
                                                     role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item is-size-7"> 1 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 2 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 3 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 4 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 5 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 6 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 7 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 8 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 9 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 10 </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)"
                                            style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria"
                                            style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">5. Project
                                                Methodology</p>
                                            <p class="is-size-7">(Appropriate approach, methods, sources and
                                                deliverable in accomplishing the project.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered"
                                            data-label="Weight (W)"
                                            style="border: 1px solid #dbdbdb; align-content:center;">6</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]"
                                            style="border: 1px solid #dbdbdb; align-content:center;">
                                            <div class="dropdown is-hoverable">
                                                <div class="dropdown-trigger">
                                                    <button class="button is-white"
                                                            style="border: 0.9px solid;" aria-haspopup="true"
                                                            aria-controls="dropdown-menu3">
                                                        <span class=" is-size-7">Score</span>
                                                        <span class="icon is-small">
                                                            <i class="fas fa-angle-down"
                                                               aria-hidden="true"></i>
                                                        </span>
                                                    </button>
                                                </div>
                                                <div class="dropdown-menu is-size-7" id="dropdown-menu1"
                                                     role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item is-size-7"> 1 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 2 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 3 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 4 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 5 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 6 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 7 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 8 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 9 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 10 </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)"
                                            style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria"
                                            style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">6. Presentation of
                                                the Report</p>
                                            <p class="is-size-7">(Follow the given guidelines, consistency
                                                of the contents, clarity, and language of the report,
                                                contain valid references and citations.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered"
                                            data-label="Weight (W)"
                                            style="border: 1px solid #dbdbdb; align-content:center;">3</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]"
                                            style="border: 1px solid #dbdbdb; align-content:center;">
                                            <div class="dropdown is-hoverable">
                                                <div class="dropdown-trigger">
                                                    <button class="button is-white"
                                                            style="border: 0.9px solid;" aria-haspopup="true"
                                                            aria-controls="dropdown-menu3">
                                                        <span class=" is-size-7">Score</span>
                                                        <span class="icon is-small">
                                                            <i class="fas fa-angle-down"
                                                               aria-hidden="true"></i>
                                                        </span>
                                                    </button>
                                                </div>
                                                <div class="dropdown-menu is-size-7" id="dropdown-menu2"
                                                     role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item is-size-7"> 1 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 2 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 3 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 4 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 5 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 6 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 7 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 8 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 9 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 10 </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)"
                                            style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 has-text-grey" data-label="Assessment Criteria"
                                            style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-semibold is-size-7">7. Progress
                                                Evaluation</p>
                                            <p class="is-size-7">(Supervisor Only)(This may include
                                                supervisory meetings (Project In-Progress Form- F3),
                                                supervisory independency, responsibilities, commitment,
                                                maturity, etc.)</p>
                                        </td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered"
                                            data-label="Weight (W)"
                                            style="border: 1px solid #dbdbdb; align-content:center;">2</td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]"
                                            style="border: 1px solid #dbdbdb; align-content:center;">
                                            <div class="dropdown is-hoverable">
                                                <div class="dropdown-trigger">
                                                    <button class="button is-white"
                                                            style="border: 0.9px solid;" aria-haspopup="true"
                                                            aria-controls="dropdown-menu3">
                                                        <span class=" is-size-7">Score</span>
                                                        <span class="icon is-small">
                                                            <i class="fas fa-angle-down"
                                                               aria-hidden="true"></i>
                                                        </span>
                                                    </button>
                                                </div>
                                                <div class="dropdown-menu is-size-7" id="dropdown-menu3"
                                                     role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item is-size-7"> 1 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 2 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 3 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 4 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 5 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 6 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 7 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 8 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 9 </a>
                                                        <a href="#" class="dropdown-item is-size-7"> 10 </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)"
                                            style="border: 1px solid #dbdbdb; align-content:center;"></td>
                                    </tr>
                                    <tr>
                                        <td class="p-5" data-label="Assessment Criteria"
                                            style="border: 1px solid #dbdbdb;">
                                            <p class="has-text-weight-bold has-text-grey-dark is-size-7">
                                                Total</p>
                                            <p class="is-size-7"></p>
                                        </td>
                                        <td class="has-text-centered" data-label="Weight (W)"
                                            style="border: 1px solid #dbdbdb; align-content:center;"> </td>
                                        <td class="has-text-centered" data-label="Score (s) [1-10]"
                                            style="border: 1px solid #dbdbdb; align-content:center;">

                                        </td>
                                        <td class="has-text-centered" data-label="Marks (W*S)"
                                            style="border: 1px solid #dbdbdb; align-content:center;"></td>
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
                                <a class="button is-custom2" href="Form.jsp"><span
                                        class="has-text-weight-semibold is-size-7">Back</span></a>
                                <a class="button is-custom4" href="Form.jsp" onclick="showSaveMessage(event)"> <span 
                                        class="has-text-weight-semibold is-size-7">Save Changes</span> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <a class="button is-custom4" href="Form.jsp" onclick="showSaveMessage(event)">
            <span class="has-text-weight-semibold is-size-7">Save Changes</span>
        </a>

        <script>
            function showSaveMessage(event) {
                event.preventDefault(); // Prevent the default action of the link
                alert('Changes have been saved');
                window.location.href = 'Form.jsp'; // Redirect to the Form.jsp page after the alert
            }
        </script>
    </body>

</html>