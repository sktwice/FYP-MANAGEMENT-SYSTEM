<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
<body style="height:100%;">
    <div class="is-flex is-justify-content-space-between is-mobile-visible">
        <div class=" is-mobile-visible p-2">
            <img src="assets/uitm-logo.png" style="height:30px; width:60px;">
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
                <a class="navbar-item p-4 is-size-7" href="Admin/Dashboard-Admin.jsp">
                    <span class="has-text-white fas fa-home pr-2"></span>
                    <span class="has-text-white is-size-7" >Dashboard</span>
                </a>
                <a class="navbar-item p-4 is-size-7" href="Admin/UserProfile-Admin.jsp">
                    <span class="has-text-white fas fa-user pr-4"></span>
                    <span class="has-text-white is-size-7" >Profile</span>
                </a>
                <a class="navbar-item p-4 is-size-7" href="Admin/Report-Admin.jsp">
                    <span class="has-text-white fas fa-inbox pr-4"></span>
                    <span class="has-text-white is-size-7" >Reports</span>
                </a>
                <a class="navbar-item p-4 is-size-7" href="Admin/Guidline-Admin.jsp">
                    <span class="has-text-white fas fa-circle-info pr-4"></span>
                    <span class="has-text-white" >Guideline</span>
                </a>
                <a class="navbar-item p-4 is-size-7" href="Admin/Scope-Admin.jsp">
                    <span class="has-text-white fas fa-book pr-4"></span>
                    <span class="has-text-white is-size-7" >Scope</span>
                </a>
                <a class="navbar-item p-4 is-size-7">
                    <span class="has-text-white fas fa-circle-plus pr-4"></span>
                    <span class="has-text-white is-size-7" >Supervision</span>
                </a>
                <a class="navbar-item is-size-7 p-4">
                    <span class="has-text-white fas fa-arrow-right-from-bracket pr-4"></span>
                    <span class="has-text-white" >Sign-out</span>
                </a>
            </div>
        </div>
    </nav>
</div>
<div class="columns m-0 p-0 h-100">
    <div class="p-2 column is-2 is-desktop-visible">
        <aside class="menu">
          <p class="menu-label pt-2 pl-3 pr-4 m-0">
              <img src="assets/uitm-logo.png">
          </p>
          <ul class="menu-list">
              <li>
                  <a class="navbar-item p-4 is-size-7" href="Admin/Dashboard-Admin.jsp">
                    <span class="has-text-white fas fa-home pr-2"></span>
                    <span class="has-text-white is-size-7" >Dashboard</span>
                  </a>
              </li>
              <li>
                  <a class="navbar-item p-4 is-size-7" href="Admin/UserProfile-Admin.jsp">
                    <span class="has-text-white fas fa-user pr-4"></span>
                    <span class="has-text-white is-size-7" >Profile</span>
                  </a>
              </li>
              <li>
                  <a class="navbar-item p-4 is-size-7" href="Admin/Report-Admin.jsp">
                    <span class="has-text-white fas fa-inbox pr-4"></span>
                    <span class="has-text-white is-size-7" >Reports</span>
                  </a>
              </li>
              <li>
                  <a class="navbar-item p-4 is-size-7" href="Admin/Guidline-Admin.jsp">
                      <span class="has-text-white fas fa-circle-info pr-4"></span>
                      <span class="has-text-white" >Guideline</span>
                  </a>
              </li>
              <li>
                  <a class="navbar-item p-4 is-size-7" href="Admin/Scope-Admin.jsp">
                      <span class="has-text-white fas fa-book pr-4"></span>
                      <span class="has-text-white " >Scope</span>
                  </a>
              </li>
              <li>
                  <a class="navbar-item p-4 is-size-7" href="Admin/StudentList-Supervision-Admin.jsp">
                      <span class="has-text-white fas fa-circle-plus pr-4"></span>
                      <span class="has-text-white" >Supervision</span>
                  </a>
              </li>
              <li>
                  <a class="navbar-item p-4 is-size-7">
                      <span class="has-text-white fas fa-arrow-right-from-bracket pr-4"></span>
                      <span class="has-text-white is-size-7" >Sign-out</span>
                  </a>
              </li>
          </ul>
        </aside>
    </div>
    <div class="column h-100 p-5" style="background-color:#FFFFFF;">
        <div class="custom-border p-6 w-100">
            <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                <div>
                    <label class="has-text-weight-semibold has-text-grey-dark is-size-5" style=" border-bottom :2px solid #ebebeb;">Lecturer Form</label>
                </div>
            </div>
            <div class="">
                <div class="columns m-0 p-0 is-multiline">
                    <div class="column is-3" style="align-content: center;">
                        <label class="">Name:</label>
                    </div>
                    <div class="column is-9">
                        <input class="custom-input px-4 py-2" type="text" placeholder="Full Name">
                    </div>
                    <div class="column is-3" style="align-content: center;">
                        <label class="">Staff ID</label>
                    </div>
                    <div class="column is-9">
                        <input class="custom-input px-4 py-2" type="text" placeholder="Staff ID">
                    </div>
                    <div class="column is-3" style="align-content: center;">
                        <label class="">Email</label>
                    </div>
                    <div class="column is-9">
                        <input class="custom-input px-4 py-2" type="email" placeholder="@uitm.edu.my">
                    </div>
                    <div class="column is-3" style="align-content: center;">
                        <label class="">Position</label>
                    </div>
                    <div class="column is-9">
                        <input class="custom-input px-4 py-2" type="text" placeholder="Position">
                    </div>
                    <div class="column is-3" style="align-content: center;">
                        <label class="">Phone Number</label>
                    </div>
                    <div class="column is-9">
                        <input class="custom-input px-4 py-2" type="email" placeholder="01x-xxxxxxxx">
                    </div>
                    <div class="column is-3" style="align-content: center;">
                        <label class="">Course</label>
                    </div>
                    <div class="column is-9">
                        <input class="custom-input px-4 py-2" type="text" placeholder="Course Name">
                    </div>
                    <div class="column is-3" style="align-content: center;">
                        <label class="">Username</label>
                    </div>
                    <div class="column is-9">
                        <input class="custom-input px-4 py-2" type="text" placeholder="Username">
                    </div>
                    <div class="column is-3" style="align-content: center;">
                        <label class="">Password</label>
                    </div>
                    <div class="column is-9">
                        <input class="custom-input px-4 py-2" type="password" placeholder="Password">
                    </div>
                </div>
            </div>
            <div class="is-flex is-justify-content-space-between pt-4">
                    <button class="button is-custom2"><span class="has-text-weight-semibold is-size-7">Back</span></button>
                    <button class="button is-custom"><span class="has-text-weight-semibold is-size-7">Save Changes</span></button>
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