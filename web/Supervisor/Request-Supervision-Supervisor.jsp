<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.fyp.model.bean.Proposal" %>

<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .button.is-nav {
            background-color: #14161a;
            border-color: #fff;
            color: #fff;
        }
        .button.is-nav:hover, .button.nav.is-hovered {
            background-color: #a0e4d1;
            border-color: #14161a;
            color: #090a0c;
        }
        .button.is-nav.is-outlined:hover, .button.is-nav.is-outlined.is-hovered, .button.is-custom.is-outlined:focus, .button.is-nav.is-outlined.is-focused {
            background-color: #fff;
            border-color: #fff;
            color: #090a0c;
        }
    </style>
</head>
<body style="height: 100%;">
    <div class="is-flex is-justify-content-space-between is-mobile-visible">
        <div class="is-mobile-visible p-2">
            <img src="${pageContext.request.contextPath}/assets/uitm-logo.png" style="height: 30px; width: 60px;">
        </div>
        <button role="button" class="navbar-burger is-mobile-visible" data-target="navMenu" aria-label="menu" aria-expanded="false">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
        </button>
    </div>
    <div class="p-2 navbar-menu is-mobile-visible" id="navMenu">
        <nav class="navbar" role="navigation" aria-label="dropdown navigation">
            <div class="navbar-item has-dropdown">
                <div class="navbar-dropdown">
                    <a class="box has-text-black navbar-item p-4 m-0" style="background-color: #a0e4d1;">
                        <span class="fas fa-home pr-2"></span>
                        <span class="is-size-7">Dashboard</span>
                    </a>
                    <a class="navbar-item p-4" href="../Lecturers/UserProfile-Lecturer.jsp">
                        <span class="fas fa-user pr-4"></span>
                        <span class="is-size-7">Profile</span>
                    </a>
                    <a class="navbar-item p-4" href="../Lecturers/Report-Lecturer.jsp">
                        <span class="fas fa-inbox pr-4 is-size-7"></span>
                        <span class="is-size-7">Reports</span>
                    </a>
                    <a class="navbar-item p-4" href="../Lecturers/Form-Lecturer.jsp">
                        <span class="fas fa-book pr-4 is-size-7"></span>
                        <span class="is-size-7">Form</span>
                    </a>
                    <a class="navbar-item p-4" href="../Lecturers/Scope-Lecturer.jsp">
                        <span class="fas fa-book pr-4 is-size-7"></span>
                        <span class="is-size-7">Scope</span>
                    </a>
                    <a class="navbar-item p-4" href="../Lecturers/StudentList-Supervision.jsp">
                        <span class="fas fa-circle-plus pr-4 is-size-7"></span>
                        <span class="is-size-7">Supervision</span>
                    </a>
                    <a class="navbar-item p-4">
                        <span class="fas fa-arrow-right-from-bracket pr-4"></span>
                        <span class="is-size-7">Sign-out</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>
    <div class="columns m-0 p-0 h-100">
        <div class="p-2 column is-2 is-desktop-visible">
            <aside class="menu">
                <p class="menu-label p-1 m-0">
                    <img src="${pageContext.request.contextPath}/assets/uitm-logo.png" style="height: 50px; width: 142px;">
                </p>
                <ul class="menu-list">
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Lecturers/Dashboard-Lecturer.jsp">
                            <span class="fas fa-home pr-2 is-size-7"></span>
                            <span class="is-size-7">Dashboard</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Lecturers/UserProfile-Lecturer.jsp">
                            <span class="fas fa-user pr-4 is-size-7"></span>
                            <span class="is-size-7">Profile</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Lecturers/Report-Lecturer.jsp">
                            <span class="fas fa-inbox pr-4 is-size-7"></span>
                            <span class="is-size-7">Reports</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="box has-text-black navbar-item p-4" style="background-color: #a0e4d1;">
                            <span class="fas fa-file-pen pr-4 is-size-7"></span>
                            <span class="is-size-7">Form</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Lecturers/Scope-Lecturer.jsp">
                            <span class="fas fa-book pr-4"></span>
                            <span class="is-size-7">Scope</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4" href="../Lecturers/StudentList-Supervision.jsp">
                            <span class="fas fa-circle-plus pr-4 is-size-7"></span>
                            <span class="is-size-7">Supervision</span>
                        </a>
                    </li>
                    <li class="py-1">
                        <a class="button is-nav navbar-item p-4">
                            <span class="fas fa-arrow-right-from-bracket pr-4 is-size-7"></span>
                            <span class="is-size-7">Sign-out</span>
                        </a>
                    </li>
                </ul>
            </aside>
        </div>
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
                                    <li><a href="#" class="pagination-link has-background-grey-lighter" style="border: 0;" aria-label="Goto page before"><</a></li>
                                    <li><a class="pagination-link is-current" aria-label="Goto page 1">1</a></li>
                                    <li><a href="#" class="pagination-link has-background-grey-lighter" style="border: 0;" aria-label="Page 2" aria-current="page">2</a></li>
                                    <li><a href="#" class="pagination-link has-background-grey-lighter" style="border: 0;" aria-label="Goto page 3">3</a></li>
                                    <li><span class="pagination-ellipsis">&hellip;</span></li>
                                    <li><a href="#" class="pagination-link has-background-grey-lighter" style="border: 0;" aria-label="Goto page next">86</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {

            // Get all "navbar-burger" elements
            const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

            // Add a click event on each of them
            $navbarBurgers.forEach(el => {
                el.addEventListener('click', () => {

                    // Get the target from the "data-target" attribute
                    const target = el.dataset.target;
                    const $target = document.getElementById(target);

                    // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
                    el.classList.toggle('is-active');
                    $target.classList.toggle('is-active');

                });
            });

        });
    </script>
</body>
</html>
