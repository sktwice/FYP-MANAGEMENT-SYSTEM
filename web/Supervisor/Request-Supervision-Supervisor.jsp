<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.fyp.model.bean.Proposal" %>

<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Request Supervision</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<style>
        .modal-body ul {
            list-style-type: disc;
            margin-left: 20px;
        }
    </style>
<body>
    <div class="content-wrapper">
        <jsp:include page="../supervisor-sidebar.jsp"></jsp:include>
        <div class="main-content">
            <div class="column h-100 px-6 py-3" style="background-color: #FFFFFF; overflow-y: scroll;">
                <div class="pb-3 is-flex is-justify-content-end is-align-items-center">
                    <input id="searchInput" class="px-4 mx-4 my-1" type="text" placeholder="Search" style="width: 18rem; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
                    <span class="has-background-black" style="border-radius: 100%; width: 40px; height: 40px;">
                        <img src="">
                    </span>
                </div>
                <div class="custom-border p-6 w-100">
                    <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                        <div>
                            <label class="has-text-weight-bold has-text-grey is-size-5">All Request</label>
                            <p class="has-text-grey-light is-size-7">Student Proposal Request</p>
                        </div>
                    </div>
                    <div>
                        <div class="p-1" id="table">
                            <table class="table">
                                <thead>
                                    <tr style="border-bottom: 2px solid #ddd;">
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Topic</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Matric ID</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Semester</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Proposal</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Status</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="tableBody">
                                <%
                                    List<Proposal> proposals = (List<Proposal>) request.getAttribute("listProposals");
                                    if (proposals != null) {
                                        for (Proposal proposal : proposals) {
                                %>
                                <tr>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" 
                                        data-label="Topic" style="align-content:center;"><%= proposal.getTopic() %>
                                    </td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" 
                                        data-label="Matric ID" style="align-content:center;"><%= proposal.getStudentId() %>
                                    </td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" 
                                        data-label="Semester" style="align-content:center;"><%= proposal.getSemester() %>
                                    </td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" 
                                        data-label="Proposal" style="align-content:center;">
                                        <div class="">
                                            <a class="button is-info is-outlined is-small" href="${pageContext.request.contextPath}/DownloadProposalServlet?proposalId=<%= proposal.getProposalId() %>">
                                                <i class="fas fa-download"></i>
                                            </a>
                                        </div>
                                    </td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" 
                                        data-label="Status" style="align-content:center; text-transform: uppercase;"><%= proposal.getStatus() %>
                                    </td>
                                    <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered p-4">
                                        <button class="btn btn-success btn-sm mx-1 mb-1" data-toggle="modal" style="width:5rem;" data-target="#acceptModal-<%= proposal.getProposalId() %>">Accept</button>
                                        <button class="btn btn-danger btn-sm mx-1 mb-1" data-toggle="modal" style="width:5rem;" data-target="#rejectModal-<%= proposal.getProposalId() %>">Reject</button>

                                        <!-- Accept Modal -->
                                        <div class="modal fade" id="acceptModal-<%= proposal.getProposalId() %>" tabindex="-1" role="dialog" aria-labelledby="acceptModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title has-text-weight-semibold is-size-5" id="acceptModalLabel">Terms and Condition</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p class="has-text-weight-semibold has-text-grey is-size-6 p-3">EXPECTATION OF STUDENT FROM THE SUPERVISOR & CO-SUPERVISOR</p>
                                                        <ul>
                                                            <li class="has-text-weight-normal has-text-grey is-size-6">The supervisor should meet the student on a weekly basis at a mutually agreed day and time suitable to both parties. Any meeting changes should be communicated in advance to the student to facilitate re-scheduling.</li>
                                                            <li class="has-text-weight-normal has-text-grey is-size-6">The supervisor should advise, guide, and assess the student’s proposal/project work throughout the duration of the project formulation/project course.</li>
                                                            <li class="has-text-weight-normal has-text-grey is-size-6">The supervisor should motivate and encourage the student’s initiative in taking responsibility for his/her own project through to completion.</li>
                                                            <li class="has-text-weight-normal has-text-grey is-size-6">The supervisor should regularly update the student on his/her performance. A weak or non-compliant performance from the student should be communicated to the course lecturer and/or project coordinator for further action.</li>
                                                            <li class="has-text-weight-normal has-text-grey is-size-6">The supervisor reserves the right under special circumstances to discontinue his/her supervisory role with the student after the project formulation phase. This matter should be communicated to the project coordinator for further action.</li>
                                                            <li class="has-text-weight-normal has-text-grey is-size-6">At all times, mutual respect and courtesy should be observed between the supervisor and the student.</li>
                                                        </ul>
                                                        <p class="has-text-weight-normal has-text-grey is-size-6">I hereby understand the above mentioned Terms and Conditions.</p>
                                                        <p class="has-text-weight-normal has-text-grey is-size-6">I hereby agree to supervise the student.</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <form action="<%= request.getContextPath() %>/AcceptProposalServlet" method="post">
                                                            <input type="hidden" name="proposalId" value="<%= proposal.getProposalId() %>">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                            <button type="submit" class="btn btn-success">Agree</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Reject Modal -->
                                        <div class="modal fade" id="rejectModal-<%= proposal.getProposalId() %>" tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title has-text-weight-semibold is-size-5" id="rejectModalLabel">Reject Proposal</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Are you sure you want to reject this proposal?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <form action="<%= request.getContextPath() %>/RejectProposalServlet" method="post">
                                                            <input type="hidden" name="proposalId" value="<%= proposal.getProposalId() %>">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                            <button type="submit" class="btn btn-danger">Reject</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
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
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
