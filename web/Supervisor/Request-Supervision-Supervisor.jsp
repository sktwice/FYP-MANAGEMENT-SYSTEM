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
    <body>
        <div class="content-wrapper">
            <jsp:include page="../supervisor-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column h-100 px-6 py-3" style="background-color: #FFFFFF; overflow-y: scroll;">
                        <div class="pb-3 is-flex is-justify-content-end is-align-items-center">
                            <input class="px-4 mx-4 my-1" type="text" placeholder="Search" style="width: 18rem; border-radius: 6px; border-width: 1px; border-color: #bdbdbd; outline: none;">
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
                                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Status</th>
                                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            List<Proposal> proposals = (List<Proposal>) request.getAttribute("listProposals");
                                            if (proposals != null) {
                                                for (Proposal proposal : proposals) {
                                        %>
                                        <tr>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered p-4" data-label="Topic"><%= proposal.getTopic() %></td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered p-4" data-label="Matric ID"><%= proposal.getStudentId() %></td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered p-4" data-label="Semester"><%= proposal.getSemester() %></td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered p-4" data-label="Status"><%= proposal.getStatus() %></td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered p-4" data-label="Action">
                                                <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#acceptModal-<%= proposal.getProposalId() %>">Accept</button>
                                                <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#rejectModal-<%= proposal.getProposalId() %>">Reject</button>

                                                <!-- Accept Modal -->
                                                <div class="modal fade" id="acceptModal-<%= proposal.getProposalId() %>" tabindex="-1" role="dialog" aria-labelledby="acceptModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="acceptModalLabel">Terms and Condition</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>EXPECTATION OF STUDENT FROM THE SUPERVISOR & CO-SUPERVISOR</p>
                                                                <ul>
                                                                    <li>The supervisor should meet the student on a weekly basis at a mutually agreed day and time suitable to both parties. Any meeting changes should be communicated in advance to the student to facilitate re-scheduling.</li>
                                                                    <li>The supervisor should advise, guide, and assess the student’s proposal/project work throughout the duration of the project formulation/project course.</li>
                                                                    <li>The supervisor should motivate and encourage the student’s initiative in taking responsibility for his/her own project through to completion.</li>
                                                                    <li>The supervisor should regularly update the student on his/her performance. A weak or non-compliant performance from the student should be communicated to the course lecturer and/or project coordinator for further action.</li>
                                                                    <li>The supervisor reserves the right under special circumstances to discontinue his/her supervisory role with the student after the project formulation phase. This matter should be communicated to the project coordinator for further action.</li>
                                                                    <li>At all times, mutual respect and courtesy should be observed between the supervisor and the student.</li>
                                                                </ul>
                                                                <p>I hereby understand the above mentioned Terms and Conditions.</p>
                                                                <p>I hereby agree to supervise the above mentioned student.</p>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <form action="<%= request.getContextPath() %>/AcceptProposalServlet" method="post">
                                                                    <input type="hidden" name="proposalId" value="<%= proposal.getProposalId() %>">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                                    <button type="submit" class="btn btn-primary">Agree</button>
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
                                                                <h5 class="modal-title" id="rejectModalLabel">Reject Proposal</h5>
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
                            <div class="p-3 is-flex is-justify-content-space-between">
                                <label class="has-text-grey-light is-size-7">Showing data 1 to 8 of 256k entries</label>
                                <div>
                                    <nav class="pagination is-right" role="navigation" aria-label="pagination">
                                        <ul class="pagination-list">
                                            <li><a href="#" class="pagination-link has-background-grey-lighter has-text-grey" style="border: 0;" aria-label="Goto page before"><</a></li>
                                            <li><a class="pagination-link is-current has-text-white" aria-label="Goto page 1">1</a></li>
                                            <li><a href="#" class="pagination-link has-background-grey-lighter has-text-grey" style="border: 0;" aria-label="Page 2" aria-current="page">2</a></li>
                                            <li><a href="#" class="pagination-link has-background-grey-lighter has-text-grey" style="border: 0;" aria-label="Goto page 3">3</a></li>
                                            <li><span class="pagination-ellipsis">&hellip;</span></li>
                                            <li><a href="#" class="pagination-link has-background-grey-lighter has-text-grey" style="border: 0;" aria-label="Goto page next">86</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
