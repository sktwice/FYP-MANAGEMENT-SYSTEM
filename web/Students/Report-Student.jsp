<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="content-wrapper">
        <jsp:include page="../student-sidebar.jsp"></jsp:include>
        <div class="main-content">
            <div class="column" style="background-color:#FFFFFF; height:726px;">
                <div class="py-1 px-5 is-flex is-justify-content-end is-align-items-center">
                    <input id="searchInput" class="px-4 m-1" type="text" placeholder="Search"
                           style="width: 18rem; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                    <span class="has-background-black" style="border-radius: 100%; width: 40px; height: 40px;">
                        <img src="">
                    </span>
                </div>
                <div class="custom-border p-4 w-100">
                    <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                        <div>
                            <label class="has-text-weight-semibold has-text-grey-dark is-size-5">Past
                                Reports</label>
                            <p class="has-text-grey-light is-size-7">More than ${pastProjects.size()} students' reports</p>
                        </div>
                    </div>
                    <div>
                        <div class="p-1" id="table">
                            <table class="">
                                <thead>
                                    <tr style="border-bottom: 2px solid #ddd;">
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Student</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Matric ID</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Semester</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Report Title</th>
                                        <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="tableBody">
                                    <c:forEach var="pastProject" items="${pastProjects}">
                                        <tr>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile"
                                                data-label="Student">${pastProject.studentName}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile"
                                                data-label="Matric ID">${pastProject.studentId}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile"
                                                data-label="Semester">${pastProject.session}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile"
                                                data-label="Topic">${pastProject.proTitle}</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile">
                                                <div class="is-flex is-justify-content-center">
                                                    <button class="button is-success is-outlined is-small mr-2"><i class="fas fa-eye"></i></button>
                                                    <a class="button is-info is-outlined is-small" href="${pageContext.request.contextPath}/DownloadPastReportServlet?proId=${pastProject.proId}">
                                                        <i class="fas fa-download"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
            document.getElementById('searchInput').addEventListener('keyup', function() {
              var input = document.getElementById('searchInput');
              var filter = input.value.toLowerCase();
              var tableBody = document.getElementById('tableBody');
              var tr = tableBody.getElementsByTagName('tr');

              for (var i = 0; i < tr.length; i++) {
                var td = tr[i].getElementsByTagName('td');
                var textValue = '';
                for (var j = 0; j < td.length; j++) {
                  textValue += td[j].textContent || td[j].innerText;
                }
                if (textValue.toLowerCase().indexOf(filter) > -1) {
                  tr[i].style.display = '';
                } else {
                  tr[i].style.display = 'none';
                }
              }
            });
          </script>
</body>
</html>
