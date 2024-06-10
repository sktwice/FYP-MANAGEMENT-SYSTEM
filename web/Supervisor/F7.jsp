<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height:100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/style.css">
        <style>
            .button.is-nav {
                background-color: #14161a;
                border-color: #fff;
                color: #fff;
            }
            .button.is-nav:hover,.button.nav.is-hovered {
                background-color: #a0e4d1;
                border-color: #14161a;
                color: #090a0c
            }
            .button.is-nav.is-outlined:hover,.button.is-nav.is-outlined.is-hovered,.button.is-custom.is-outlined:focus,.button.is-nav.is-outlined.is-focused {
                background-color: #fff;
                border-color: #fff;
                color: #090a0c
            }
        </style>
        <title>F4 Page</title>
    </head>
    <body style="height:100%;">
        <div class="is-flex is-justify-content-space-between is-mobile-visible">
            <div class=" is-mobile-visible p-2">
                <img src="./assets/uitm-logo.png" style="height:30px; width:60px;">
            </div>
            <button role="button" class="navbar-burger is-mobile-visible" data-target="navMenu" aria-label="menu" aria-expanded="false">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </button>
        </div>
        <div class="p-2 navbar-menu is-mobile-visible" id="navMenu" style="">
            <nav class="navbar" role="navigation" aria-label="dropdown navigation">
                <div class="navbar-item has-dropdown">
                    <div class="navbar-dropdown">
                        <a class="navbar-item p-4" href="./Lecturers/Dashboard-Lecturer.jsp">
                            <span class="fas fa-home pr-2"></span>
                            <span class="is-size-7" >Dashboard</span>
                        </a>
                        <a class="navbar-item p-4" href="./Lecturers/UserProfile-Lecturer.jsp">
                            <span class="fas fa-user pr-4"></span>
                            <span class="is-size-7" >Profile</span>
                        </a>
                        <a class="navbar-item p-4" href="./Lecturers/Report-Lecturer.jsp">
                            <span class="fas fa-inbox pr-4 is-size-7"></span>
                            <span class="is-size-7" >Reports</span>
                        </a>
                        <a class="navbar-item p-4" href="./FYP-MANAGEMENT-SYSTEM/Lecturers/Form-Lecturer.jsp">
                            <span class="fas fa-book pr-4 is-size-7"></span>
                            <span class="is-size-7" >Form</span>
                        </a>
                        <a class="navbar-item p-4" href="./Lecturers/Scope-Lecturer.jsp">
                            <span class="fas fa-book pr-4 is-size-7"></span>
                            <span class="is-size-7" >Scope</span>
                        </a>
                        <a class="navbar-item p-4" href="./Lecturers/StudentList-Supervision.jsp">
                            <span class="fas fa-circle-plus pr-4 is-size-7"></span>
                            <span class="is-size-7" >Supervision</span>
                        </a>
                        <a class="navbar-item p-4">
                            <span class="fas fa-arrow-right-from-bracket pr-4"></span>
                            <span class=" is-size-7" >Sign-out</span>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div class="columns m-0 p-0 h-100">
            <div class="p-2 column is-2 is-desktop-visible">
                <aside class="menu">
                  <p class="menu-label p-1 m-0">
                      <img src="./assets/uitm-logo.png" style="height:50px; width:142px;">
                  </p>
                  <ul class="menu-list">
                      <li class="py-1">
                          <a class="button is-nav navbar-item p-4" href="./Lecturers/Dashboard-Lecturer.jsp">
                            <span class="fas fa-home pr-2 is-size-7"></span>
                            <span class="is-size-7" >Dashboard</span>
                          </a>
                      </li>
                      <li class="py-1">
                          <a class="button is-nav navbar-item p-4" href="./Lecturers/UserProfile-Lecturer.jsp">
                            <span class="fas fa-user pr-4 is-size-7"></span>
                            <span class="is-size-7" >Profile</span>
                          </a>
                      </li>
                      <li class="py-1">
                          <a class="button is-nav navbar-item p-4" href="./Lecturers/Report-Lecturer.jsp">
                            <span class="fas fa-inbox pr-4 is-size-7"></span>
                            <span class="is-size-7" >Reports</span>
                          </a>
                      </li>
                      <li class="py-1">
                          <a class="button is-nav navbar-item p-4" href="./Lecturers/Form-Lecturer.jsp">
                              <span class="fas fa-file-pen pr-4 is-size-7"></span>
                                <span class="is-size-7">Form</span>
                          </a>
                      </li>
                      <li class="py-1">
                          <a class="button is-nav navbar-item p-4" href="./Lecturers/Scope-Lecturer.jsp">
                              <span class="fas fa-book pr-4 is-size-7"></span>
                              <span class="is-size-7" >Scope</span>
                          </a>
                      </li>
                      <li class="py-1">
                          <a class="button is-nav navbar-item p-4" href="./Lecturers/StudentList-Supervision.jsp">
                              <span class="fas fa-circle-plus pr-4 is-size-7"></span>
                              <span class="is-size-7">Supervision</span>
                          </a>
                      </li>
                      <li class="py-1">
                          <a class="button is-nav navbar-item p-4">
                              <span class="fas fa-arrow-right-from-bracket pr-4 is-size-7"></span>
                              <span class="is-size-7" >Sign-out</span>
                          </a>
                      </li>
                  </ul>
                </aside>
            </div>
            <div class="column px-6 py-4" style="background-color:#FFFFFF; overflow-y: scroll;">
                <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                        F7 - PROJECT FORMULATION PRESENTATION FORM
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
                            <label class="has-text-weight-semibold has-text-grey">Supervisor:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" placeholder="Supervisor" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="column is-2" style="align-content: center">
                             <label class="has-text-weight-semibold has-text-grey">Project Title:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" placeholder="Title" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="column is-2" style="align-content: center">
                             <label class="has-text-weight-semibold has-text-grey">Presentation Date:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="date" placeholder="Title" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                    </div>
                <div class="p-3">
                <table class="">
                    <thead>
                    <tr>
                        <th class="has-text-black has-text-centered" style="border: 1px solid #dbdbdb;">Assessment Criteria</th>
                        <th class="has-text-black has-text-centered" style="border: 1px solid #dbdbdb;">Weight (W)</th>
                        <th class="has-text-black has-text-centered" style="border: 1px solid #dbdbdb;">Score (s) [1-10] (refer to F7 rubric)</th>
                        <th class="has-text-black has-text-centered" style="border: 1px solid #dbdbdb;">Marks (W*S)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                            <p class="has-text-weight-semibold is-size-7">1. Depth of knowledge</p>
                            <p class="is-size-7">(Possess a clear understanding and able to explain the subject matter.)</p>
                        </td>
                        <td class="has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;">3</td>
                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                            <div class="dropdown is-hoverable">
                                <div class="dropdown-trigger">
                                    <button class="button is-white" style="border: 0.9px solid;" aria-haspopup="true" aria-controls="dropdown-menu3">
                                      <span class=" is-size-7">Score</span>
                                      <span class="icon is-small">
                                        <i class="fas fa-angle-down" aria-hidden="true"></i>
                                      </span>
                                    </button>
                                </div>
                                <div class="dropdown-menu is-size-7" id="dropdown-menu1" role="menu">
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
                        <td class="has-text-centered" data-label="Marks (W*S)" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                    </tr>
                    <tr>
                        <td class="" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                            <p class="has-text-weight-semibold is-size-7">2. Overall Organization of the Project Presentation </p>
                            <p class="is-size-7">(Exhibit/Present the project in a clear, engaging and appropriate form.)</p>
                        </td>
                        <td class="has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;">3</td>
                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                            <div class="dropdown is-hoverable">
                                <div class="dropdown-trigger">
                                    <button class="button is-white" style="border: 0.9px solid;" aria-haspopup="true" aria-controls="dropdown-menu3">
                                      <span class=" is-size-7">Score</span>
                                      <span class="icon is-small">
                                        <i class="fas fa-angle-down" aria-hidden="true"></i>
                                      </span>
                                    </button>
                                </div>
                                <div class="dropdown-menu is-size-7" id="dropdown-menu2" role="menu">
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
                        <td class="has-text-centered" data-label="Marks (W*S)" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                    </tr>
                    <tr>
                        <td class="" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                            <p class="has-text-weight-semibold is-size-7">3. Use Quality of Presentation Materials</p>
                            <p class="is-size-7">(Use several materials or media in presenting the project.)</p>
                        </td>
                        <td class="has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;">2</td>
                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                            <div class="dropdown is-hoverable">
                                <div class="dropdown-trigger">
                                    <button class="button is-white" style="border: 0.9px solid;" aria-haspopup="true" aria-controls="dropdown-menu3">
                                      <span class=" is-size-7">Score</span>
                                      <span class="icon is-small">
                                        <i class="fas fa-angle-down" aria-hidden="true"></i>
                                      </span>
                                    </button>
                                </div>
                                <div class="dropdown-menu is-size-7" id="dropdown-menu3" role="menu">
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
                        <td class="has-text-centered" data-label="Marks (W*S)" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                    </tr>
                    <tr>
                        <td class="" data-label="Assessment Criteria" style="border: 1px solid #dbdbdb;">
                            <p class="has-text-weight-semibold is-size-7">4. Delivery Skills</p>
                            <p class="is-size-7">(Proper language used, speak clearly, loudly and at appropriate pace, effective eye contact and presentable attitude.)</p>
                        </td>
                        <td class="has-text-centered" data-label="Weight (W)" style="border: 1px solid #dbdbdb; align-content:center;">3</td>
                        <td class="has-text-centered" data-label="Score (s) [1-10]" style="border: 1px solid #dbdbdb; align-content:center;">
                            <div class="dropdown is-hoverable">
                                <div class="dropdown-trigger">
                                    <button class="button is-white" style="border: 0.9px solid;" aria-haspopup="true" aria-controls="dropdown-menu3">
                                      <span class=" is-size-7">Score</span>
                                      <span class="icon is-small">
                                        <i class="fas fa-angle-down" aria-hidden="true"></i>
                                      </span>
                                    </button>
                                </div>
                                <div class="dropdown-menu is-size-7" id="dropdown-menu4" role="menu">
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
                        <td class="has-text-centered" data-label="Marks (W*S)" style="border: 1px solid #dbdbdb; align-content:center;"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="p-3">
                <div class="pb-3 has-text-weight-semibold">CSP600 - PROJECT FORMULATION PRESENTATION EVALUATION (F7) RUBRIC</div>
                <table class="">
                    <thead>
                    <tr class="has-background-grey" style="border-bottom: 2px solid #ddd;">
                        <th class="has-text-white is-size-7 has-text-centered" style="width:7%;">No</th>
                        <th class="has-text-white is-size-7 has-text-centered">Assessment Criteria</th>
                        <th class="has-text-white is-size-7 has-text-centered">Excellent (8-10)</th>
                        <th class="has-text-white is-size-7 has-text-centered">Good (6-7)</th>
                        <th class="has-text-white is-size-7 has-text-centered">Satisfactory (5)</th>
                        <th class="has-text-white is-size-7 has-text-centered">Poor (1-4)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="has-text-centered is-size-7 has-text-right-mobile" data-label="No">1</td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Assessment Criteria">Depth of Knowledge</td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Excellent (8-10)">
                            <ul>
                                <li>&bull; The presenter is clear and easily understood.</li>
                                <li>&bull; Shows depth of thought.</li>
                                <li>&bull; Able to answer questions in an intelligent manner.</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Good (6-7)">
                             <ul>
                                <li>&bull; The presenter shows depth of thought in some areas.</li>
                                <li>&bull; Mostly clear with little confusion in the presentation.</li>
                                <li>&bull; Able to answer questions.</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Satisfactory (5)">
                            <ul>
                                <li>&bull; The presenter shows some understanding of the subject matter but little depth.</li>
                                <li>&bull; Somewhat clear with some confusion in the presentation.</li>
                                <li>&bull; Able to answer some questions.</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Poor (1-4)">
                            <ul>
                                <li>&bull; The presenter shows a surface knowledge only.</li>
                                <li>&bull; Lack clarity and is confusing.</li>
                                <li>&bull; Unable to respond to questions.</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td class="has-text-centered is-size-7 has-text-right-mobile" data-label="No">2</td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Assessment Criteria">Overall Organization of The Project Presentation</td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Excellent (8-10)">
                            <ul>
                                <li>&bull; The presenter delivers an excellent presentation with a smooth flow and provides good explanations and/or elaboration.</li>
                                <li>&bull; Time is used wisely.</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Good (6-7)">
                             <ul>
                                <li>&bull; The presenter delivers a good presentation and provides explanation and/or elaboration.</li>
                                <li>&bull; Time is used wisely.</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Satisfactory (5)">
                            <ul>
                                <li>&bull; The presenter delivers a fair presentation and provides explanation and/or insufficient elaboration.</li>
                                <li>&bull; Time is fairly used..</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Poor (1-4)">
                            <ul>
                                <li>&bull; The presenter delivers a poor presentation there is no presentation flow.</li>
                                <li>&bull; Time limit is exceeded and/or the topics are not well covered.</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td class="has-text-centered is-size-7 has-text-right-mobile" data-label="No">3</td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Assessment Criteria">Use Variety of Presentation Materials</td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Excellent (8-10)">
                            <ul>
                                <li>&bull; There is a variety of materials/media used.</li>
                                <li>&bull; Presentation materials/media are of good quality and useful.</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Good (6-7)">
                             <ul>
                                <li>&bull; There is a variety of materials/media used.</li>
                                <li>&bull; Most of the presentation materials/media are of good quality.</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Satisfactory (5)">
                            <ul>
                                <li>&bull; There is a fair variety of materials/media used.</li>
                                <li>&bull; Materials/media are adequate with some questionable sources.</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Poor (1-4)">
                            <ul>
                                <li>&bull; There is little variety of materials/media used.</li>
                                <li>&bull; Materials/media are inadequate with many questionable sources.</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td class="has-text-centered is-size-7 has-text-right-mobile" data-label="No">4</td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Assessment Criteria">Delivery Skills</td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Excellent (8-10)">
                            <ul>
                                <li>&bull; The presenter speaks clearly and is audible to the audience.</li>
                                <li>&bull; Grammatical errors are insignificant and pronunciation is very good.</li>
                                <li>&bull; Excellent eye contact.</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Good (6-7)">
                             <ul>
                                <li>&bull; The presenter speaks clearly and is audible to most of the audience.</li>
                                <li>&bull; Relatively few grammatical errors and pronunciation is good.</li>
                                <li>&bull; Good eye contact.</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Satisfactory (5)">
                            <ul>
                                <li>&bull; The presenter speaks relatively clear, but may not be audible to the back audience.</li>
                                <li>&bull; Some grammatical errors and some mispronunciation.</li>
                                <li>&bull; Some eye contact.</li>
                            </ul>
                        </td>
                        <td class="is-size-7 has-text-right-mobile" data-label="Poor (1-4)">
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

    <script>
        document.addEventListener('DOMContentLoaded', () => {

      // Get all "navbar-burger" elements
      const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

      // Add a click event on each of them
      $navbarBurgers.forEach( el => {
        el.addEventListener('click', () => {

          // Get the target from the "data-target" attribute
          const target = el.dataset.target;
          const $target = document.getElementById(target);

          // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
          el.classList.toggle('is-active');
          $target.classList.toggle('is-active');

        });
      });

    });
    </script>
    </body>
</html>