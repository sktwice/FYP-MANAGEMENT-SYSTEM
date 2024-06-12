<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../supervisor-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column px-6 py-3" style="background-color:#FFFFFF;">
                    <div class="p-4 my-4" style="border: 1px solid #f5f5f5;">
                        <div class="columns m-0 p-0">
                            <div class="column">
                                <div class="is-flex is-align-items-center">
                                    <p class="has-background-black" style="border-radius: 100%; width: 100px; height:100px;">
                                        <img src="">
                                    </p>
                                    <span class="p-2">
                                        <div class="has-text-weight-semibold has-text-grey p-1 is-size-5">SV NAME</div>
                                        <div class="has-text-grey has-text-weight-semibold is-size-7 px-1">College of Computing, Informatics and Mathematics</div>
                                        <div class="has-text-grey px-1 is-size-7"><i class="fas fa-user is-size-7 has-text-info"></i> 12 students</div>
                                    </span>
                                </div>
                            </div>
                            <div class="column is-flex is-justify-content-end">
                                <div class="p-1">
                                    <div class="is-size-7 has-text-link">@uitm.edu.my</div>
                                    <div>
                                        <i class="fas fa-linkedin"></i>
                                        <i class="fas fa-instagram"></i>
                                        <i class="fas fa-whatsapp"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="custom-border p-4">
                        <div class="">
                            <table class="">
                                <thead>
                                    <tr class="" style="border-bottom: 2px solid #ddd;">
                                        <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">#</th>
                                        <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Student Name</th>
                                        <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Report Name</th>
                                        <th class="has-text-grey-light is-size-7 has-text-centered has-text-weight-semibold">Progress</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="#" style="width:6%">01</td>
                                        <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Student Name">Ain</td>
                                        <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Report Name">Library Management</td>
                                        <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Progress">
                                            <a class="button is-info is-small" href="#"><i class="fas fa-eye has-text-white"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="#" style="width:6%">02</td>
                                        <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Student Name">Aina</td>
                                        <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Report Name">Library Management</td>
                                        <td class="is-size-7 has-text-centered has-text-right-mobile has-text-grey has-text-weight-semibold" data-label="Progress">
                                            <a class="button is-info is-small" href="#"><i class="fas fa-eye has-text-white"></i></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>