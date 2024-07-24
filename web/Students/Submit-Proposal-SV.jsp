<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="height:100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <title>Proposal Submission</title>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../student-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column p-6 is-justify-content-center" style="background-color:#FFFFFF; overflow-y: scroll;">
                        <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                            Submit Proposal
                        </div>
                        <form action="${pageContext.request.contextPath}/ProposalSvServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" id="lecturerId" name="lecturerId" value="${param.lecturerId}">
                        <input type="hidden" id="svId" name="svId" value="${param.svId}">
                        <div class="columns is-multiline m-0 p-0">
                            <div class="column is-2" style="align-content: center">
                                <label class="has-text-weight-semibold has-text-grey">Semester</label>
                            </div>
                            <div class="column is-10">
                                <div class="py-2">
                                    <input class="px-4 py-2" type="text" name="semester" id="semester" placeholder="Semester" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                                </div>
                            </div>
                            <div class="column is-2" style="align-content: center">
                                <label class="has-text-weight-semibold has-text-grey">Proposal Title</label>
                            </div>
                            <div class="column is-10">
                                <div class="py-2">
                                    <input class="px-4 py-2" type="text" name="topic" id="topic" placeholder="Proposal Title" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                                </div>
                            </div>
                            <div class="column is-2" style="align-content: center">
                                <label class="has-text-weight-semibold has-text-grey">Scope </label>
                            </div>
                            <div class="column is-10">
                                <div class="py-2">
                                    <select class="px-4 py-2 has-text-grey" name="scopeId" id="scopeId" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;" required>
                                        <option value="">Select Scope</option>
                                        <c:forEach var="scope" items="${scopeList}">
                                            <option value="${scope.scopeId}">${scope.scopeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="column is-2" style="align-content: center">
                                <label class="has-text-weight-semibold has-text-grey">Domain </label>
                            </div>
                            <div class="column is-10">
                                <div class="py-2">
                                    <select class="px-4 py-2 has-text-grey" name="domain" id="domain" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;" required>
                                        <option value="">Select Domain</option>
                                        <option value="Finance">Finance</option>
                                        <option value="Human Resources">Human Resources</option>
                                        <option value="Sport">Sport</option>
                                        <option value="AI">AI</option>
                                    </select>
                                </div>
                            </div>
                            <div class="column is-2">
                                <label class="has-text-weight-semibold has-text-grey" for="pdfFile">Upload Proposal</label>
                            </div>
                            <div class="column is-10">
                                <div id="file-js-example" class="file has-name">
                                    <label class="file-label">
                                        <input class="file-input" type="file" name="pdfFile" />
                                        <span class="file-cta is-size-7" style="background-color: #3699FF; border: none;">
                                            <span class="file-icon is-size-7">
                                                <i class="fas fa-upload"></i>
                                            </span>
                                            <span class="file-label is-size-7">Choose a file…</span>
                                        </span>
                                        <span class="file-name has-text-grey is-size-7">No file uploaded</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="buttons pt-5 pl-3 pr-5 is-justify-content-space-between">
                            <a class="button is-custom2 is-size-7">Cancel</a>
                            <button class="button is-custom4 is-size-7" type="submit">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>