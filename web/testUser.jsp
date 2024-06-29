<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin User Profile</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Admin User Profile</h1>
    <c:if test="${not empty admin}">
        <table>
            <tr>
                <th>Admin ID</th>
                <td>${admin.adminId}</td>
            </tr>
            <tr>
                <th>Login ID</th>
                <td>${admin.loginId}</td>
            </tr>
            <tr>
                <th>Image</th>
                <td><img src="${admin.aImage}" alt="Admin Image" width="100" height="100"></td>
            </tr>
            <tr>
                <th>Name</th>
                <td>${admin.aName}</td>
            </tr>
            <tr>
                <th>Phone Number</th>
                <td>${admin.phoneNum}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>${admin.email}</td>
            </tr>
        </table>
    </c:if>
    <c:if test="${empty admin}">
        <p>No admin data found for the given ID.</p>
    </c:if>
</body>
</html>
