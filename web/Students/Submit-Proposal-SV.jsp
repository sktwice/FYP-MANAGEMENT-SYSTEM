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
    <title>Submit Proposal</title>
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
                            <label class="has-text-weight-semibold has-text-grey">Semester:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" name="semester" id="semester" placeholder="Semester" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="column is-2" style="align-content: center">
                            <label class="has-text-weight-semibold has-text-grey">Proposal Title:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" name="topic" id="topic" placeholder="Proposal Title" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="column is-2" style="align-content: center">
                            <label class="has-text-weight-semibold has-text-grey">Scope: </label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <select class="px-4 py-2" name="scopeId" id="scopeId" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;" required>
                                    <option value="">Select Scope</option>
                                    <c:forEach var="scope" items="${scopeList}">
                                        <option value="${scope.scopeId}">${scope.scopeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="column is-2" style="align-content: center">
                            <label class="has-text-weight-semibold has-text-grey">Domain: </label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <select class="px-4 py-2" name="domain" id="domain" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;" required>
                                    <option value="">Select Domain</option>
                                    <option value="Finance">Finance</option>
                                    <option value="Human Resources">Human Resources</option>
                                    <option value="Sport">Sport</option>
                                    <option value="AI">AI</option>
                                </select>
                            </div>
                        </div>
                        <div class="column is-2">
                            <label class="has-text-weight-semibold has-text-grey" for="pdfFile">Upload Proposal:</label>
                        </div>
                        <div class="column is-10">
                            <div class="py-2">
                                <input class="px-4 py-2" type="file" name="pdfFile" id="pdfFile" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;" required>
                            </div>
                        </div>
                    </div>
                    <div class="buttons pt-5 pl-3 pr-5 is-justify-content-space-between">
                        <a class="button is-custom is-soft">Cancel</a>
                        <button class="button is-custom is-soft" type="submit">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        window.onbeforeunload = function () {
            return "Your work will be lost.";
        };
    </script>
</body>
</html>
