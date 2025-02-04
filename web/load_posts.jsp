<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.Post" %>

<div class="row">


    <%
        Thread.sleep(1000);

        PostDao dao = new PostDao(ConnectionProvider.getConnection());

        int cId = Integer.parseInt(request.getParameter("cid"));

        System.out.print("cid = " + cId);

        List<Post> posts = null;
        if (cId == 0) {
            posts = dao.getAllPosts();
        } else {
            posts = dao.getPostsByCategoryId(cId);
        }

        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No posts in this category</h3>");
            return;
        }

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