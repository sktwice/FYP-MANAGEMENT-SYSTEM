<%-- 
    Document   : Login-Student
    Created on : May 2, 2024, 6:13:07 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <style>
            .login-container {
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh; /* Ensure full height */
                padding: 50px 0; /* Added padding top and bottom */
                flex-direction: column; /* Stack vertically on small screens */
            }
            .login-box {
                width: 100%;
                max-width: 400px;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                background-color: #fff;
                margin-bottom: 20px; /* Space between the box and the image */
            }
            .login-image {
                max-width: 100%;
                border-radius: 20px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                height: auto;
                transform: rotate(-5deg);
            }
            .image-container {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
                max-width: 300px;
                margin-bottom: 20px; /* Add space between the elements */
            }
            .login-box h1 {
                color: #000;
            }
            .login-box p {
                color: #6c757d;
            }
            .login-box .button {
                background-color: #000;
                color: #fff;
            }
            .login-box .input {
                background-color: #f0f0f0;
                border: none;
            }
            footer {
                width: 100%;
                height: 50px; /* Adjust height as needed */
                background-color: #fff;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 20px; /* Reduced padding for smaller screens */
                position: fixed; /* Fix footer at the bottom */
                bottom: 0;
            }
            .footer-left {
                font-size: 14px;
                color: #6c757d;
            }
            .footer-right a {
                margin-left: 20px;
                color: #6c757d;
                text-decoration: none;
            }
            @media (min-width: 576px) {
                .login-container {
                    padding: 50px; /* Ensure padding for larger screens */
                }
                footer {
                    padding: 0 50px; /* Increased padding for larger screens */
                }
            }
            @media (min-width: 768px) {
                .login-container {
                    flex-direction: row; /* Side-by-side layout on larger screens */
                }
                .login-box, .image-container {
                    margin-bottom: 0; /* Remove bottom margin for side-by-side layout */
                }
            }
        </style>
    </head>
    <body>
        <div class="login-container columns is-vcentered is-centered">
            <!-- Column for the login box -->
            <div class="column is-one-third">
                <div class="login-box">
                    <div class="has-text-left mb-5">
                        <h1 class="title has-text-weight-bold">Welcome!</h1>
                        <p class="subtitle has-text-grey has-text-weight-semibold">FYP Management System</p>
                    </div>
                    <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
                        <div class="field">
                            <div class="control">
                                <input class="input" type="text" name="username" placeholder="User ID">
                            </div>
                        </div>
                        <div class="field">
                            <div class="control">
                                <input class="input" type="password" name="password" placeholder="Password">
                            </div>
                        </div>
                        <div class="field">
                            <button class="button is-fullwidth" type="submit">Login</button>
                        </div>
                    </form>
                    <% 
                        String error = request.getParameter("error");
                        if ("invalid".equals(error)) {
                    %>
                        <p class="has-text-danger has-text-centered">Invalid username or password. Please try again.</p>
                    <% 
                        }
                    %>
                </div>
            </div>
            <!-- Column for the image -->
            <div class="column is-one-third image-container">
                <img src="${pageContext.request.contextPath}/assets/uitm-background.jpeg" alt="Login Image" class="login-image">
            </div>
        </div>
        <!-- Footer -->
        <footer>
            <div class="footer-left">
                © Copyright Inc. 2024
            </div>
            <div class="footer-right">
                <a href="#">Instagram</a>
                <a href="#">Twitter</a>
            </div>
        </footer>
    </body>
</html>
