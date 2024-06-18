<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Submission</title>
</head>
<body>
    <h1>Submit Form</h1>
    <form action="Form2Servlet" method="post">
        <h2>Form Details</h2>
        <label for="formId">Form ID:</label>
        <input type="number" id="formId" name="formId" required><br>

        <label for="studentId">Student ID:</label>
        <input type="number" id="studentId" name="studentId" required><br>

        <label for="lId">Lecturer ID:</label>
        <input type="number" id="lId" name="lId" required><br>

        <label for="proId">Project ID:</label>
        <input type="number" id="proId" name="proId" required><br>

        <h2>Form2 Details</h2>
        <label for="proIdentity">Problem Identity:</label>
        <input type="number" id="proIdentity" name="proIdentity" required><br>

        <label for="evidence">Evidence:</label>
        <input type="number" id="evidence" name="evidence" required><br>

        <label for="solution">Solution:</label>
        <input type="number" id="solution" name="solution" required><br>

        <label for="total">Total:</label>
        <input type="number" id="total" name="total" required><br>

        <label for="approval">Approval:</label>
        <input type="text" id="approval" name="approval" required><br>

        <label for="dateApprove">Date Approved:</label>
        <input type="date" id="dateApprove" name="dateApprove" required><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
