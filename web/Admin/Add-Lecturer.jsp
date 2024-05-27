<%@ page import="java.util.List" %>
<%@ page import="com.fyp.model.bean.faculty" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList, java.util.Iterator" %>

<html>
<head>
    <title>Register Lecturer</title>
</head>
<body>
    <h2>Register Lecturer</h2>
    <form action="RegisterServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <label for="f_id">Faculty:</label>
        <select id="f_id" name="f_id" required>
            <option value="">Select Faculty and Course</option>
            <% 
                List<faculty> listFaculty = (List<faculty>) request.getAttribute("listFaculty");
                if (listFaculty != null) {
                    for (faculty f : listFaculty) {
                        out.println("<option value=\"" + f.getfId() + "\">" + f.getfName() + " :- " + f.getfCourse() + "</option>");
                    }
                } else {
                    out.println("<option value=\"\">No faculties available</option>");
                }
            %>
        </select><br><br>

        <label for="admin_id">Admin ID:</label>
        <input type="text" id="admin_id" name="admin_id" required><br><br>
        
        <label for="position">Position:</label>
        <input type="text" id="position" name="position" required><br><br>
        
        <label for="l_image">Image Path:</label>
        <input type="text" id="l_image" name="l_image" required><br><br>
        
        <label for="l_name">Lecturer Name:</label>
        <input type="text" id="l_name" name="l_name" required><br><br>
        
        <label for="phone_num">Phone Number:</label>
        <input type="text" id="phone_num" name="phone_num" required><br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="l_course">Lecturer Course:</label>
        <input type="text" id="l_course" name="l_course" required><br><br>
        
        <input type="submit" value="Register">
    </form>
</body>
</html>
