<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.fyp.model.bean.Proposal" %>
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
                return false;
            } else if (status === "rejected") {
                if (confirm("Are you sure you want to delete this proposal?")) {
                    return true; // Proceed with form submission
                }
                return false;
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
            <div class="column h-100 px-6 py-6" style="background-color: #FFFFFF; overflow-y: scroll;">
                <div class="pt-5">
                    <div class="custom-border p-3 pt-4 w-100">
                        <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                            <div>
                                <label class="pl-4 has-text-weight-bold has-text-grey is-size-5">My Proposals</label>
                            </div>
                        </div>
                        <div>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Lecturer ID</th>
                                        <th>Topic</th>
                                        <th>Status</th>
                                        <th>Action</th> <!-- New column for action buttons -->
                                    </tr>
                                </thead>
                                <tbody>
                                    <% List<Proposal> listProposals = (List<Proposal>) request.getAttribute("listProposals");
                                        if (listProposals != null) {
                                            for (Proposal proposal : listProposals) {
                                    %>
                                    <tr>
                                        <td><%= proposal.getlId() %></td>
                                        <td><%= proposal.getTopic() %></td>
                                        <td><%= proposal.getStatus() %></td>
                                        <td>
                                            <% if ("accepted".equals(proposal.getStatus())) { %>
                                                <form id="agreeForm_<%= proposal.getProposalId() %>" method="post" action="AcceptProposalServlet" onsubmit="return confirmAction('<%= proposal.getStatus() %>', <%= proposal.getProposalId() %>)">
                                                    <input type="hidden" name="proposalId" value="<%= proposal.getProposalId() %>">
                                                    <button class="button is-success is-small" type="submit">Agree</button>
                                                </form>
                                            <% } else if ("rejected".equals(proposal.getStatus())) { %>
                                                <form id="acceptForm_<%= proposal.getProposalId() %>" method="post" action="<%= request.getContextPath() %>/DeleteProposalServlet" onsubmit="return confirmAction('<%= proposal.getStatus() %>', <%= proposal.getProposalId() %>)">
                                                    <input type="hidden" name="proposalId" value="<%= proposal.getProposalId() %>">
                                                    <button class="button is-success is-small" type="submit">Accept</button>
                                                </form>
                                            <% } %>
                                        </td>
                                    </tr>
                                    <%      }
                                        }
                                    %>
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
                    <h5 class="modal-title" id="acceptModalLabel">Terms and Conditions</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>EXPECTATION OF SUPERVISOR(S ) FROM THE STUDENT </p>
                    <ul>
                        <li>The student should apply his/her acquired skills and knowledge to produce a substantially successful and original project. </li>
                        <li>The student should be responsible for the completion of his/her project without undue dependence on his/her supervisor. </li>
                        <li>The student should be punctual for the weekly meetings with his/her supervisor. Any meeting changes should be communicated in advance to the supervisor to facilitate re-scheduling</li>
                        <li>The student reserves the right under special circumstances to discontinue his/her supervision with the supervisor after the project formulation phase. This matter should be communicated to the project coordinator for further action.</li>
                        <li>At all times, mutual respect and courtesy should be observed between the supervisor and the student. </li>
                    </ul>
                    <p>I hereby understand the above mentioned Terms and Conditions and I hereby agree to be supervised by the mentioned lecturer and that the project will be the sole property of UiTM Malaysia.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="agreeToTerms()">Agree</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
