<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Past Reports</title>
</head>
<body>
<h1>Past Reports</h1>
<table border="1">
    <tr>
        <th>Project ID</th>
        <th>Student Name</th>
        <th>Project Title</th>
        <th>View PDF</th>
    </tr>
    <c:forEach var="report" items="${reports}">
        <tr>
            <td>${report.proId}</td>
            <td>${report.studentName}</td>
            <td>${report.proTitle}</td>
            <td><a href="viewPdf?proId=${report.proId}" target="_blank">View PDF</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
