<%-- 
    Document   : List-Of-Proposal-Examiner
    Created on : May 2, 2024, 6:55:31 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>List Of Proposal</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="content-wrapper">
        <jsp:include page="../examiner-sidebar.jsp"></jsp:include>
        <div class="main-content">
        <div class="column h-100 p-4" style="background-color:#FFFFFF; overflow-y: scroll;">
            <div class="custom-border p-6 w-100">
                <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                    <div>
                        <label class="has-text-weight-semibold has-text-grey is-size-5">Student Proposals</label>
                        <p class="has-text-success is-size-7">More than 300+ students proposals </p>
                    </div>
                    <div class="" style="align-content:center;">
                        <input id="searchInput" class="px-4 py-3" type="text" placeholder="Search" style="width: 100%; border-radius: 6px; outline: none;">
                    </div>
                </div>
                <div class="p-3">
                    <table class="">
                        <thead>
                        <tr class="" style="border-bottom: 2px solid #ddd;">
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Topic</th>
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Matric ID</th>
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Session</th>
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Action</th>
                        </tr>
                        </thead>
                        <tbody id="scopeTableBody">
                        <tr class="mb-0 ">
                            <td class="mt-3 is-size-7 has-text-centered has-text-right-mobile has-text-weight-semibold has-text-grey" data-label="Topic">
                                Android App Development
                            </td>
                            <td class=" is-size-7 has-text-centered has-text-right-mobile has-text-weight-semibold has-text-grey" data-label="Matric ID">
                                2023546821
                            </td>
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-weight-semibold has-text-grey" data-label="Session">
                                Session Date
                            </td>
                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">
                                    <div class=" is-flex is-justify-content-center">
                                        <button class="button is-custom is-small">Open</button>
                                    </div>
                                </td>
                        </tr>
                        </tbody>
                         <tbody>
                        <tr class="mb-0 ">
                            <td class="mt-3 is-size-7 has-text-centered has-text-right-mobile has-text-weight-semibold has-text-grey" data-label="Topic">
                                Android App Development
                            </td>
                            <td class=" is-size-7 has-text-centered has-text-right-mobile has-text-weight-semibold has-text-grey" data-label="Matric ID">
                                2023546821
                            </td>
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-weight-semibold has-text-grey" data-label="Session">
                                Session Date
                            </td>
                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">
                                    <div class=" is-flex is-justify-content-center">
                                        <button class="button is-custom is-small">Open</button>
                                    </div>
                                </td>
                        </tr>
                        </tbody>
                         <tbody>
                        <tr class="mb-0 ">
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-weight-semibold has-text-grey" data-label="Topic">
                                Android App Development
                            </td>
                            <td class=" is-size-7 has-text-centered has-text-right-mobile has-text-weight-semibold has-text-grey" data-label="Matric ID">
                                2023546821
                            </td>
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-weight-semibold has-text-grey" data-label="Session">
                                Session Date
                            </td>
                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">
                                    <div class=" is-flex is-justify-content-center">
                                        <button class="button is-custom is-small">Open</button>
                                    </div>
                                </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>
