<%--
    Document   : register_page
    Created on : Jan 7, 2025, 1:19:56 PM
    Author     : vamsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <!--bootstrap css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background
            {
                clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 87%, 74% 84%, 23% 94%, 0 85%, 0% 30%);
            }

        </style>

    </head>
    <body>

        <%@include file="navbar.jsp" %>
        <main class="primary-background banner-background" style="padding-top: 50px;padding-bottom: 200px;">

            <div class="container">
                <div class="col-md-6 offset-md-3">

                    <div class="card">

                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register Here
                        </div>

                        <div class="card-body">

                            <form id="reg-form" action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="user_name">Enter name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="user_gender">select gender</label>
                                    <br>
                                    <input type="radio" id="user_gender" name="user_gender" value="Male">Male
                                    <input type="radio" id="user_gender" name="user_gender" value="Female">FeMale
                                </div>

                                <div class="form-group">

                                    <textarea name="about" class="form-control" id="id" name="name" rows="5" placeholder="Enter something about yourself"></textarea>

                                </div>

                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
                                </div>

                                <br>

                                <div class="container text-center" id="loader" style="display : none;">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please Wait...</h4>
                                </div>
                                <br>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>

                        </div>

                    </div>

                </div>
            </div>

        </main>




        <!--js-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>

            $(document).ready(function () {
                console.log("loaded");



                $('#reg-form').on('submit', function () {

                    event.preventDefault();

                    let form = new FormData(this);

                    $('#submit-btn').hide();
                    $('#loader').show();

                    //send to registerServlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $('#submit-btn').show();
                            $('#loader').hide();

                            if (data.trim() === 'done')
                            {
                                swal("done", "user saved", "success")
                                        .then((value) => {
                                            window.location = "login_page.jsp"
                                        });
                            } else
                            {
                                swal(data);
                            }


                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            swal("something went wrong... try again")

                            $('#submit-btn').hide();
                            $('#loader').show();

                        },
                        processData: false,
                        contentType: false
                    });

                });
            });

        </script>


    </body>
</html>
