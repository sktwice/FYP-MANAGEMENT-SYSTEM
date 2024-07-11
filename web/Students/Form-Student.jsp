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
    </head>
    <body>
        <div class="content-wrapper">
                <jsp:include page="../student-sidebar.jsp"></jsp:include>
                <div class="main-content">
        <div class="column h-100 p-4" style="background-color:#FFFFFF; overflow-y: scroll;">
            <div class="custom-border p-6 w-100">
                <div class="container">
                    <div class="tabs is-boxed">
                        <ul>
                            <li data-target="tab-1"><a>Form 5-Formulation Presentation</a></li>
                            <li data-target="tab-2"><a>Form 6-Evaluation Form</a></li>
                        </ul>
                    </div>

                    <div id="tab-1" class="tab-content is-hidden">
                        <div class="p-3">
                            <div class="is-flex is-justify-content-end is-align-items-center pb-4">
                    <!-- Modal Trigger Button -->
                    <button class="button is-custom" style="height:2rem;" onclick="toggleModal('addForm5Modal')">
                        <span class="is-size-7">Add</span>
                    </button>
                </div>
                            <div class="p-1" id="table">
                        <table class="">
                            <thead>
                            <tr style="border-bottom: 2px solid #ddd;">
                                
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Date Meet</th>
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Completed Activity</th>
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Next Activity</th>
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Approval</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="form5" items="${form5List}">
                                <tr>
                                   
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.dateMeet}</td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.completeActivity}</td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.nextActivity}</td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.approval}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <br>
                        <a class="button is-custom2" href="${pageContext.request.contextPath}/StudentFormServlet">Back</a>
                    </div>
                        </div>
                    </div>

                    <div id="tab-2" class="tab-content is-hidden">
                        <div class="p-3">
                            
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
            window.onbeforeunload = function () {
                return "Your work will be lost.";
            };

            function toggleModal(modalId) {
                var modal = document.getElementById(modalId);
                modal.classList.toggle('is-active');
            }
    </script>    
    <!-- Modal for Adding Form5 -->
<div id="addForm5Modal" class="modal">
    <div class="modal-background"></div>
    <div class="modal-content">
        <div class="box">
            <h1 class="title is-4 has-text-centered has-text-grey">Add Form 5 Entry</h1>
            <form action="${pageContext.request.contextPath}/Form5Servlet" method="post" class="p-4">
                <div class="field">
                    <label class="">Date Meet</label>
                    <div class="control">
                        <input class="" type="date" name="dateMeet" placeholder="Enter Date Meet" required>
                    </div>
                </div>
                <div class="field">
                    <label class="">Completed Activity</label>
                    <div class="control">
                        <input class="" type="text" name="completeActivity" placeholder="Enter Completed Activity" required>
                    </div>
                </div>
                <input type="hidden" name="action" value="addForm5">
                <div class="field is-grouped is-grouped-centered mt-4">
                    <div class="control">
                        <button type="submit" class="button is-custom3 is-outlined">Submit</button>
                    </div>
                    <div class="control">
                        <button type="button" class="button is-custom2 is-outlined" onclick="toggleModal('addForm5Modal')">Cancel</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <button class="modal-close is-large" aria-label="close" onclick="toggleModal('addForm5Modal')"></button>
</div>
    </body>
</html>