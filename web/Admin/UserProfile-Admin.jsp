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
                    <a class="navbar-item p-4" href="../Admin/Dashboard-Admin.jsp">
                        <span class="fas fa-home pr-2"></span>
                        <span class="is-size-7" >Dashboard</span>
                    </a>
                    <a class="box has-text-black navbar-item p-4 m-0" style="background-color: #a0e4d1;">
                        <span class="fas fa-user pr-4"></span>
                        <span class="is-size-7" >Profile</span>
                    </a>
                    <a class="navbar-item p-4" href="../Admin/Report-Admin.jsp">
                        <span class="fas fa-book-open pr-4 is-size-7"></span>
                        <span class="is-size-7" >Reports</span>
                    </a>
                    <a class="navbar-item p-4" href="../Admin/ListOfLecturer.jsp">
                        <span class="fas fa-users-viewfinder pr-4 is-size-7"></span>
                        <span class="is-size-7" >Lecturer</span>
                    </a>
                    <a class="navbar-item p-4" href="../Admin/Examiner-List.jsp">
                        <span class="fas fa-user-tie pr-4 is-size-7"></span>
                        <span class="is-size-7" >Examiner</span>
                    </a>
                    <a class="navbar-item p-4" href="../Admin/Student-List.jsp">
                        <span class="fas fa-user-graduate pr-4 is-size-7"></span>
                        <span class="is-size-7" >Students</span>
                    </a> 
                    <a class="navbar-item p-4" href="../Admin/Scope-Admin.jsp">
                        <span class="fas fa-book pr-4 is-size-7"></span>
                        <span class="is-size-7" >Scope</span>
                    </a>
                    <a class="navbar-item p-4" href="../Admin/StudenList-Supervision-Admin.jsp">
                        <span class="fas fa-bullseye pr-4 is-size-7"></span>
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
                        <a class="button is-nav navbar-item p-4" href="../Admin/Dashboard-Admin.jsp">
                            <span class="fas fa-home pr-2 is-size-7"></span>
                            <span class="is-size-7" >Dashboard</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="box has-text-black navbar-item p-4 m-0" style="background-color: #a0e4d1;">
                            <span class="fas fa-user pr-4 is-size-7"></span>
                            <span class="is-size-7" >Profile</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Admin/Report-Admin.jsp">
                            <span class="fas fa-book-open pr-4 is-size-7"></span>
                            <span class="is-size-7">Reports</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Admin/ListOfLecturer.jsp">
                            <span class="fas fa-users-viewfinder pr-4 is-size-7"></span>
                            <span class="is-size-7">Lecturer</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Admin/Examiner-List.jsp">
                            <span class="fas fa-user-tie pr-4 is-size-7"></span>
                            <span class="is-size-7">Examiner</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Admin/Student-List.jsp">
                            <span class="fas fa-user-graduate pr-4 is-size-7"></span>
                            <span class="is-size-7">Students</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Admin/Scope-Admin.jsp">
                            <span class="fas fa-book pr-4 is-size-7"></span>
                            <span class="is-size-7">Scope</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Admin/StudenList-Supervision-Admin.jsp">
                            <span class="fas fa-bullseye pr-4 is-size-7"></span>
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
        <div class="column px-6 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
            <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                User Profile
            </div>
            <div class="columns m-0 p-0">
                <div class="column">
                    <div class="is-flex is-align-items-center">
                        <p class="has-background-black" style="border-radius: 100%; width: 90px; height:90px;">
                            <img src="">
                        </p>
                        <span class="p-2">
                            <div class="has-text-weight-semibold has-text-grey p-1">Username</div>
                            <div class="has-text-grey has-text-weight-semibold is-size-7 px-1">Lecturer</div>
                            <div class="has-text-grey px-1 is-size-7">College of Computing Informatics and Mathematics</div>
                        </span>
                    </div>
                </div>
                <div class="column is-flex is-justify-content-end">
                    <div class="p-1">
                        <button class="button is-custom"><span class="has-text-weight-semibold is-size-7">Upload Photo</span></button>
                    </div>
                    <div class="p-1">
                        <button class="button is-delete is-outlined"><span class="has-text-weight-semibold is-size-7">Delete</span></button>
                    </div>
                </div>
            </div>
            <div class="columns is-multiline m-0 p-0">
                <div class="column is-full">
                    <label class="has-text-weight-semibold has-text-grey">Name</label>
                    <div class="py-2">
                        <input class="px-4 py-2" type="text" placeholder="Full Name" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    </div>
                </div>
                <div class="column is-full">
                    <label class="has-text-weight-semibold has-text-grey">Username</label>
                    <div class="py-2">
                        <input class="custom-input px-4 py-2" type="text" placeholder="e.g. haha">
                    </div>
                </div>
                <div class="column is-half">
                    <label class="has-text-weight-semibold has-text-grey">Email Address</label>
                    <div class="py-2">
                        <input class="custom-input px-4 py-2" type="text" placeholder="Last Name">
                    </div>
                </div>
                <div class="column is-half">
                    <label class="has-text-weight-semibold has-text-grey">Phone Number</label>
                    <div class="py-2">
                        <input class="custom-input px-4 py-2" type="text" placeholder="Last Name">
                    </div>
                </div>
                <div class="column is-half">
                    <label class="has-text-weight-semibold has-text-grey">New Password</label>
                    <div class="py-2">
                        <input class="custom-input px-4 py-2" type="password" placeholder="sorry dunno yet how">
                    </div>
                </div>
                <div class="column is-half">
                    <label class="has-text-weight-semibold has-text-grey">Current Password</label>
                    <div class="py-2">
                        <input class="custom-input px-4 py-2" type="password" placeholder="sorry dunno yet how">
                    </div>
                </div>
                <div class="column is-full">
                    <label class="has-text-weight-semibold has-text-grey">Confirm New Password</label>
                    <div class="py-2">
                        <input class="custom-input px-4 py-2" type="password" placeholder="sorry dunno yet how">
                    </div>
                </div>
            </div>
            <div class="is-flex is-justify-content-space-between px-3 py-6">
                <button class="button is-custom2"><span class="has-text-weight-semibold is-size-7">Back</span></button>
                <button class="button is-custom"><span class="has-text-weight-semibold is-size-7">Save Changes</span></button>
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