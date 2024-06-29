<%-- 
    Document   : Dashboard-Examiner
    Created on : May 2, 2024, 6:50:15 PM
    Author     : User
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
        <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <title>Dashboard</title>
    </head>
    <body>
        <div class="content-wrapper">
            <jsp:include page="../examiner-sidebar.jsp"></jsp:include>
            <div class="main-content">
                <div class="column px-4 py-2" style="background-color:#FFFFFF;">
                    <div class="py-1 px-5 is-flex is-justify-content-end is-align-items-center">
                        <input class="px-4 mx-4 my-1" type="text" placeholder="Search" style="width: 18rem; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
                        <span class="has-background-black" style="border-radius: 100%; width: 40px; height: 40px;">
                            <img src="">
                        </span>
                    </div>
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
                    <div class="columns m-0 p-0">
                        <div class="column is-8">
                            <div class="custom-border p-3">
                                <label class="has-text-weight-semibold has-text-grey">
                                    Students Report Progress
                                </label>
                                <table>
                                    <thead>
                                        <tr style="border-bottom: 2px solid #abb1bf;">
                                            <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">#</th>
                                            <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Student Name</th>
                                            <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Report's Title</th>
                                            <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Progress</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered">01</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" data-label="Student Name">Ali</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" data-label="Report's Title">Topic 1</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" data-label="Progress">40%</td>
                                        </tr>
                                        <tr>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered">02</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" data-label="Student Name">Ali</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" data-label="Report's Title">Topic 1</td>
                                            <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile" data-label="Progress">40%</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="column is-4">
                            <div class="custom-border p-3 h-100 w-100">
                                <label class="has-text-weight-semibold has-text-grey">
                                    Statistics
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="column is-full">
                        <div class="custom-border p-3 h-100 w-100">
                            <label class="has-text-weight-semibold has-text-grey p-2">
                                Frequently Asked Questions (FAQs) for Lecturer
                            </label>
                            <section class="section is-small p-4">
                                <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="1">
                                    1.<label class=" hover-underline p-1"> I am thinking of terminating my supervisory role to a student. How do I go about it?</label>
                                </a>
                                <div class="grid__description px-6 py-1 has-text-weight-medium">
                                    This is not encouraged. However, if you still insist, please refer to the Terms and Conditions in the Mutual Acceptance Form (F1).
                                </div>
                                <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="2">
                                    2.<label class=" hover-underline p-1"> What is the maximum number of students that I can supervise?</label>
                                </a>
                                <div class="grid__description px-6 py-1">
                                    There is no limit on the number of students you can be supervised. However, it is discretionary to have a proper distribution of students among supervisors within a department.
                                </div>
                                <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="3">
                                    3.<label class=" hover-underline p-1"> What if my student is frequently absent without any valid reasons from the weekly consultation?</label>
                                </a>
                                <div class="grid__description px-6 py-1">
                                    The Supervisor should consult with the Final Year Project Coordinator or Course Lecturer. However, an 80% attendance is required by the Academic Affairs Division for all courses.
                                </div>
                                <a class="grid__item px-4 has-text-grey has-text-weight-semibold" tabindex="4">
                                    4.<label class=" hover-underline p-1"> Is it compulsory for me to attend the progress presentation?</label>
                                </a>
                                <div class="grid__description px-6 py-1">
                                    It is strongly encouraged
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script>
        const options = {
            series: [{
                    name: 'PRODUCT A',
                    data: [44, 55, 41, 67, 22, 43]
                }, {
                    name: 'PRODUCT B',
                    data: [13, 23, 20, 8, 13, 27]
                }],
            chart: {
                type: 'bar',
                height: 150,
                stacked: true,
                toolbar: {
                    show: false
                },
                zoom: {
                    enabled: true
                }
            },
            responsive: [{
                    breakpoint: 480,
                    options: {
                        legend: {
                            position: 'bottom',
                            offsetX: -10,
                            offsetY: 0
                        }
                    }
                }],
            plotOptions: {
                bar: {
                    horizontal: false,
                    borderRadius: 10,
                    borderRadiusApplication: 'end', // 'around', 'end'
                    borderRadiusWhenStacked: 'last', // 'all', 'last'
                    dataLabels: {
                        total: {
                            enabled: false,
                            style: {
                                fontSize: '13px',
                                fontWeight: 900
                            }
                        }
                    }
                },
            },
            xaxis: {
                type: 'datetime',
                categories: ['01/01/2011 GMT', '01/02/2011 GMT', '01/03/2011 GMT', '01/04/2011 GMT',
                    '01/05/2011 GMT', '01/06/2011 GMT'
                ],
            },
            yaxis: {
                show: false
            },
            legend: {
                position: 'bottom'
            },
            fill: {
                opacity: 1
            }
        };

        const chart = new ApexCharts(document.querySelector("#chart"), options);
        chart.render();
    </script>
</html>