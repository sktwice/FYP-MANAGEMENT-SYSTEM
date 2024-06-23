<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Proposal</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .modal-body ul {
            list-style-type: disc;
            margin-left: 20px;
        }
    </style>
    <script>
        function confirmAction(status, proposalId) {
            if (status === "accepted") {
                $('#acceptModal').modal('show');
                $('#proposalIdInput').val(proposalId);
                return false;
            } else if (status === "rejected") {
                return confirm("Are you sure you want to delete this proposal?");
            } else {
                return confirm("Are you sure you want to delete this proposal?");
            }
        }

        function agreeToTerms() {
            document.getElementById("acceptForm").submit();
        }
    </script>
</head>
<body>
    <div class="content-wrapper">
        <jsp:include page="../student-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column h-100 px-6 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
                    <div class="pb-3 is-flex is-justify-content-end is-align-items-center">
                        <input class="px-4 mx-4 my-1" type="text" placeholder="Search" style="width: 18rem; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        <span class="has-background-black" style="border-radius: 100%; width: 40px; height: 40px;">
                            <img src="">
                        </span>
                    </div>
                    <div class="custom-border p-3 pt-4 w-100">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                            <div>
                                <label class="pl-4 has-text-weight-bold has-text-grey is-size-5">List of Lecturers</label>
                            </div>
                        </div>
                        <div>
                            <table >
                                <thead>
                                    <tr>
                                        <th class="has-text-grey has-text-weight-semibold has-text-centered is-size-7">Lecturer ID</th>
                                        <th class="has-text-grey has-text-weight-semibold has-text-centered is-size-7">Topic</th>
                                        <th class="has-text-grey has-text-weight-semibold has-text-centered is-size-7">Status</th>
                                        <th class="has-text-grey has-text-weight-semibold has-text-centered is-size-7">Action</th> <!-- New column for action buttons -->
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="proposal" items="${listProposals}">
                                    <tr>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered is-size-7">${proposal.svId}</td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered is-size-7">${proposal.topic}</td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered is-size-7">${proposal.status}</td>
                                        <td class="has-text-grey has-text-weight-semibold has-text-centered is-size-7">
                                            <c:choose>
                                                <c:when test="${proposal.status eq 'accepted'}">
                                                    <form id="agreeForm_${proposal.proposalId}" method="post" action="../AgreementServlet" onsubmit="return confirmAction('${proposal.status}', '${proposal.proposalId}')">
                                                        <input type="hidden" name="proposalId" value="${proposal.proposalId}">
                                                        <button class="button is-custom3 is-small" type="submit">Agree</button>
                                                    </form>
                                                </c:when>
                                                <c:when test="${proposal.status eq 'rejected'}">
                                                    <form id="acceptForm_${proposal.proposalId}" method="post" action="${pageContext.request.contextPath}/DeleteProposalServlet" onsubmit="return confirmAction('${proposal.status}', '${proposal.proposalId}')">
                                                        <input type="hidden" name="proposalId" value="${proposal.proposalId}">
                                                        <button class="button is-custom3 is-small" type="submit">Accept</button>
                                                    </form>
                                                </c:when>
                                            </c:choose>
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

<!-- Modal -->
<div class="modal fade" id="acceptModal" tabindex="-1" role="dialog" aria-labelledby="acceptModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title has-text-weight-semibold has-text-grey is-size-5" id="acceptModalLabel">Terms and Conditions</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="has-text-weight-semibold has-text-grey is-size-6 p-3">EXPECTATION OF SUPERVISOR(S ) FROM THE STUDENT </p>
                <ul>
                    <li class="has-text-weight-normal has-text-grey is-size-6">The student should apply his/her acquired skills and knowledge to produce a substantially successful and original project. </li>
                    <li class="has-text-weight-normal has-text-grey is-size-6">The student should be responsible for the completion of his/her project without undue dependence on his/her supervisor. </li>
                    <li class="has-text-weight-normal has-text-grey is-size-6">The student should be punctual for the weekly meetings with his/her supervisor. Any meeting changes should be communicated in advance to the supervisor to facilitate re-scheduling</li>
                    <li class="has-text-weight-normal has-text-grey is-size-6">The student reserves the right under special circumstances to discontinue his/her supervision with the supervisor after the project formulation phase. This matter should be communicated to the project coordinator for further action.</li>
                    <li class="has-text-weight-normal has-text-grey is-size-6">At all times, mutual respect and courtesy should be observed between the supervisor and the student. </li>
                </ul>
                <p class="has-text-weight-normal has-text-grey is-size-6">I hereby understand the above mentioned Terms and Conditions and I hereby agree to be supervised by the mentioned lecturer and that the project will be the sole property of UiTM Malaysia.</p>
            </div>
            <div class="modal-footer">
                <form id="acceptForm" method="post" action="../AgreementServlet">
                    <input type="hidden" id="proposalIdInput" name="proposalId" value="">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="agreeToTerms()">Agree</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>