<%@page import="com.example.socialnetwork.entity.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.socialnetwork.service.GetPostsService" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script>
        function formHandler(ID, token) {
            window.location.href = "/qa/comments/" + ID + "/" + token;
        }

        function formHandlerRandomQuestion(ID, token) {
            window.location.href = "/qa/randomComment/" + ID + "/" + token;
        }
    </script>
    <style>
        html{
            height: 100%;
        }
        body {
            height: 100%;
            width: 100%;
            z-index: -1;
            background: rgb(50, 158, 238);
            background: linear-gradient(183deg, rgba(50, 158, 238, 1) 13%, rgba(195, 44, 113, 1) 80%, rgba(252, 70, 107, 1) 97%);
            background-repeat: no-repeat;
        }


        input {
            width: 250px;
            height: 70px;
            background: linear-gradient(to left top, #c32c71 50%, #b33771 50%);
            border-style: none;
            color: #fff;
            font-size: 23px;
            letter-spacing: 3px;
            font-family: 'Lato';
            font-weight: 600;
            outline: none;
            cursor: pointer;
            position: relative;
            padding: 0px;
            overflow: hidden;
            transition: all .5s;
            box-shadow: 0px 1px 2px rgba(0, 0, 0, .2);
        }

        input span {
            position: absolute;
            display: block;
        }

        input span:nth-child(1) {
            height: 3px;
            width: 200px;
            top: 0px;
            left: -200px;
            background: linear-gradient(to right, rgba(0, 0, 0, 0), #f6e58d);
            border-top-right-radius: 1px;
            border-bottom-right-radius: 1px;
            animation: span1 2s linear infinite;
            animation-delay: 1s;
        }

        @keyframes span1 {
            0% {
                left: -200px
            }
            100% {
                left: 200px;
            }
        }

        input span:nth-child(2) {
            height: 70px;
            width: 3px;
            top: -70px;
            right: 0px;
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0), #f6e58d);
            border-bottom-left-radius: 1px;
            border-bottom-right-radius: 1px;
            animation: span2 2s linear infinite;
            animation-delay: 2s;
        }

        @keyframes span2 {
            0% {
                top: -70px;
            }
            100% {
                top: 70px;
            }
        }

        input span:nth-child(3) {
            height: 3px;
            width: 200px;
            right: -200px;
            bottom: 0px;
            background: linear-gradient(to left, rgba(0, 0, 0, 0), #f6e58d);
            border-top-left-radius: 1px;
            border-bottom-left-radius: 1px;
            animation: span3 2s linear infinite;
            animation-delay: 3s;
        }

        @keyframes span3 {
            0% {
                right: -200px;
            }
            100% {
                right: 200px;
            }
        }

        input span:nth-child(4) {
            height: 70px;
            width: 3px;
            bottom: -70px;
            left: 0px;
            background: linear-gradient(to top, rgba(0, 0, 0, 0), #f6e58d);
            border-top-right-radius: 1px;
            border-top-left-radius: 1px;
            animation: span4 2s linear infinite;
            animation-delay: 4s;
        }

        @keyframes span4 {
            0% {
                bottom: -70px;
            }
            100% {
                bottom: 70px;
            }
        }

        input:hover {
            transition: all .5s;
            transform: rotate(-3deg) scale(1.1);
            box-shadow: 0px 3px 5px rgba(0, 0, 0, .4);
        }

        input:hover span {
            animation-play-state: paused;
        }

        .feature {

            margin-bottom: 3%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-radius: 1rem;
            width: 60%;
            box-shadow: 0 1.5rem 4rem rgba(0, 0, 0, 0.8);
            transition: all 0.2s;
            background: rgb(181,217,218);
            background: linear-gradient(183deg, rgba(181,217,218,1) 20%, rgba(196,161,179,1) 68%, rgba(128,164,166,1) 96%);

        }

        .feature:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .container {
            display: flex;
            flex-direction: column;
            width: 100%;
            justify-content: center;
            align-items: center;
        }

        .header {
            margin-bottom: 3%;
            width: 80%;
            text-align: center;
        }

        .buttons{
            display: flex;
            justify-content: space-around;
            width: inherit;
        }

        @media screen and (max-width: 800px) {
            .buttons{
                flex-direction: column;
            }
            .firstButton{
                margin-bottom: 10px;
            }
        }

    </style>
</head>
<body>

<div class="container">

    <h1 class="header">
        This is the Q&A page you will have to chose one of your posts
    </h1>
    <br>
    <br>
    <!-- In this page I want to display to the first 10-->
    <%
        String token = (String) request.getAttribute("token");
        GetPostsService qaPostsService = new GetPostsService();
        List<Post> list_of_posts = qaPostsService.call_me_to_get_posts(token);
        list_of_posts = qaPostsService.getQaPosts(list_of_posts);
        Iterator<Post> it_list_of_posts = list_of_posts.iterator();
        if (list_of_posts.size() > 0) {
            Post obj_Post_Use_Bean = new Post();
            while (it_list_of_posts.hasNext()) {
                obj_Post_Use_Bean = it_list_of_posts.next();


    %>
    <div class="feature">
        <h2>
            <%=obj_Post_Use_Bean.getMessage() %>
        </h2>
        <h2>
            <%=obj_Post_Use_Bean.getCreated_time() %>
        </h2>
        <div class="buttons">
            <form class="firstButton" action="javascript:void(0);"
                  onsubmit='formHandler( "<%=obj_Post_Use_Bean.getId()%>", "<%=(String) request.getAttribute("token")%>")'>
                <input type="submit" value="Get questions">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </form>

            <form action="javascript:void(0);"
                  onsubmit='formHandlerRandomQuestion( "<%=obj_Post_Use_Bean.getId()%>", "<%=(String) request.getAttribute("token")%>")'>
                <input type="submit" value="Get one question">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </form>
        </div>
    </div>
    <%
            }
        }
    %>
</div>
</body>
</html>