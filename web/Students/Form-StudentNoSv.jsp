<%-- 
    Document   : Form-Student
    Created on : May 2, 2024, 6:13:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>
            
        .tabs {
                margin-bottom: 1.5rem;
                border-bottom-color: #dbdbdb !important;
            }
        .tabs ul li.is-active a {
                border-color: #dbdbdb !important;
                color: #000;
                border-bottom-color: #dbdbdb !important
            }
        .tabs ul li a {
            color: #000;
            border-bottom-color: #dbdbdb !important
        }
            .tabs ul li a:hover {
                background-color: #dbdbdb !important;
                color: #000;
            }
            .tabs ul li.is-active.light-theme a {
                color: #000;
                border-bottom-color: #dbdbdb !important
            }

            .theme-preview {
                display: inline-block;
                width: 50px;
                height: 50px;
                border-radius: 5px;
                border: 2px solid transparent;
                cursor: pointer;
            }
            .theme-preview.light {
                background-color: #eee;
            }
            .tabs.is-boxed li.is-active a {
            background-color: #ffffff;
            border-color: #dbdbdb !important;
            border-bottom-color: #fff !important;
        }
        </style>
    </head>
    <body>
        <div class="content-wrapper">
                <jsp:include page="../student-sidebar.jsp"></jsp:include>
                <div class="main-content">
        <div class="column h-100 p-4" style="background-color:#FFFFFF; overflow-y: scroll;">
            <div class="custom-border p-6 w-100">
                <div class="pb-4">
                            <label class="has-text-weight-bold has-text-grey is-size-4 pb-5">Forms</label>
                            <p class="has-text-white has-background-grey-light is-size-7 px-3 py-1" style="border-radius: 4px;">Final Year Project has more than 7 forms</p>
                        </div>
                <div class="container">
                    <div class="tabs is-boxed">
                        <ul style="border-bottom-color: #dbdbdb !important">
                            <li data-target="tab-1" class="is-active is-size-7"><a class="p-3 has-text-weight-semibold has-text-grey">Form 5-Formulation Presentation</a></li>
                            <li data-target="tab-2" class="is-size-7"><a class="p-3 has-text-weight-semibold has-text-grey">Form 6-Evaluation Form</a></li>
                        </ul>
                    </div>

                    <div id="tab-1" class="tab-content">
                        <div class="p-3">
                            <div class="columns is-vcentered is-mobile m-0">
                                <div class="column">
                                    <span class="is-size-6 has-text-weight-semibold has-text-grey" style="text-transform: uppercase;">
                                        Please find a supervisor for yourself first
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="tab-2" class="tab-content is-hidden">
                        <div class="p-3">
                            <div class="columns is-vcentered is-mobile m-0">
                                <div class="column">
                                    <span class="is-size-6 has-text-weight-semibold has-text-grey" style="text-transform: uppercase;">
                                        Please find a supervisor for yourself first
                                    </span>
                                </div>
                            </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>
        </div>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
        const tabs = document.querySelectorAll('.tabs ul li');
        const tabContents = document.querySelectorAll('.tab-content');

        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                tabs.forEach(item => item.classList.remove('is-active'));
                tab.classList.add('is-active');

                const target = tab.dataset.target;
                tabContents.forEach(content => {
                    if (content.id === target) {
                        content.classList.remove('is-hidden');
                    } else {
                        content.classList.add('is-hidden');
                    }
                });
            });
        });
    });
       
    </script>    
    
    </body>
</html>