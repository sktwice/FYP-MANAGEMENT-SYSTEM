<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fyp.model.bean.Scope" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Scope</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../supervisor-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column h-100 p-6" style="background-color:#FFFFFF; overflow-y: scroll;">
                    <div class="custom-border p-6 w-100">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                            <div>
                                <label class="has-text-weight-bold has-text-grey is-size-5">FYP Scope</label>
                                <p class="has-text-success is-size-7">Available topics</p>
                            </div>
                            <div class="columns m-0 p-0" style="width:55%;">
                                <div class="column is-half p-1">
                                    <input class="px-4 py-3" type="text" placeholder="Search" style="width: 100%; border-radius: 6px; outline: none;">
                                </div>
                                <div class="column p-1" style="align-content:center;">
                                    <div class="dropdown is-hoverable w-100">
                                        <div class="dropdown-trigger w-100">
                                            <button class="button is-white w-100" style="border: 0.9px solid;" aria-haspopup="true" aria-controls="dropdown-menu3">
                                                <span class=" is-size-7">Sort</span>
                                                <span class="icon is-small">
                                                    <i class="fas fa-angle-down" aria-hidden="true"></i>
                                                </span>
                                            </button>
                                        </div>
                                        <div class="dropdown-menu is-size-7 w-100" id="dropdown-menu1" role="menu">
                                            <div class="dropdown-content w-100">
                                                <a href="#" class="dropdown-item is-size-7"> Newest </a>
                                                <a href="#" class="dropdown-item is-size-7"> All </a>
                                                <a href="#" class="dropdown-item is-size-7"> Solved </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="column p-1" style="align-content:center;">
                                    <div>
                                        <a class="button is-custom4 px-4 py-3 w-100" href="${pageContext.request.contextPath}/Supervisor/ShowAddScopeForm"><span class="has-text-weight-semibold is-size-7">Add Scope</span></a>                                             
                                    </div>
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
                                <tbody>
                                    <c:forEach var="scope" items="${scopes}">
                                        <tr>
                                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Topic">${scope.scopeName}</td>
                                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Programme">${scope.program}</td>
                                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Session Date">${scope.session}</td>
                                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Total Students">23</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="p-3 is-flex is-justify-content-space-between">
                            <label class="has-text-grey-light is-size-7">Showing data 1 to 8 of 256k entries</label>
                            <div>
                                <nav class="pagination is-right is-small" role="navigation" aria-label="pagination">
                                    <ul class="pagination-list">
                                        <li><a href="#" class="pagination-link has-background-grey-lighter" style="border: 0;" aria-label="Goto page before"><</a></li>
                                        <li><a class="pagination-link is-current" aria-label="Goto page 1">1</a></li>
                                        <li><a href="#" class="pagination-link has-background-grey-lighter" style="border: 0;" aria-label="Page 2" aria-current="page">2</a></li>
                                        <li><a href="#" class="pagination-link has-background-grey-lighter" style="border: 0;" aria-label="Goto page 3">3</a></li>
                                        <li><span class="pagination-ellipsis">&hellip;</span></li>
                                        <li><a href="#" class="pagination-link has-background-grey-lighter" style="border: 0;" aria-label="Goto page next">86</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>