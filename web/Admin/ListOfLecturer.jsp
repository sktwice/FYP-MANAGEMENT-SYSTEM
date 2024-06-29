<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fyp.model.bean.Lecturer" %>
<%@ page import="com.fyp.model.bean.Faculty" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lecturers</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <div class="content-wrapper">
        <jsp:include page="../admin-sidebar.jsp"></jsp:include>
        <div class="main-content">
            <div class="column h-100 px-4 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
                <div class="pb-3 is-flex is-justify-content-end is-align-items-center">
                    <input id="searchInput" class="px-4 mx-4 my-1" type="text" placeholder="Search"
                        style="width: 18rem; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    <span class="has-background-black"
                        style="border-radius: 100%; width: 40px; height: 40px;">
                        <img src="">
                    </span>
                </div>

                <div class="custom-border p-4 w-100">
                    <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                        <div>
                            <label class="has-text-weight-bold has-text-grey is-size-5">List of Lecturers</label>
                            <p class="has-text-grey-light is-size-7">More than ${listLecturer.size()} lecturers</p>
                        </div>
                        <a class="button is-custom" style="height:2rem;"
                            href="${pageContext.request.contextPath}/AddLecturer">
                            <span class="is-size-7">Add Lecturer</span>
                        </a>
                    </div>
                    <div>
                        <div class="p-1" id="table">
                            <table class="">
                                <thead>
                                    <tr style="border-bottom: 2px solid #ddd;">
                                        <th
                                            class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                            Name</th>
                                        <th
                                            class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                            Lecturer ID</th>
                                        <th
                                            class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                            Position</th>
                                        <th
                                            class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                            Email</th>
                                        <th
                                            class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                            Action</th>
                                    </tr>
                                </thead>
                                <tbody id="tableBody">
                                    <c:forEach var="lecturer" items="${listLecturer}">
                                        <tr>
                                            <td class="has-text-centered">
                                                <c:out value="${lecturer.lName}" />
                                            </td>
                                            <td class="has-text-centered">
                                                <c:out value="${lecturer.lId}" />
                                            </td>
                                            <td class="has-text-centered">
                                                <c:out value="${lecturer.positions}" />
                                            </td>
                                            <td class="has-text-centered" style="word-break: break-word;">
                                                <c:out value="${lecturer.email}" />
                                            </td>
                                            <td class="has-text-centered">
                                                <i class="button is-success is-outlined is-small mr-1 js-modal-trigger" data-target="modal-ter">
                                                    <a class="btn btn-info fas fa-edit has-text-success">
                                                       
                                                    </a>
                                                </i>
                                                <i class="button is-danger is-outlined is-small"><a
                                                        href="${pageContext.request.contextPath}/deleteLecturer?id=${lecturer.lId}"
                                                        class="btn btn-danger fas fa-trash has-text-danger"></a></i>
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
    </div>
    <div id="modal-ter" class="modal">
        <div class="modal-background"></div>
        <div class="modal-card">
          <header class="modal-card-head has-background-white">
            <p class="modal-card-title title has-text-grey-dark">Edit Lecturer</p>
            <button class="delete" aria-label="close"></button>
          </header>
          <section class="modal-card-body has-background-white">
            <div class="content">
                <form action="updateLecturer" method="post">
                    <% if (request.getAttribute("lecturer") != null) { %>
                    <input type="hidden" name="id" value="<%= ((Lecturer) request.getAttribute("lecturer")).getlId() %>" />
                    <fieldset class="form-group">
                        <label>Lecturer Name</label>
                        <input type="text" value="<%= ((Lecturer) request.getAttribute("lecturer")).getlName() %>" class="form-control" name="lName" required="required">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Position</label>
                        <input type="text" value="<%= ((Lecturer) request.getAttribute("lecturer")).getPosition() %>" class="form-control" name="position">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Email</label>
                        <input type="text" value="<%= ((Lecturer) request.getAttribute("lecturer")).getEmail() %>" class="form-control" name="email">
                    </fieldset>
                    <input type="hidden" name="f_id" value="<%= ((Lecturer) request.getAttribute("lecturer")).getfId() %>" />
                    
                    <% } %>
                </form>
            </div>
          </section>
          <footer class="modal-card-foot has-background-white">
            <div class="buttons">
                <button type="button" class="btn btn-secondary button is-small" onclick="window.location.href = '${pageContext.request.contextPath}/LecturerListServlet'">Back</button>
                <button type="submit" class="btn btn-success button is-success is-small">Save</button>
            </div>
          </footer>
        </div>
      </div>                       
    <script>
        document.getElementById('searchInput').addEventListener('input', function () {
            var input = this.value.toLowerCase();
            var rows = document.querySelectorAll('#table tbody tr');

            rows.forEach(function (row) {
                var name = row.querySelector('td:nth-child(1)').textContent.toLowerCase();
                var id = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                var position = row.querySelector('td:nth-child(3)').textContent.toLowerCase();
                var email = row.querySelector('td:nth-child(4)').textContent.toLowerCase();

                if (name.includes(input) || id.includes(input) || position.includes(input) || email.includes(input)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
        // Functions to open and close a modal
        function openModal($el) {
          $el.classList.add('is-active');
        }

        function closeModal($el) {
          $el.classList.remove('is-active');
        }

        function closeAllModals() {
          (document.querySelectorAll('.modal') || []).forEach(($modal) => {
            closeModal($modal);
          });
        }

        // Add a click event on buttons to open a specific modal
        (document.querySelectorAll('.js-modal-trigger') || []).forEach(($trigger) => {
          const modal = $trigger.dataset.target;
          const $target = document.getElementById(modal);

          $trigger.addEventListener('click', () => {
            openModal($target);
          });
        });

        // Add a click event on various child elements to close the parent modal
        (document.querySelectorAll('.modal-background, .modal-close, .modal-card-head .delete, .modal-card-foot .button') || []).forEach(($close) => {
          const $target = $close.closest('.modal');

          $close.addEventListener('click', () => {
            closeModal($target);
          });
        });

        // Add a keyboard event to close all modals
        document.addEventListener('keydown', (event) => {
          if(event.key === "Escape") {
            closeAllModals();
          }
        });
      });
    </script>
</body>

</html>
