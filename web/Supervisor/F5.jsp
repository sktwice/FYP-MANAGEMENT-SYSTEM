<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.fyp.model.bean.Form5" %>
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
<body>
    <div class="content-wrapper">
        <jsp:include page="../supervisor-sidebar.jsp"></jsp:include>
        <div class="main-content">
            <div class="column h-100 px-6 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
                <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                    F5 – PROPOSAL/PROJECT IN-PROGRESS FORM
                </div>
                <div class="pt-4">
                    <div class="custom-border p-5 w-100">
                        <div class="p-1" id="table">
                            <table class="">
                                <thead>
                                    <tr style="border-bottom: 2px solid #ddd;">
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Date Meet</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Completed Activity</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Next Activity</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Approval</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="form5" items="${form5List}">
                                        <tr>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.dateMeet}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.completeActivity}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.nextActivity}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">${form5.approval}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                                <button class="button is-info is-outlined is-small" onclick="openUpdateModal(${form5.formId}, '${form5.nextActivity}', '${form5.approval}')">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <br>
                            <!-- Add the Back button here -->
                            <a href="FormSVServlet" class="button is-info is-outlined is-small">
                                Back
                            </a>
                            <!-- Pagination or other elements can be added here if necessary -->
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Update Modal -->
        <div id="updateModal" class="modal">
            <div class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head has-background-white" style="box-shadow: 0px 1px 1px 1px #dbdbdb;">
                    <p class="modal-card-title has-text-weight-semibold has-text-grey-dark">Update Form5</p>
                    <button class="delete" aria-label="close" onclick="closeUpdateModal()"></button>
                </header>
                <form id="updateForm" action="${pageContext.request.contextPath}/UpdateForm5Servlet" method="post">
                <section class="modal-card-body has-background-white" style="box-shadow: 0px 1px 1px 1px #dbdbdb;">
                    
                        <input type="hidden" name="formId" id="updateFormId">
                        <div class="field">
                            <label class="has-text-weight-semibold has-text-grey">Next Activity</label>
                            <div class="control">
                                <input class="px-4 py-2" type="text" name="nextActivity" id="updateNextActivity" required
                                       style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="field">
                            <label class="has-text-weight-semibold has-text-grey">Approval</label>
                            <div class="control">
                                <input class="px-4 py-2" type="text" name="approval" id="updateApproval" required
                                       style="width: 100%; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                    
                </section>
                <footer class="modal-card-foot has-background-white is-flex is-justify-content-end">
                    <button class="button is-success has-text-white" type="submit">Save changes</button>
                </footer> 
                </form>        
            </div>
        </div>
    </div>
    <script>
        function openUpdateModal(formId, nextActivity, approval) {
            document.getElementById('updateFormId').value = formId;
            document.getElementById('updateNextActivity').value = nextActivity;
            document.getElementById('updateApproval').value = approval;
            document.getElementById('updateModal').classList.add('is-active');
        }

        function closeUpdateModal() {
            document.getElementById('updateModal').classList.remove('is-active');
        }
    </script>

</body>
</html>