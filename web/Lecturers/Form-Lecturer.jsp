<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/style.css">
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
</head>
<body style="height:100%;">
    <div class="is-flex is-justify-content-space-between is-mobile-visible">
        <div class=" is-mobile-visible p-2">
            <img src="../assets/uitm-logo.png" style="height:30px; width:60px;">
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
                    <a class="box has-text-black navbar-item p-4 m-0" style="background-color: #a0e4d1;">
                        <span class="fas fa-home pr-2"></span>
                        <span class="is-size-7">Dashboard</span>
                    </a>
                    <a class="navbar-item p-4" href="../Lecturers/UserProfile-Lecturer.jsp">
                        <span class="fas fa-user pr-4"></span>
                        <span class="is-size-7">Profile</span>
                    </a>
                    <a class="navbar-item p-4" href="../Lecturers/Report-Lecturer.jsp">
                        <span class="fas fa-inbox pr-4 is-size-7"></span>
                        <span class="is-size-7">Reports</span>
                    </a>
                    <a class="navbar-item p-4" href="../Lecturers/Form-Lecturer.jsp">
                        <span class="fas fa-book pr-4 is-size-7"></span>
                        <span class="is-size-7">Form</span>
                    </a>
                    <a class="navbar-item p-4" href="../Lecturers/Scope-Lecturer.jsp">
                        <span class="fas fa-book pr-4 is-size-7"></span>
                        <span class="is-size-7">Scope</span>
                    </a>
                    <a class="navbar-item p-4" href="../Lecturers/StudentList-Supervision.jsp">
                        <span class="fas fa-circle-plus pr-4 is-size-7"></span>
                        <span class="is-size-7">Supervision</span>
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
              <img src="../assets/uitm-logo.png" style="height:50px; width:142px;">
          </p>
          <ul class="menu-list">
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4" href="../Lecturers/Dashboard-Lecturer.jsp">
                    <span class="fas fa-home pr-2 is-size-7"></span>
                    <span class="is-size-7">Dashboard</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4" href="../Lecturers/UserProfile-Lecturer.jsp">
                    <span class="fas fa-user pr-4 is-size-7"></span>
                    <span class="is-size-7">Profile</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4" href="../Lecturers/Report-Lecturer.jsp">
                    <span class="fas fa-inbox pr-4 is-size-7"></span>
                    <span class="is-size-7">Reports</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="box has-text-black navbar-item p-4" style="background-color: #a0e4d1;">
                      <span class="fas fa-file-pen pr-4 is-size-7"></span>
                        <span class="is-size-7">Form</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4" href="../Lecturers/Scope-Lecturer.jsp">
                      <span class="fas fa-book pr-4"></span>
                      <span class="is-size-7">Scope</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4" href="../Lecturers/StudentList-Supervision.jsp">
                      <span class="fas fa-circle-plus pr-4 is-size-7"></span>
                      <span class="is-size-7">Supervision</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4">
                      <span class="fas fa-arrow-right-from-bracket pr-4 is-size-7"></span>
                      <span class="is-size-7">Sign-out</span>
                  </a>
              </li>
          </ul>
        </aside>
    </div>
    <div class="column h-100 p-6" style="background-color:#FFFFFF; overflow-y: scroll;">
        <div class="custom-border p-6 w-100">
            <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                <div>
                    <label class="has-text-weight-bold has-text-grey is-size-5">Forms</label>
                    <p class="has-text-grey-light is-size-7">More than 7 forms</p>
                </div>
                <button class="button is-custom" style="height:2rem;">
                    <span class="is-size-7">Create</span>
                </button>
                </div>
            <div class="has-background-grey-lighter w-100 mb-4" style="border-radius: 6px;">
                <div class="has-text-white is-size-7 has-text-weight-semibold p-3">Refer to the rubric below</div>
            </div>
            <div class="p-3">
                <div class="is-flex is-justify-content-space-between pb-2">
                    <label class="has-text-weight-semibold has-text-grey is-size-5">F2 - PROJECT MOTIVATION EVALUATION RUBRIC</label>
                    <a class="button is-custom3" href="../Lecturers/F2-ProjectMotivationEvaluationForm.jsp">
                        <span class="is-size-7 p-1">Open</span>
                        <span class="is-size-7 fas fa-arrow-up-right-from-square"></span>
                    </a>
                </div>
            </div>
            <div class="p-3">
                <div class="is-flex is-justify-content-space-between pb-2">
                    <label class="has-text-weight-semibold has-text-grey is-size-5">F3 - LITERATURE REVIEW EVALUATION RUBRIC</label>
                    <a class="button is-custom3" href="../Lecturers/F3-LiteratureReviewEvaluationForm.jsp">
                        <span class="is-size-7 p-1">Open</span>
                        <span class="is-size-7 fas fa-arrow-up-right-from-square"></span>
                    </a>
                </div>
            </div>
            <div class="p-3">
                <div class="is-flex is-justify-content-space-between pb-2">
                    <label class="has-text-weight-semibold has-text-grey is-size-5">F4 - METHODOLOGY EVALUATION FORM</label>
                    <a class="button is-custom3" href="../Lecturers/F4-MethodologyEvaluationForm.jsp">
                        <span class="is-size-7 p-1">Open</span>
                        <span class="is-size-7 fas fa-arrow-up-right-from-square"></span>
                    </a>
                </div>
            </div>
            <div class="p-3">
                <div class="is-flex is-justify-content-space-between pb-2">
                    <label class="has-text-weight-semibold has-text-grey is-size-5">F7 - PROJECT FORMULATION PRESENTATION EVALUATION</label>
                    <a class="button is-custom3" href="../Lecturers/F7-Project-Formulation-Presentation-Form-Lecturer.jsp">
                        <span class="is-size-7 p-1">Open</span>
                        <span class="is-size-7 fas fa-arrow-up-right-from-square"></span>
                    </a>
                </div>
            </div>
            <div class="p-3">
                <div class="is-flex is-justify-content-space-between pb-2">
                    <label class="has-text-weight-semibold has-text-grey is-size-5">F8 - PROJECT FORMULATION REPORT EVALUATION</label>
                    <a class="button is-custom3" href="../Lecturers/F8-Project-Formulation-Report-Evaluation-Form-Lecturer.jsp">
                        <span class="is-size-7 p-1">Open</span>
                        <span class="is-size-7 fas fa-arrow-up-right-from-square"></span>
                    </a>
                </div>
            </div>
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