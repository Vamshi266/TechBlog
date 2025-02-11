<%--
    Document   : show_blog_post
    Created on : Feb 5, 2025, 10:10:05 PM
    Author     : vamsh
--%>


<%@page import="java.text.DateFormat"%>
<%@page import="com.techblog.dao.UserDao"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%

    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>

<%    int pId = Integer.parseInt(request.getParameter("post_id"));

    PostDao dao = new PostDao(ConnectionProvider.getConnection());

    Post post = dao.getPostByPostId(pId);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <%= post.getpTitle()%>  </title>

        <!--bootstrap css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background
            {
                clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 87%, 74% 84%, 23% 94%, 0 85%, 0% 30%);
            }

            .post-title
            {
                font-weight: 100;
                font-size: 30px;
            }

            .post-content
            {
                font-weight: 100;
                font-size: 17px;
            }

            .post-date
            {
                font-style: italic;
                font-weight: bold;
            }

            .post-user-info
            {
                font-size: 20px;
            }

            .row-user
            {
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }

            body
            {
                background: url("img/background-img.jpg");
                background-size: cover;
                background-attachment: fixed;
            }



        </style>

    </head>
    <body>

        <!--nav-bar start-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-bolt"></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"> <span class="fa fa-code"></span> learnCode<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-list-alt"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">DataStructures and Algorithms</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"> <span class="fa fa-phone"></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-drivers-license-o"></span> do Post</a>
                    </li>

                </ul>

                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user"></span> <%= user.getUser_name()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-power-off"></span> Logout</a>
                    </li>
                </ul>

            </div>
        </nav>
        <!--nav-bar end-->

        <!--main content start-->

        <div class="container">

            <div class="row my-4">

                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="post-title"><%= post.getpTitle()%></h4>
                        </div>

                        <div class="card-body">
                            <img class="card-img-top my-2" src="pics/<%= post.getPic()%>" alt="Card image cap">

                            <div class="row my-3 row-user">
                                <div class="col-md-8">
                                    <%
                                        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                                    %>
                                    <p class="post-user-info">posted by <a href="#!"><%= userDao.getUserByUserId(post.getuId()).getUser_name()%></a> </p>
                                </div>

                                <div class="col-md-4">
                                    <p class="post-date"><%= DateFormat.getDateTimeInstance().format(post.getRegDate())%></p>
                                </div>

                            </div>

                            <p class="post-content"><%= post.getpContent()%></p>
                        </div>

                        <div class="card-footer">
                            <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"> <span>20</span></i></a>
                            <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"> <span>10</span></i></a>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!--main content end-->

        <!--profile modal start-->

        <!-- Modal start -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" style="border-radius: 50%;max-width: 200px; max-height: 200px" alt="alt"/>
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getUser_name()%></h5>
                            <!--details start-->
                            <div id="profile-details">
                                <table class="table table-hover">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID : </th>
                                            <td> <%= user.getId()%> </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">UserName : </th>
                                            <td><%= user.getUser_name()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td><%= user.getUser_email()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">About : </th>
                                            <td><%= user.getAbout()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Created On : </th>
                                            <td><%= user.getReg_date()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile edit-->
                            <div id="profile-edit" style="display: none;">
                                <h3>Edit Details</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID </td>
                                            <td> <%= user.getId()%> </td>
                                        </tr>

                                        <tr>
                                            <td>UserName : </td>
                                            <td> <input class="form-control" type="text" name="user_name" value="<%= user.getUser_name()%>"> </td>
                                        </tr>

                                        <tr>
                                            <td>Email : </td>
                                            <td> <input class="form-control" type="email" name="user_email" value="<%= user.getUser_email()%>"> </td>
                                        </tr>

                                        <tr>
                                            <td>Password : </td>
                                            <td> <input class="form-control" type="password" name="user_password" value="<%= user.getUser_password()%>"> </td>
                                        </tr>

                                        <tr>
                                            <td>Gender : </td>
                                            <td> <%= user.getGender()%> </td>
                                        </tr>

                                        <tr>
                                            <td>About : </td>
                                            <td>
                                                <textarea rows="5" class="form-control" name="user_about">
                                                    <%= user.getAbout()%>
                                                </textarea>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td>Profile picture : </td>
                                            <td> <input type="file" name="image" class="form-control"> </td>
                                        </tr>

                                    </table>

                                    <div>
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>
                            </div>

                            <!--details end-->
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="profile-edit-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal end -->

        <!--profile modal end-->

        <!--start of post modal-->

        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">create post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">

                                <select class="form-control" name="cid">
                                    <option selected disabled>---select category---</option>
                                    <%
                                        PostDao postDao = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> categories = postDao.getAllCategories();

                                        for (Category category : categories) {

                                    %>
                                    <option value="<%= category.getcId()%>" name="cid"><%= category.getcName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <br>

                            <div class="form-group">
                                <input name="post_title" typr="text" placeholder="Enter post title" class="form-control" />
                            </div>

                            <div class="form-group">
                                <textarea name="post_content" style="height:300px" class="form-control" placeholder="Enter post content"></textarea>
                            </div>

                            <div class="form-group">
                                <label>choose your pic</label>
                                <br>
                                <input type="file" name="pic">
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>

                        </form>
                    </div>



                </div>
            </div>
        </div>

        <!--end of post modal-->




        <!--js-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <!--<script src="js/script.js" type="text/javascript"></script>-->
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>

        <script>

            $(document).ready(function () {
                let editStatus = false;

//"edit" and "back" toggle logic
                $('#profile-edit-button').click(function () {

                    if (editStatus === false)
                    {
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        editStatus = true;
                        $(this).text("Back");
                    } else
                    {
                        $('#profile-details').show();
                        $('#profile-edit').hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }

                });
            });
        </script>

        <!--post js-->
        <script>

            $(document).ready(function (e) {


                $("#add-post-form").on("submit", function (event) {
                    //this code get's called when form is submitted

                    event.preventDefault(); // prevents default form bahaviour
                    console.log("post submitted");
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //req success
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("post saved", "good job", "success");
                            } else
                            {
                                console.log("error in db");
                                swal("Error!", "Something went wrong", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("error in js");
                            swal("Error!", "Something went wrong", "error");
                        },
                        processData: false,
                        contentType: false
                    })

                })

            })

        </script>


    </body>
</html>
