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
    </head>
    <body style="height: 100vh;">
        <div class="columns is-vcentered" style="height: 100vh;">
            <div class="column is-one-third is-offset-one-third">
                <div class="box">
                    <div class="has-text-centered mb-5">
                        <h1 class="title has-text-weight-bold">Welcome!</h1>
                        <p class="subtitle has-text-grey has-text-weight-semibold">FYP Management System</p>
                    </div>
                    <form action="#">
                        <div class="field">
                            <div class="control">
                                <input class="input is-medium" type="text" placeholder="Student ID">
                            </div>
                        </div>
                        <div class="field">
                            <div class="control">
                                <input class="input is-medium" type="password" placeholder="Password">
                            </div>
                        </div>
                        <div class="field">
                            <button class="button is-primary is-fullwidth is-medium">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
