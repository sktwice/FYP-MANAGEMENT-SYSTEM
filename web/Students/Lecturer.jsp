<%-- 
    Document   : Lecturer
    Created on : May 2, 2024, 6:15:39 PM
    Author     : User
--%>

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
<body style="height:100%;">
    <div class="is-flex is-justify-content-space-between is-mobile-visible">
        <div class=" is-mobile-visible p-2">
            <img src="../assets/uitm-logo.png" style="height:30px; width:60px;">
        </div>
    </div>
<div class="columns m-0 p-0 h-100">
    <div class="column h-100 px-6 py-3" style="background-color:#FFFFFF; overflow-y: scroll;">
        <div class="pb-3 is-flex is-justify-content-end is-align-items-center">
            <input class="px-4 mx-4 my-1" type="text" placeholder="Search" style="width: 18rem; border-radius: 6px; border-width: 1px;border-color: #bdbdbd; outline: none;">
            <span class="has-background-black" style="border-radius: 100%; width: 40px; height: 40px;">
                <img src="">
            </span>
        </div>
        <div class="custom-border p-6 w-100">
            <div class="is-flex is-justify-content-space-between is-align-items-center pb-4">
                <div>
                    <label class="has-text-weight-bold has-text-grey is-size-5">List Of Lecturers</label>
                    <p class="has-text-grey-light is-size-7">More than 400+ Lecturers</p>
                </div>
                </div>
            <div>
                <div class="p-1" id="table">
                    <table class="">
                        <thead>
                            <tr style="border-bottom: 2px solid #ddd;">
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Name</th>
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Staff ID</th>
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Contact</th>
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7">Email</th>
                                <th class="has-text-grey-light has-text-weight-semibold has-text-centered is-size-7"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-start has-text-right-mobile p-4" data-label="Student">Encik Azmi bin Ayub</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Matric ID">34567890</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Semester">+60 156742729</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic">Azmi56@gmail.com</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                    <div class=" is-flex is-justify-content-center">
                                        <button class="button is-custom3 is-small">Submit Proposal</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-start has-text-right-mobile p-4" data-label="Student">Puan Hasnah bte Hj Ahmad</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Matric ID">34567890</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Semester">+60 156742729</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic">Hasnah@gmail.com</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                    <div class=" is-flex is-justify-content-center">
                                        <button class="button is-custom3 is-small">Submit Proposal</button>
                                    </div>
                                </td>
                            </tr>
                             <tr>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-start has-text-right-mobile p-4" data-label="Student">Encik Muzafar Shah bin Azhar Shah</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Matric ID">34567890</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Semester">+60 156742729</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic">Muzafar@gmail.com</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                    <div class=" is-flex is-justify-content-center">
                                        <button class="button is-custom3 is-small">Submit Proposal</button>
                                    </div>
                                </td>
                            </tr>
                             <tr>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-start has-text-right-mobile p-4" data-label="Student">Puan Nurul Huda binti Harun</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Matric ID">34567890</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Semester">+60 156742729</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic">Huda@gmail.com</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                   <div class=" is-flex is-justify-content-center">
                                        <button class="button is-custom3 is-small">Submit Proposal</button>
                                    </div>
                                </td>
                            </tr>
                             <tr>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-start has-text-right-mobile p-4" data-label="Student">Engku Faizul B Engku Mustafa</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Matric ID">34567890</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Semester">+60 156742729</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic">Faizul@gmail.com</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                    <div class=" is-flex is-justify-content-center">
                                        <button class="button is-custom3 is-small">Submit Proposal</button>
                                    </div>
                                </td>
                            </tr>
                             <tr>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-start has-text-right-mobile p-4" data-label="Student">Anita Bt Baha</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Matric ID">34567890</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Semester">+60 156742729</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic">Anita@gmail.com</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                    <div class=" is-flex is-justify-content-center">
                                        <button class="button is-custom3 is-small">Submit Proposal</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-start has-text-right-mobile p-4" data-label="Student">Khairul Hazizi Bin Rosmi</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Matric ID">34567890</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Semester">+60 156742729</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic">Khairul@gmail.com</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                    <div class=" is-flex is-justify-content-center">
                                        <button class="button is-custom3 is-small">Submit Proposal</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-start has-text-right-mobile p-4" data-label="Student">Dr. Monisa Bt Abdul Wahab</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Matric ID">34567890</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Semester">+60 156742729</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4" data-label="Topic">Monisa@gmail.com</td>
                                <td class="has-text-grey has-text-weight-semibold is-size-7 has-text-centered has-text-right-mobile p-4">
                                    <div class=" is-flex is-justify-content-center">
                                        <button class="button is-custom3 is-small">Submit Proposal</button>
                                    </div>
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