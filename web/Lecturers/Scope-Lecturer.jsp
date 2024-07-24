<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fyp.model.bean.Scope" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../lecturer-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column h-100 p-6" style="background-color:#FFFFFF; overflow-y: scroll;">
                        <div class="custom-border p-6 w-100">
                            <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                                <div>
                                    <label class="has-text-weight-bold has-text-grey is-size-5">FYP Scope</label>
                                    <p class="has-text-success is-size-7">Available topics</p>
                                </div>
                                <div class="columns m-0 p-0" style="width:28%;">
                                    <div class="column is-two-thirds p-1">
                                        <input id="searchInput" class="px-4 py-3" type="text" placeholder="Search" style="width: 100%; border-radius: 6px; outline: none;">
                                    </div>
                                    <div class="column p-1" style="align-content:center;">
                                        <button class="button is-custom4 px-4 py-3 w-90" style="height:2.6rem;" id="openModalButton">
                                            <span class="is-size-7 has-text-weight-semibold">New Scope</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="p-3">
                                <table class="">
                                    <thead>
                                        <tr class="" style="border-bottom: 2px solid #ddd;">
                                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Topic</th>
                                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Programme</th>
                                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Session Date</th>
                                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Total Students</th>
                                        </tr>
                                    </thead>
                                    <tbody id="scopeTableBody">
                                    <c:forEach var="scope" items="${listScope}">
                                        <tr>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic">
                                                <c:out value="${scope. scopeName}" /></td> 
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Programme">
                                                <c:out value="${scope.program}" /></td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Session Date">
                                                <c:out value = "${scope.session}"/></td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Total Students">
                                                <c:out value="${scopeStudentCount[scope.scopeId]}" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal custom-modal" id="registerLecturerModal">
            <div class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head has-background-white" style="box-shadow: 0px 1px 1px 1px #dbdbdb;">
                    <p class="modal-card-title has-text-weight-semibold has-text-grey-dark">Add New Scope</p>
                    <button class="delete" aria-label="close" id="closeModalButton"></button>
                </header>
                <form action="${pageContext.request.contextPath}/LecturerAddScope" method="post">
                    <section class="modal-card-body has-background-white">

                        <div class="p-4">
                            <input type="hidden" name="adminId" value="0"/>
                            <input type="hidden" name="lId" value="${sessionScope.lecturer_id }" />
                            <label class="has-text-weight-semibold has-text-grey">Scope</label>
                            <div class="py-2">
                                <input class="px-4 py-2 has-text-grey" type="text" name="scopeName" placeholder="Scope Name" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                            <label class="has-text-weight-semibold has-text-grey">Programme</label>
                            <div class="py-2">
                                <input class="px-4 py-2 has-text-grey" type="text" name="program" placeholder="Programme" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                            <label class="has-text-weight-semibold has-text-grey">Session</label>
                            <div class="py-2">
                                <input class="px-4 py-2 has-text-grey" type="text" name="session" placeholder="Session" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>


                    </section>
                    <footer class="modal-card-foot has-background-white is-flex is-justify-content-space-between p-4">
                        <a class="button is-custom2 is-size-7" href="${pageContext.request.contextPath}/ListScopeServlet">Back</a>
                        <button type="submit" class="button is-custom3 is-size-7">Save Changes
                        </button>       
                    </footer>            
                </form>
            </div>
        </div>                             
        <script>
            $(document).ready(function () {
                $('#searchInput').on('input', function () {
                    var searchText = $(this).val().toLowerCase();
                    $('#scopeTableBody tr').each(function () {
                        var text = $(this).text().toLowerCase();
                        if (text.includes(searchText)) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                });
            });
            document.addEventListener('DOMContentLoaded', () => {
                const openModalButton = document.getElementById('openModalButton');
                const closeModalButton = document.getElementById('closeModalButton');
                const modal = document.getElementById('registerLecturerModal');

                openModalButton.addEventListener('click', () => {
                    modal.classList.add('is-active');
                });

                closeModalButton.addEventListener('click', () => {
                    modal.classList.remove('is-active');
                });

                modal.querySelector('.modal-background').addEventListener('click', () => {
                    modal.classList.remove('is-active');
                });
            });
        </script>
    </body>
</html>