<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Students List Supervision</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="height:100%;">
   <div class="content-wrapper">
        <% 
        String userCategory = (String) session.getAttribute("userCategory");
    
    if(userCategory.equals("lecturer")){
        %> <jsp:include page="../lecturer-sidebar.jsp"></jsp:include> <%
            } 
        %>
        <div class="main-content">
    <div class="column h-100 p-6" style="background-color:#FFFFFF; overflow-y: scroll;">
        <div class="custom-border p-6 w-100">
            <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                <div>
                    <label class="has-text-weight-bold has-text-grey is-size-5">Student List Without Examiner</label>
                    <p class="has-text-success is-size-7">Students with accepted Supervisor</p>
                </div>
                <div class="columns m-0 p-0">
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
            </div>
            </div>
            <div class="p-3">
                <table class="">
                    <thead>
                        <tr class="" style="border-bottom: 2px solid #ddd;">
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Matric ID</th>
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Student Name</th>
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Project Title</th>
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="assign" items="${projectStudents}">
                            <tr>
                                <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Matric ID">${assign.studentId}</td>
                                <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Student Name">${assign.studentName}</td>
                                <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Project Title">${assign.projectTitle}</td>
                                <td class="is-size-7 has-text-centered" data-label="Action">
                                    <button class="button is-small is-info" onclick="openAssignModal(${assign.studentId})">Assign</button>
                                </td>
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
                        <li><a href="#" class="pagination-link has-background-grey-lighter has-text-black" style="border: 0;" aria-label="Goto page before"><</a></li>
                        <li><a class="pagination-link is-current" aria-label="Goto page 1">1</a></li>
                        <li><a href="#" class="pagination-link has-background-grey-lighter has-text-black" style="border: 0;" aria-label="Page 2" aria-current="page">2</a></li>
                        <li><a href="#" class="pagination-link has-background-grey-lighter has-text-black" style="border: 0;" aria-label="Goto page 3">3</a></li>
                        <li><span class="pagination-ellipsis">&hellip;</span></li>
                        <li><a href="#" class="pagination-link has-background-grey-lighter has-text-black" style="border: 0;" aria-label="Goto page next">86</a></li>
                      </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
   </div>

<!-- Existing HTML content in AssignExaminer.jsp -->

<!-- Modal for selecting an examiner -->
<!-- Modal for Assign Examiner -->
<div id="assignModal" class="modal">
    <div class="modal-background"></div>
    <div class="modal-content">
        <div class="box">
            <h2 class="title is-4">Assign Examiner</h2>
            <form id="assignForm" action="UpdateExaminerServlet" method="post">
                <input type="hidden" id="studentId" name="studentId" value="">
                <div class="field">
                    <label class="label">Select Examiner</label>
                    <div class="control">
                        <div class="select">
                            <select name="examinerId" id="examinerId">
                                <c:forEach var="examiner" items="${examiners}">
                                    <option value="${examiner.exId}">${examiner.LName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="field is-grouped">
                    <div class="control">
                        <button type="submit" class="button is-info">Assign</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <button class="modal-close is-large" aria-label="close" onclick="closeModal()"></button>
</div>

<!-- JavaScript to handle modal -->
<script>
    function openAssignModal(studentId) {
        var modal = document.getElementById('assignModal');
        var hiddenInput = document.getElementById('studentId');
        hiddenInput.value = studentId;  // Set the studentId in the hidden input field
        modal.classList.add('is-active');  // Add 'is-active' class to show the modal
    }

    function closeModal() {
        var modal = document.getElementById('assignModal');
        modal.classList.remove('is-active');  // Remove 'is-active' class to hide the modal
    }
    
    
</script>


</body>
</html>