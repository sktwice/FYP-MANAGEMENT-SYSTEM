<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fyp.model.bean.Lecturer" %>
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

                <div class="custom-border p-6 w-100">
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
                                            <td class="has-text-centered" style="word-break: break-word;">
                                                <c:out value="${lecturer.lName}" />
                                            </td>
                                            <td class="has-text-centered" style="word-break: break-word;">
                                                <c:out value="${lecturer.lId}" />
                                            </td>
                                            <td class="has-text-centered" style="word-break: break-word;">
                                                <c:out value="${lecturer.positions}" />
                                            </td>
                                            <td class="has-text-centered" style="word-break: break-word;">
                                                <c:out value="${lecturer.email}" />
                                            </td>
                                            <td class="has-text-centered">
                                                <button class="button is-success is-outlined edit-button" 
                                                        data-id="${lecturer.lId}" 
                                                        data-name="${lecturer.lName}" 
                                                        data-position="${lecturer.positions}" 
                                                        data-email="${lecturer.email}">
                                                    <span class="fas fa-edit has-text-success is-size-7"></span>
                                                </button>
                                                <i class="button is-danger is-outlined">
                                                    <a
                                                        href="${pageContext.request.contextPath}/deleteLecturer?id=${lecturer.lId}"
                                                        class="btn btn-danger fas fa-trash has-text-danger is-size-7">
                                                    </a>
                                                </i>
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
    <!-- Modal structure -->
    <div id="editModal" class="modal">
        <div class="modal-background"></div>
        <div class="modal-card">
            <header class="modal-card-head has-background-white" style="box-shadow: 0px 1px 1px 1px #dbdbdb;">
                <p class="modal-card-title has-text-weight-semibold has-text-grey-dark">Edit Lecturer</p>
                <button class="delete" aria-label="close" onclick="closeModal()"></button>
            </header>
            <section class="modal-card-body has-background-white" style="box-shadow: 0px 1px 1px 1px #dbdbdb;">
                <!-- Form to edit lecturer details -->
                <form id="editLecturerForm" action="${pageContext.request.contextPath}/editLecturer" method="post">
                    <input type="hidden" id="lecturerId" name="lId">
                    <div class="field">
                        <label class=" has-text-weight-semibold has-text-grey">Name</label>
                        <div class="control">
                            <input class="px-4 py-2" type="text" id="lecturerName" name="lName" 
                                   style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class="field">
                        <label class=" has-text-weight-semibold has-text-grey">Position</label>
                        <div class="control">
                            <input class="px-4 py-2" type="text" id="lecturerPosition" name="position"
                                   style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                    <div class=" has-text-weight-semibold has-text-grey">
                        <label class=" has-text-weight-semibold has-text-grey">Email</label>
                        <div class="control">
                            <input class="px-4 py-2" type="email" id="lecturerEmail" name="email"
                                   style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                        </div>
                    </div>
                </form>
            </section>
            <footer class="modal-card-foot has-background-white is-flex is-justify-content-space-between">
                <button class="button is-danger has-text-white" onclick="closeModal()">Cancel</button>
                <button class="button is-success has-text-white" onclick="saveChanges()">Save changes</button>
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
    function openModal() {
    document.getElementById("editModal").classList.add("is-active");
}

function closeModal() {
    document.getElementById("editModal").classList.remove("is-active");
}

function saveChanges() {
    // Perform form submission via JavaScript
    document.getElementById('editLecturerForm').submit();
}

function editLecturer(id, name, position, email) {
    document.getElementById('lecturerId').value = id;
    document.getElementById('lecturerName').value = name;
    document.getElementById('lecturerPosition').value = position;
    document.getElementById('lecturerEmail').value = email;
    openModal();
}

// Event listener for edit buttons
document.querySelectorAll('.edit-button').forEach(button => {
    button.addEventListener('click', function () {
        const id = this.getAttribute('data-id');
        const name = this.getAttribute('data-name');
        const position = this.getAttribute('data-position');
        const email = this.getAttribute('data-email');
        editLecturer(id, name, position, email);
    });
});
</script>


</body>

</html>