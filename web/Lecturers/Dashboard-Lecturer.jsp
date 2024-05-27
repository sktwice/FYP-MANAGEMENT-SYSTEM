<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
    <script src="https://kit.fontawesome.com/d21aa4c3aa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .button.is-nav {
            background-color: #14161a;
            border-color: #fff;
            color: #fff;
        }
        .button.is-nav:hover,.button.nav.is-hovered {
            background-color: #a0e4d1;
            border-color: #14161a;
            color: #090a0c
        }
        .button.is-nav.is-outlined:hover,.button.is-nav.is-outlined.is-hovered,.button.is-custom.is-outlined:focus,.button.is-nav.is-outlined.is-focused {
            background-color: #fff;
            border-color: #fff;
            color: #090a0c
        }
    </style>
</head>
<body style="height:100%;">
    <div class="is-flex is-justify-content-space-between is-mobile-visible">
        <div class=" is-mobile-visible p-2">
            <img src="assets/uitm-logo.png" style="height:30px; width:60px;">
        </div>
        <button role="button" class="navbar-burger is-mobile-visible" data-target="navMenu" aria-label="menu" aria-expanded="false">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
        </button>
    </div>
    <div class="p-2 navbar-menu is-mobile-visible" id="navMenu" style="">
        <nav class="navbar" role="navigation" aria-label="dropdown navigation">
            <div class="navbar-item has-dropdown">
                <div class="navbar-dropdown">
                    <a class="navbar-item p-4 is-size-7" href="Admin/Dashboard-Admin.jsp">
                        <span class="has-text-white fas fa-home pr-2"></span>
                        <span class="has-text-white is-size-7" >Dashboard</span>
                    </a>
                    <a class="navbar-item p-4 is-size-7" href="Admin/UserProfile-Admin.jsp">
                        <span class="has-text-white fas fa-user pr-4"></span>
                        <span class="has-text-white is-size-7" >Profile</span>
                    </a>
                    <a class="navbar-item p-4 is-size-7" href="Admin/Report-Admin.jsp">
                        <span class="has-text-white fas fa-inbox pr-4"></span>
                        <span class="has-text-white is-size-7" >Reports</span>
                    </a>
                    <a class="navbar-item p-4 is-size-7" href="Admin/Guidline-Admin.jsp">
                        <span class="has-text-white fas fa-circle-info pr-4"></span>
                        <span class="has-text-white" >Guideline</span>
                    </a>
                    <a class="navbar-item p-4 is-size-7" href="Admin/Scope-Admin.jsp">
                        <span class="has-text-white fas fa-book pr-4"></span>
                        <span class="has-text-white is-size-7" >Scope</span>
                    </a>
                    <a class="navbar-item p-4 is-size-7">
                        <span class="has-text-white fas fa-circle-plus pr-4"></span>
                        <span class="has-text-white is-size-7" >Supervision</span>
                    </a>
                    <a class="navbar-item is-size-7 p-4">
                        <span class="has-text-white fas fa-arrow-right-from-bracket pr-4"></span>
                        <span class="has-text-white" >Sign-out</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>
<div class="columns m-0 p-0 h-100">
    <div class="p-2 column is-2 is-desktop-visible">
        <aside class="menu">
          <p class="menu-label pt-2 pl-3 pr-4 m-0">
              <img src="assets/uitm-logo.png">
          </p>
          <ul class="menu-list">
              <li class="py-1">
                  <a class="box has-text-black navbar-item p-4 m-0" style="background-color: #a0e4d1;">
                    <span class="fas fa-home pr-2 is-size-7"></span>
                    <span class="is-size-7" >Dashboard</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4" href="Admin/UserProfile-Admin.jsp">
                    <span class="fas fa-user pr-4 is-size-7"></span>
                    <span class="is-size-7" >Profile</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4" href="Admin/Report-Admin.jsp">
                    <span class="fas fa-inbox pr-4 is-size-7"></span>
                    <span class="is-size-7" >Reports</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4" href="Admin/Guidline-Admin.jsp">
                      <span class="fas fa-circle-info pr-4 is-size-7"></span>
                      <span class="is-size-7">Guideline</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4" href="Admin/Scope-Admin.jsp">
                      <span class="fas fa-file-pen pr-4 is-size-7"></span>
                        <span class="is-size-7 is-size-7">Form</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4" href="Admin/StudentList-Supervision-Admin.jsp">
                      <span class="fas fa-circle-plus pr-4 is-size-7"></span>
                      <span class="is-size-7">Supervision</span>
                  </a>
              </li>
              <li class="py-1">
                  <a class="button is-nav navbar-item p-4">
                      <span class="fas fa-arrow-right-from-bracket pr-4 is-size-7"></span>
                      <span class="is-size-7" >Sign-out</span>
                  </a>
              </li>
          </ul>
        </aside>
    </div>
    <div class="column" style="background-color:#FFFFFF;">
        <div class="py-1 px-5 is-flex is-justify-content-end is-align-items-center">
            <input class="px-4 py-2 m-1" type="text" placeholder="Search" style="width: 18rem; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
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
                                <p class="has-text-grey has-text-weight-semibold">20</p>
                                <p class="has-text-grey is-size-7">Total Students</p>
                            </div>
                        </div>
                        <div class="column">
                            <div class="box custom-bg2 w-100 h-100">
                                <div class="is-size-5 fas fa-book-open-reader has-text-grey"></div>
                                <p class="has-text-grey has-text-weight-semibold">20</p>
                                <p class="has-text-grey is-size-7">Ongoing Report</p>
                            </div>
                        </div>
                        <div class="column">
                            <div class="box custom-bg3 w-100 h-100">
                                <div class="is-size-5 fas fa-book-open-reader has-text-grey"></div>
                                <p class="has-text-grey has-text-weight-semibold">20</p>
                                <p class="has-text-grey is-size-7">Past Report</p>
                            </div>
                        </div>
                        <div class="column">
                            <div class="box custom-bg4 w-100 h-100">
                                <div class="is-size-5 fas fa-list-check has-text-grey"></div>
                                <p class="has-text-grey has-text-weight-semibold">20</p>
                                <p class="has-text-grey is-size-7">Ongoing Task</p>
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
                    <label class="has-text-weight-semibold has-text-grey">
                        Alerts and Reminder
                    </label>
                    <section class="section is-small"></section>
                </div>
            </div>
    </div>
</div>
</body>
<script>
    document.addEventListener('DOMContentLoaded', () => {

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Add a click event on each of them
  $navbarBurgers.forEach( el => {
    el.addEventListener('click', () => {

      // Get the target from the "data-target" attribute
      const target = el.dataset.target;
      const $target = document.getElementById(target);

      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      el.classList.toggle('is-active');
      $target.classList.toggle('is-active');

    });
  });

});
</script>
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