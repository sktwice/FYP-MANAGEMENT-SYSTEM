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
        <% String userCategory=(String) session.getAttribute("userCategory"); if(userCategory.equals("lecturer")){ %>
            <jsp:include page="../lecturer-sidebar.jsp"></jsp:include>
            <% } else if(userCategory.equals("examiner")){ %>
                <jsp:include page="../examiner-sidebar.jsp"></jsp:include>
                <% } else if(userCategory.equals("admin")){ %>
                    <jsp:include page="../admin-sidebar.jsp"></jsp:include>
                    <% } %>
                        <div class="main-content">
                            <div class="column px-5 py-3" style="background-color:#FFFFFF;">
                                <div class="columns m-0 p-0">
                                    <div class="column is-8">
                                        <div class="custom-border p-3 h-100 w-100">
                                            <label class="has-text-weight-semibold has-text-grey">
                                                Today's Summary
                                            </label>
                                            <div class="columns m-0 p-0">
                                    <div class="column">
                                        <div class="box custom-bg w-100 h-100">
                                            <div class="is-size-5 fas fa-user-graduate has-text-grey"></div>
                                            <p class="has-text-grey has-text-weight-semibold">${totalStudents}</p>
                                            <p class="has-text-grey is-size-7">Total Students</p>
                                        </div>
                                    </div>
                                    <div class="column">
                                        <div class="box custom-bg2 w-100 h-100">
                                            <div class="is-size-5 fas fa-book-open-reader has-text-grey"></div>
                                            <p class="has-text-grey has-text-weight-semibold">${totalProject}</p>
                                            <p class="has-text-grey is-size-7">Ongoing Report</p>
                                        </div>
                                    </div>
                                    <div class="column">
                                        <div class="box custom-bg3 w-100 h-100">
                                            <div class="is-size-5 fas fa-book-open-reader has-text-grey"></div>
                                            <p class="has-text-grey has-text-weight-semibold">${totalPastProject}</p>
                                            <p class="has-text-grey is-size-7">Past Report</p>
                                        </div>
                                    </div>
                                    <div class="column">
                                        <div class="box custom-bg4 w-100 h-100">
                                            <div class="is-size-5 fas fa-list-check has-text-grey"></div>
                                            <p class="has-text-grey has-text-weight-semibold">${totalScope}</p>
                                            <p class="has-text-grey is-size-7">Total Scope</p>
                                        </div>
                                    </div>
                                </div>
                                        </div>
                                    </div>
                                    <div class="column is-4">
                                        <div class="custom-border p-3">
                                            <label class="has-text-weight-semibold has-text-grey">
                                                Graph
                                            </label>
                                            <div class="w-100 h-100">
                                                <div id="chart"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="column is-full">
                                <div class="card">
                                    <div class="card-image">
                                        <figure style="">
                                            <img src="${pageContext.request.contextPath}/assets/uitm_background.jpeg" style="height:12rem; width:100rem;">
                                        </figure>
                                    </div>
                                    <div class="card-content">
                                        <div class="media">
                                            <div class="media-content">
                                                <p class="title is-4 has-text-grey">Frequently Asked Questions (FAQs) for Lecturer</p>
                                            </div>
                                        </div>
                                        <div class="content">
                                            <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="1">
                                                1.<label class=" hover-underline p-1"> I am thinking of terminating my supervisory role to a student. How do I go about it?</label>
                                            </a>
                                            <div class="grid__description px-6">
                                                This is not encouraged. However, if you still insist, please refer to the Terms and Conditions in the Mutual Acceptance Form (F1).
                                            </div>
                                            <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="2">
                                                2.<label class=" hover-underline p-1"> What is the maximum number of students that I can supervise?</label>
                                            </a>
                                            <div class="grid__description px-6">
                                                There is no limit on the number of students you can be supervised. However, it is discretionary to have a proper distribution of students among supervisors within a department.
                                            </div>
                                            <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="3">
                                                3.<label class=" hover-underline p-1"> What if my student is frequently absent without any valid reasons from the weekly consultation?</label>
                                            </a>
                                            <div class="grid__description px-6">
                                                The Supervisor should consult with the Final Year Project Coordinator or Course Lecturer. However, an 80% attendance is required by the Academic Affairs Division for all courses.
                                            </div>
                                            <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="4">
                                                4.<label class=" hover-underline p-1"> Is it compulsory for me to attend the progress presentation?</label>
                                            </a>
                                            <div class="grid__description px-6">
                                                It is strongly encouraged
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var options = {
                series: [${totalStudents}, ${totalLecturer}, ${totalSupervisor}, ${totalExaminer}],
                labels: ['Students', 'Lecturers', 'Supervisors', 'Examiners'],
                chart: {
                    type: 'polarArea',
                    height: '100%', // Set chart height to 100% of its container
                },
                stroke: {
                    colors: ['#fff']
                },
                fill: {
                    opacity: 0.8
                },
                legend: { // Set legend position to bottom globally
                },
                responsive: [{
                    breakpoint: 400,
                    options: {
                        chart: {
                            height: 300 // Adjust height for smaller screens if needed
                        },
                        legend: { // Ensure legend is at the bottom for smaller screens
                        }
                    }
                }]
            };

            var chart = new ApexCharts(document.querySelector("#chart"), options);
            chart.render();
        });
    </script>
</body>
</html>