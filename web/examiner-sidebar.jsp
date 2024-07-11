<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }

    .sidebar {
        width: 200px;
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        background-color: #1c1c1c;
        color: white;
    }

    .sidebar .logo {
        text-align: center;
        padding-top: 20px;
        padding-left: 20px;
        padding-right: 20px;
        padding-bottom: 10px;
    }

    .sidebar .logo img {
        width: 100px;
    }

    .sidebar .nav-list {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }

    .sidebar .nav-list li {
        padding: 10px;
    }

    .sidebar .nav-list li a {
        color: white;
        text-decoration: none;
        display: flex;
        align-items: center;
        padding: 15px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .sidebar .nav-list li a.active {
        background-color: #A9DFD8;
        color: black;
    }

    .sidebar .nav-list li a:hover {
        background-color: #A9DFD8;
        color: black;
    }

    .navbar {
        display: none;
        padding: 10px 20px;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 999;
        align-items: center;
        justify-content: space-between;
        background-color: white;
        border-bottom: 1px solid black;
    }

    .navbar .hamburger {
        background: none;
        border: none;
        color: black;
        font-size: 24px;
        cursor: pointer;
    }

    .navbar .icon-menu::before {
        content: "\2630"; 
    }

    .navbar .nav-list {
        display: none;
        flex-direction: column;
        list-style-type: none;
        padding: 20px 10px;
        margin: 0;
        width: 100%;
        background-color: #3D3D3D;
        position: fixed;
        top: 50px;
        left: 0;
        z-index: 998;
    }

    .navbar .nav-list li {
        padding: 10px;
    }

    .navbar .nav-list li a {
        color: white;
        text-decoration: none;
        display: block;
        padding: 10px 5px;
        border-radius: 5px;
    }

    .navbar .nav-list li a.active {
        background-color: #A9DFD8;
        color: black;
    }

    @media (max-width: 425px) {
        .sidebar {
            display: none;
        }

        .navbar {
            display: flex;
        }

        .navbar .nav-list {
            display: none;
        }

        .navbar .nav-list.active {
            display: flex;
        }
    }
</style>

<div class="sidebar">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/assets/uitm-logo.png" alt="Logo">
    </div>
    <ul class="nav-list is-size-7">
        <li><a href="${pageContext.request.contextPath}/DashboardExaminer"><i class="fa fa-home mx-2"></i> Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/ExaminerUserProfileServlet"><i class="fa fa-user mx-2"></i> Profile</a></li>
        <li><a href="${pageContext.request.contextPath}/Examiners/List-Of-Proposal-Examiner.jsp"><i class="fa fa-file-signature mx-2"></i> Proposal</a></li>
        <li><a href="${pageContext.request.contextPath}/ListF7Servlet"><i class="fa fa-file-alt mx-2"></i> Form</a></li>
        <li><a href="${pageContext.request.contextPath}/LoginID.jsp"><i class="fa fa-sign-out-alt mx-2"></i> Sign Out</a></li>
    </ul>
</div>

<div class="navbar">
    <button class="hamburger"><i class="icon-menu" style="font-style:normal;"></i></button>
    <ul class="nav-list is-size-7">
        <li><a href="${pageContext.request.contextPath}/DashboardExaminer""><i class="fa fa-home mx-2"></i> Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/ExaminerUserProfileServlet"><i class="fa fa-user mx-2"></i> Profile</a></li>
        <li><a href="${pageContext.request.contextPath}/Examiners/List-Of-Proposal-Examiner.jsp"><i class="fa fa-file-signature mx-2"></i> Proposal</a></li>
        <li><a href="${pageContext.request.contextPath}/ListF7Servlet"><i class="fa fa-file-alt mx-2"></i> Form</a></li>
        <li><a href="${pageContext.request.contextPath}/LoginID.jsp"><i class="fa fa-sign-out-alt mx-2"></i> Sign Out</a></li>
    </ul>
</div>

<script>
    // JavaScript to handle setting the active class based on the current page URL
    document.addEventListener('DOMContentLoaded', function () {
        var currentPath = window.location.pathname;
        var navLinks = document.querySelectorAll('.nav-list a');

        navLinks.forEach(function (link) {
            if (link.href.includes(currentPath)) {
                link.classList.add('active');
            }
        });
    });

    // JavaScript for mobile menu toggle
    document.querySelector('.hamburger').addEventListener('click', function () {
        document.querySelector('.navbar .nav-list').classList.toggle('active');
    });
</script>
