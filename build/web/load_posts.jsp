<%@page import="java.util.List"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.Post" %>

<div class="row">


    <%

        PostDao dao = new PostDao(ConnectionProvider.getConnection());

        List<Post> posts = dao.getAllPosts();

        for (Post post : posts) {


    %>

    <div class="col-md-6">
        <div class="card">
            <img class="card-img-top" src="pics/<%= post.getPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= post.getpTitle()%></b>
                <p><%= post.getpContent()%></p>
            </div>
        </div>
    </div>

    <%      }

    %>
</div>