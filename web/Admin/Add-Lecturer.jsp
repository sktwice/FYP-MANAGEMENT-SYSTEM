<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.fyp.model.bean.Faculty" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList, java.util.Iterator" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register Lecturer</title>
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
                    <a class="navbar-item p-4" href="../Admin/UserProfile-Admin.jsp">
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
                        <a class="button is-nav navbar-item p-4" href="../Admin/UserProfile-Admin.jsp">
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
                            <span class="is-size-7">Sign-out</span>
                        </a>
                    </li>
                </ul>
            </aside>
        </div>
        
        <div class="column px-6 py-3" style="background-color:#FFFFFF;">
            <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                Register Lecturer
            </div>
            <div class="p-4">
                <form action="RegisterLecturerServlet" method="post">
                    <label for="username" class="has-text-weight-semibold has-text-grey">Username:</label>
                    <div class="py-2">
                        <input class="px-4 py-2" type="text" id="username" name="username" required style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    </div>
                    
                    <label for="password" class="has-text-weight-semibold has-text-grey">Password:</label>
                    <div class="py-2">
                        <input class="px-4 py-2" type="password" id="password" name="password" required style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    </div>
                    
                    <label for="f_id" class="has-text-weight-semibold has-text-grey">Faculty:</label>
                    <div class="py-2">
                        <select id="f_id" name="f_id" required style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            <option value="">Select Faculty and Course</option>
                                        <% 
                List<Faculty> listFaculty = (List<Faculty>) request.getAttribute("facultyList");
                if (listFaculty != null) {
                    for (Faculty f : listFaculty) {
                        out.println("<option value=\"" + f.getfId() + "\">" + f.getfName() + " :- " + f.getfCourse() + "</option>");
                    }
                } else {
                    out.println("<option value=\"\">No faculties available</option>");
                }
            %>
                        </select><br>
                    </div>
                    
                    <label for="l_course" class="has-text-weight-semibold has-text-grey">Lecturer Course:</label>
                    <div class="py-2">
                        <select id="l_course" name="l_course" required style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbdbd; outline: none;">
                            <option value="">Select Course</option>
                                        <% 
                List<String> courseList = (List<String>) request.getAttribute("courseList");
                if (courseList != null) {
                    for (String course : courseList) {
                        out.println("<option value=\"" + course + "\">" + course + "</option>");
                    }
                } else {
                    out.println("<option value=\"\">No courses available</option>");
                }
            %>
                        </select><br>
                    </div>
                    
                    <label for="admin_id" class="has-text-weight-semibold has-text-grey">Admin ID:</label>
                    <div class="py-2">
                        <input class="px-4 py-2" type="text" id="admin_id" name="admin_id" required style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    </div>
                    
                    <label for="position" class="has-text-weight-semibold has-text-grey">Position:</label>
                    <div class="py-2">
                        <input class="px-4 py-2" type="text" id="position" name="position" required style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    </div>
                    
                    <label for="l_image" class="has-text-weight-semibold has-text-grey">Image Path:</label>
                    <div class="py-2">
                        <input class="px-4 py-2" type="text" id="l_image" name="l_image" required style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    </div>
                    
                    <label for="l_name" class="has-text-weight-semibold has-text-grey">Lecturer Name:</label>
                    <div class="py-2">
                        <input class="px-4 py-2" type="text" id="l_name" name="l_name" required style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    </div>
                    
                    <label for="phone_num" class="has-text-weight-semibold has-text-grey">Phone Number:</label>
                    <div class="py-2">
                        <input class="px-4 py-2" type="text" id="phone_num" name="phone_num" required style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    </div>
                    
                    <label for="email" class="has-text-weight-semibold has-text-grey">Email:</label>
                    <div class="py-2">
                        <input class="px-4 py-2" type="email" id="email" name="email" required style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    </div>
                    

                    
                    <div class="is-flex is-justify-content-space-between p-4">
                        <a class="button is-custom2" href="Admin/ListOfLecturer.jsp"><span class="has-text-weight-semibold is-size-7">Back</span></a>
                        <input class="button is-custom" type="submit" value="Register">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Get all "navbar-burger" elements
            const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
            // Add a click event on each of them
            $navbarBurgers.forEach(el => {
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
