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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>
            .grid-container {
                display: grid;
            }
            .grid-container {
                display: inline-grid;
            }
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
                                    <p class="has-text-grey-light is-size-7">More than ${lecturers.size()} lecturers</p>
                            </div>
                            <button class="button is-custom" style="height:2rem;" id="openModalButton">
                                <span class="is-size-7">Add Lecturer</span>
                            </button>

                        </div>
                        <div class="container">
                            <div class="tabs is-boxed">
                                <ul style="border-bottom-color: #dbdbdb !important">
                                    <li data-target="tab-1" class="is-active is-size-7"><a class="p-3 has-text-weight-semibold has-text-grey">Teaching Lecturer</a></li>
                                    <li data-target="tab-2" class="is-size-7"><a class="p-3 has-text-weight-semibold has-text-grey">Examiner Lecturer</a></li>
                                    <li data-target="tab-3" class="is-size-7"><a class="p-3 has-text-weight-semibold has-text-grey">Supervisor Lecturer</a></li>
                                </ul>
                            </div>   
                            <div>
                                <div id="tab-1" class="tab-content">
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
                                                        Status</th>
                                                    <th
                                                        class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                        Email</th>
                                                    <th
                                                        class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                        Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tableBody">
                                                <c:forEach var="lecturer" items="${teaching}">
                                                    <tr>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.LName}" />
                                                        </td>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.LId}" />
                                                        </td>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.status}" />
                                                        </td>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.email}" />
                                                        </td>
                                                        <td class="has-text-centered">
                                                            <button class="button is-success is-outlined edit-button" 
                                                                    data-id="${lecturer.LId}" 
                                                                    data-name="${lecturer.LName}" 
                                                                    data-email="${lecturer.email}">
                                                                <span class="fas fa-edit has-text-success is-size-7"></span>
                                                            </button>
                                                            <a href="javascript:void(0);" 
                                                               class="button is-danger is-outlined"
                                                               data-role-id="${lecturer.roleId}"
                                                               data-status="${lecturer.status}"
                                                               onclick="updateStatus(this)">
                                                                <i class="fas fa-trash has-text-danger is-size-7"></i>
                                                            </a>

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="tab-2" class="tab-content is-hidden">
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
                                                        Status</th>
                                                    <th
                                                        class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                        Email</th>
                                                    <th
                                                        class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                        Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tableBody">
                                                <c:forEach var="lecturer" items="${examiner}">
                                                    <tr>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.LName}" />
                                                        </td>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.LId}" />
                                                        </td>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.status}" />
                                                        </td>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.email}" />
                                                        </td>
                                                        <td class="has-text-centered">
                                                            <button class="button is-success is-outlined edit-button" 
                                                                    data-id="${lecturer.LId}" 
                                                                    data-name="${lecturer.LName}" 
                                                                    data-email="${lecturer.email}">
                                                                <span class="fas fa-edit has-text-success is-size-7"></span>
                                                            </button>
                                                            <a href="javascript:void(0);" 
                                                               class="button is-danger is-outlined"
                                                               data-role-id="${lecturer.roleId}"
                                                               data-status="${lecturer.status}"
                                                               onclick="updateStatus(this)">
                                                                <i class="fas fa-trash has-text-danger is-size-7"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="tab-3" class="tab-content is-hidden">
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
                                                        Status</th>
                                                    <th
                                                        class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                        Email</th>
                                                    <th
                                                        class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">
                                                        Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tableBody">
                                                <c:forEach var="lecturer" items="${supervisor}">
                                                    <tr>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.LName}" />
                                                        </td>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.LId}" />
                                                        </td>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.status}" />
                                                        </td>
                                                        <td class="has-text-centered" style="word-break: break-word;">
                                                            <c:out value="${lecturer.email}" />
                                                        </td>
                                                        <td class="has-text-centered">
                                                            <button class="button is-success is-outlined edit-button" 
                                                                    data-id="${lecturer.LId}" 
                                                                    data-name="${lecturer.LName}" 
                                                                    data-email="${lecturer.email}">
                                                                <span class="fas fa-edit has-text-success is-size-7"></span>
                                                            </button>
                                                            <a href="javascript:void(0);" 
                                                               class="button is-danger is-outlined"
                                                               data-role-id="${lecturer.roleId}"
                                                               data-status="${lecturer.status}"
                                                               onclick="updateStatus(this)">
                                                                <i class="fas fa-trash has-text-danger is-size-7"></i>
                                                            </a>

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
                            <div class="control">
                                <input class="px-4 py-2" type="hidden" id="lecturerPosition" name="position" value=" null"
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
        <!-- Modal -->
        <div class="modal custom-modal" id="registerLecturerModal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <header class="modal-card-head has-background-white" style="box-shadow: 0px 1px 1px 1px #dbdbdb;">
            <p class="modal-card-title has-text-weight-semibold has-text-grey-dark">Register Lecturer</p>
            <button class="delete" aria-label="close" id="closeModalButton"></button>
        </header>
        <section class="modal-card-body has-background-white">
            <form id="registerLecturerForm" class="columns m-0 p-0 is-multiline" action="${pageContext.request.contextPath}/AddLecturer" method="post" enctype="multipart/form-data">
                <input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.admin_id}">

                <!-- Added Radio Button Section -->
                <div class="column is-full p-2">
                    <label class="has-text-weight-semibold has-text-grey">Do this lecturer teach CSP600?</label>
                    <div class="">
                        <label class="radio has-text-grey">
                            <input type="radio" name="teaches_csp600" value="yes" required>
                            Yes
                        </label>
                        <label class="radio has-text-grey">
                            <input type="radio" name="teaches_csp600" value="no" required>
                            No
                        </label>
                    </div>
                </div>
                <!-- End of Radio Button Section -->

                <div class="column is-half p-2">
                    <label for="username" class="has-text-weight-semibold has-text-grey">Username:</label>
                    <div class="">
                        <input class="px-4 py-2" type="text" id="username" name="username" placeholder="Username" required 
                               style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                    </div>
                </div>

                <div class="column is-half p-2">
                    <label for="password" class="has-text-weight-semibold has-text-grey">Password:</label>
                    <div class="">
                        <input class="px-4 py-2" type="password" id="password" name="password" placeholder="Password" required 
                               style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                    </div>
                </div>

                <div class="column is-half p-2">
                    <label for="l_name" class="has-text-weight-semibold has-text-grey">Lecturer Name:</label>
                    <div class="">
                        <input class="px-4 py-2" type="text" id="l_name" name="l_name" placeholder="Full Name" required 
                               style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                    </div>
                </div>

                <div class="column is-half p-2">
                    <label for="l_course" class="has-text-weight-semibold has-text-grey">Lecturer Course:</label>
                    <div class="py-2">
                        <select id="l_course" name="l_course" class="px-4 py-2" type="text" required 
                                style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                            <option value="">Select Course</option>
                            <c:forEach var="course" items="${courseList}">
                                <option value="${course}">${course}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="column is-half p-2">
                    <label for="position" class="has-text-weight-semibold has-text-grey">Position:</label>
                    <div class="">
                        <select id="position" name="position" class="p-2" required style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                            <option value="">Select Position</option>
                            <option value="N/A">N/A</option>
                            <option value="Supervisor">Supervisor</option>
                            <option value="Examiner">Examiner</option>
                            <option value="Both">Both</option>
                        </select>
                    </div>
                </div>

                <div class="column is-half p-2">
                    <label for="f_id" class="has-text-weight-semibold has-text-grey">Faculty:</label>
                    <div class="">
                        <select id="f_id" name="f_id" class="p-2 dropdown" required 
                                style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                            <option value="">Select Faculty</option>
                            <c:forEach var="faculty" items="${facultyList}">
                                <option value="${faculty.fId}">${faculty.fName} :- ${faculty.fCourse}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="column is-half p-2">
                    <label for="phone_num" class="has-text-weight-semibold has-text-grey">Phone Number:</label>
                    <div class="">
                        <input class="px-4 py-2" type="text" id="phone_num" name="phone_num" placeholder="e.g: 0112345678" required 
                               style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                    </div>
                </div>

                <div class="column is-half p-2">
                    <label for="email" class="has-text-weight-semibold has-text-grey">Email:</label>
                    <div class="">
                        <input class="px-4 py-2" type="email" id="email" name="email" placeholder="@email.com" required 
                               style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                    </div>
                </div>

                <div class="column is-full p-2">
                    <label class="has-text-weight-semibold has-text-grey">Image</label>
                    <div class="py-1">
                        <div id="file-js-example" class="file has-name">
                            <label class="file-label">
                                <input class="file-input" type="file" name="l_image" />
                                <span class="file-cta" style="background-color: #3699FF; border: none;">
                                    <span class="file-icon">
                                        <i class="fas fa-upload"></i>
                                    </span>
                                    <span class="file-label">Choose a file?</span>
                                </span>
                                <span class="file-name has-text-grey">No file uploaded</span>
                            </label>
                        </div>
                    </div>
                </div>

                <footer class="modal-card-foot has-background-white is-flex is-justify-content-space-between p-4 w-100" style="border-top-color: #bdbdbd 1px solid;">
                    <a href="javascript:void(0);" class="button is-success has-text-white" onclick="confirmRegister(event)">Register</a>
                </footer>
            </form>
        </section>
    </div>
</div>


        <script>
            function confirmRegister(event) {
    event.preventDefault(); // Prevent the default form submission

    // Display the SweetAlert2 confirmation dialog
    Swal.fire({
        title: "Are you sure?",
        text: "Do you want to register this lecturer?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, register!"
    }).then((result) => {
        if (result.isConfirmed) {
            // If confirmed, show success message and submit the form
            Swal.fire({
                title: "Registered!",
                text: "The lecturer has been registered.",
                icon: "success",
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "OK"
            }).then(() => {
                // Find the form and submit it
                var form = document.getElementById('registerLecturerForm');
                if (form) {
                    form.submit();
                }
            });
        }
    });
}

        </script>

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

            function updateStatus(element) {    // Retrieve the data attributes from the clicked element
                var roleId = element.getAttribute('data-role-id');
                var status = element.getAttribute('data-status');


                // Construct the URL for the status update
                var url = "${pageContext.request.contextPath}/UpdateStatusServlet?roleId=" + encodeURIComponent(roleId) + "&status=" + encodeURIComponent(status);

                // Display the SweetAlert2 confirmation dialog
                Swal.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, update it!"
                }).then((result) => {
                    if (result.isConfirmed) {
                        // If confirmed, navigate to the constructed URL

                        Swal.fire({
                            title: "Deleted!",
                            text: "Your file has been deleted.",
                            icon: "success",
                            confirmButtonColor: "#3085d6",
                            cancelButtonColor: "#d33",
                            confirmButtonText: "OK"
                        }).then(() => {
                            // Navigate to the constructed URL after confirmation
                            window.location.href = url;
                        });

                    }
                });
            }



        </script>


    </body>

</html>