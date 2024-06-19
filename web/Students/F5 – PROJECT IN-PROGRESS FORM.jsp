<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="height:100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <title>F5 Page</title>
</head>
<body style="height:100%;">

<div class="columns m-0 p-0 h-100">
    <div class="column p-6 is-justify-content-center" style="background-color:#FFFFFF; overflow-y: scroll;">
        <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
            F5 – PROPOSAL/PROJECT IN-PROGRESS FORM
        </div>
        <div class="columns is-multiline m-0 p-0">
            <div class="custom-border p-5 w-100">
                <div class="is-flex is-justify-content-end is-align-items-center pb-4">
                    <!-- Modal Trigger Button -->
                    <button class="button is-custom" style="height:2rem;" onclick="toggleModal('addForm5Modal')">
                        <span class="is-size-7">Add</span>
                    </button>
                </div>
                <div>
                    <div class="p-1" id="table">
                        <table class="">
                            <thead>
                            <tr style="border-bottom: 2px solid #ddd;">
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Form ID</th>
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Date Meet</th>
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Completed Activity</th>
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Next Activity</th>
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Approval</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="form5" items="${form5List}">
                                <tr>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.formId}</td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.dateMeet}</td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.completeActivity}</td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.nextActivity}</td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.approval}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <br>
                        <nav class="pagination is-small" role="navigation" aria-label="pagination">
                            <a href="#" class="pagination-previous has-text-grey">Previous</a>
                            <a href="#" class="pagination-next has-text-grey">Next page</a>
                            <ul class="pagination-list">
                                <li><a href="#" class="pagination-link has-text-grey" aria-label="Goto page 1">1</a></li>
                                <li><span class="pagination-ellipsis">&hellip;</span></li>
                                <li><a href="#" class="pagination-link has-text-grey" aria-label="Goto page 45">45</a></li>
                                <li>
                                    <a class="pagination-link is-current" aria-label="Page 46" aria-current="page">46</a>
                                </li>
                                <li><a href="#" class="pagination-link has-text-grey" aria-label="Goto page 47">47</a></li>
                                <li><span class="pagination-ellipsis">&hellip;</span></li>
                                <li><a href="#" class="pagination-link has-text-grey" aria-label="Goto page 86">86</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <script>
            window.onbeforeunload = function () {
                return "Your work will be lost.";
            };

            function toggleModal(modalId) {
                var modal = document.getElementById(modalId);
                modal.classList.toggle('is-active');
            }
        </script>
    </div>
</div>

<!-- Modal for Adding Form5 -->
<div id="addForm5Modal" class="modal">
    <div class="modal-background"></div>
    <div class="modal-content">
        <div class="box">
            <h1 class="title is-4 has-text-centered">Add Form5 Entry</h1>
            <form action="${pageContext.request.contextPath}/Form5Servlet" method="post">
                <div class="field">
                    <label class="label">Date Meet</label>
                    <div class="control">
                        <input class="input" type="date" name="dateMeet" placeholder="Enter Date Meet" required>
                    </div>
                </div>
                <div class="field">
                    <label class="label">Completed Activity</label>
                    <div class="control">
                        <input class="input" type="text" name="completeActivity" placeholder="Enter Completed Activity" required>
                    </div>
                </div>
                <input type="hidden" name="action" value="addForm5">
                <div class="field is-grouped is-grouped-centered mt-4">
                    <div class="control">
                        <button type="submit" class="button is-primary">Submit</button>
                    </div>
                    <div class="control">
                        <button type="button" class="button" onclick="toggleModal('addForm5Modal')">Cancel</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <button class="modal-close is-large" aria-label="close" onclick="toggleModal('addForm5Modal')"></button>
</div>

</body>
</html>
