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
            min-height: 100vh;
            padding: 50px 0;
            flex-direction: column;
        }
        .login-box {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
            margin-bottom: 20px;
        }
        .login-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .image-container {
            width: 100%;
            height: 100vh;
            overflow: hidden;
        }
        .login-container-inner {
            display: flex;
            flex-direction: row;
            width: 70%;
            height: 70vh;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        .login-left {
            width: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-right {
            width: 50%;
            padding: 40px;
            background-color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
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
        
        @media (min-width: 576px) {
            .login-container {
                padding: 50px;
            }
        }
        @media (max-width: 768px) {
            .login-container-inner {
                flex-direction: column;
                height: auto;
            }
            .login-left, .login-right {
                width: 100%;
            }
            .image-container {
                height: 50vh;
            }
        }
        @media (max-width: 425px) {
            
            .login-container-inner {
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                width: 80%;
            }
            .login-left, .login-right {
                padding: 2px;
            }
            .image-container {
                height: 40vh;
                border-radius: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-container-inner">
            <div class="login-left image-container">
                <img src="${pageContext.request.contextPath}/assets/uitm-background.jpeg" alt="Login Image" class="login-image">
            </div>
            <div class="login-right">
                <div class="login-box">
                    <div class="has-text-left mb-5">
                        <p class="title has-text-weight-bold is-size-4 has-text-black">Welcome!</p>
                        <p class="subtitle has-text-grey has-text-weight-semibold is-size-5">FYP Management System</p>
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
        </div>
    </div>
</body>
</html>