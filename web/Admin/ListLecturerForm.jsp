<%@ page import="com.fyp.model.bean.Faculty" %>
<%@ page import="com.fyp.model.bean.Lecturer" %>
<html>
<head>
    <title>Edit Lecturer</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="updateLecturer" method="post">
                <% if (request.getAttribute("lecturer") != null) { %>
                    <input type="hidden" name="id" value="<%= ((Lecturer) request.getAttribute("lecturer")).getlId() %>" />
                    <h2>Edit Lecturer</h2>
                    <fieldset class="form-group">
                        <label>Lecturer Name</label>
                        <input type="text" value="<%= ((Lecturer) request.getAttribute("lecturer")).getlName() %>" class="form-control" name="lName" required="required">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Position</label>
                        <input type="text" value="<%= ((Lecturer) request.getAttribute("lecturer")).getPosition() %>" class="form-control" name="position">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Email</label>
                        <input type="text" value="<%= ((Lecturer) request.getAttribute("lecturer")).getEmail() %>" class="form-control" name="email">
                    </fieldset>
                    <input type="hidden" name="f_id" value="<%= ((Lecturer) request.getAttribute("lecturer")).getfId() %>" />
                    <button type="submit" class="btn btn-success">Save</button>
                <% } %>

            </form>
             <button type="button" class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/LecturerListServlet'">Back</button>
        </div>
    </div>
</div>
</body>
</html>

