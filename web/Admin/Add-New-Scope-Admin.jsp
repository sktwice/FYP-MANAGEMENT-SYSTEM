<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.fyp.model.bean.Admin" %>
<%@ page import="com.fyp.model.bean.Lecturer" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../admin-sidebar.jsp"></jsp:include>
                <div class="main-content">
                    <div class="column px-6 py-3 h-100" style="background-color:#FFFFFF;">

                        <div class="has-text-weight-semibold has-text-grey is-size-5 p-4" style="border-bottom: 1px solid #bdbdbd">
                            Add New Scope
                        </div>
                        <form action="insertScope" method="post">
                            <div class="p-4">
                                <input type="hidden" name="adminId" value="${sessionScope.admin_id }"/>
                            <input type="hidden" name="lId" value="0" />
                            <label class="has-text-weight-semibold has-text-grey">Scope</label>
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" name="scopeName" placeholder="Scope Name" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                            <label class="has-text-weight-semibold has-text-grey">Programme</label>
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" name="program" placeholder="Programme" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                            <label class="has-text-weight-semibold has-text-grey">Session</label>
                            <div class="py-2">
                                <input class="px-4 py-2" type="text" name="session" placeholder="Session" style="width: 100%; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                            </div>
                        </div>
                        <div class="is-flex is-justify-content-space-between p-4">
                            <a class="button is-custom2" href="${pageContext.request.contextPath}/ListScopeServlet"><span class="has-text-weight-semibold is-size-7">Back</span></a>
                            <button type="submit" class="button is-custom4">
                                <span class="has-text-weight-semibold is-size-7">Save Changes</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
