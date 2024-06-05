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
        <link rel="stylesheet" href="../css/style.css">
        <style>
            .login-container {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }
            .login-box {
                width: 100%;
                max-width: 400px;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                background-color: #fff;
                margin-right: 20px; /* Space between the box and the image */
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
                position: fixed;
                bottom: 0;
                width: 100%;
                height: 50px; /* Adjust height as needed */
                background-color: #fff;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 50px 50px;
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
        </style>
    </head>
    <body style="height: 100%;">
                <div class="login-container columns is-vcentered is-centered">
                    <!-- Column for the login box -->
                    <div class="column is-one-third mr-6">
                        <div class="login-box">
                            <div class="has-text-left mb-5">
                                <h1 class="title has-text-weight-bold">Welcome!</h1>
                                <p class="subtitle has-text-grey has-text-weight-semibold">FYP Management System</p>
                            </div>
                            <form action="#">
                                <div class="field">
                                    <div class="control">
                                        <input class="input" type="text" placeholder="Student ID">
                                    </div>
                                </div>
                                <div class="field">
                                    <div class="control">
                                        <input class="input" type="password" placeholder="Password">
                                    </div>
                                </div>
                                <div class="field">
                                    <button class="button is-fullwidth ">Login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Column for the image -->
                    <div class="column is-one-third image-container">
                        <img src="../assets/uitm-background.jpeg" alt="Login Image" class="login-image">
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
                </div>
    </body>
</html>
