<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Students List Supervision</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body style="height:100%;">
   <div class="content-wrapper">
        <% 
        String userCategory = (String) session.getAttribute("userCategory");
    
    if(userCategory.equals("lecturer")){
        %> <jsp:include page="../lecturer-sidebar.jsp"></jsp:include> <%
            } 
        %>
        <div class="main-content">
    <div class="column h-100 p-6" style="background-color:#FFFFFF; overflow-y: scroll;">
        <div class="custom-border p-6 w-100">
            <div class="is-flex is-justify-content-space-between is-align-items-center pb-2">
                <div>
                    <label class="has-text-weight-bold has-text-grey is-size-5">Student List With Supervisor</label>
                    <p class="has-text-success is-size-7">Students with accepted Supervisor</p>
                </div>
                <div class="columns m-0 p-0">
                 <div class="column p-1" style="align-content:center;">
                        <div class="dropdown is-hoverable w-100">
                            <div class="dropdown-trigger w-100">
                                <button class="button is-white w-100" style="border: 0.9px solid;" aria-haspopup="true" aria-controls="dropdown-menu3">
                                    <span class=" is-size-7">Sort</span>
                                    <span class="icon is-small">
                                        <i class="fas fa-angle-down" aria-hidden="true"></i>
                                    </span>
                                </button>
                            </div>
                            <div class="dropdown-menu is-size-7 w-100" id="dropdown-menu1" role="menu">
                                <div class="dropdown-content w-100">
                                    <a href="#" class="dropdown-item is-size-7"> Newest </a>
                                    <a href="#" class="dropdown-item is-size-7"> All </a>
                                    <a href="#" class="dropdown-item is-size-7"> Solved </a>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            </div>
            <div class="p-3">
                <table class="">
                    <thead>
                        <tr class="" style="border-bottom: 2px solid #ddd;">
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Topic</th>
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Supervisor Name</th>
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Matric ID</th>
                            <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Session</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Topic">Android App Development</td>
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Programme">Puan Nurul Huda binti Harun</td>
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Session Date">2023855626</td>
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Total Students">2023/2024</td>
                        </tr>
                        <tr>
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Topic">Android App Development</td>
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Programme">Puan Nurul Huda binti Harun</td>
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Session Date">2023855626</td>
                            <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Total Students">2023/2024</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="p-3 is-flex is-justify-content-space-between">
                <label class="has-text-grey-light is-size-7">Showing data 1 to 8 of 256k entries</label>
                <div>
                    <nav class="pagination is-right is-small" role="navigation" aria-label="pagination">
                      <ul class="pagination-list">
                        <li><a href="#" class="pagination-link has-background-grey-lighter has-text-black" style="border: 0;" aria-label="Goto page before"><</a></li>
                        <li><a class="pagination-link is-current" aria-label="Goto page 1">1</a></li>
                        <li><a href="#" class="pagination-link has-background-grey-lighter has-text-black" style="border: 0;" aria-label="Page 2" aria-current="page">2</a></li>
                        <li><a href="#" class="pagination-link has-background-grey-lighter has-text-black" style="border: 0;" aria-label="Goto page 3">3</a></li>
                        <li><span class="pagination-ellipsis">&hellip;</span></li>
                        <li><a href="#" class="pagination-link has-background-grey-lighter has-text-black" style="border: 0;" aria-label="Goto page next">86</a></li>
                      </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
   </div>
</body>
</html>