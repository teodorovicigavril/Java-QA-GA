<%@ page import="com.example.socialnetwork.service.GetCommentsService" %>
<%@ page import="com.example.socialnetwork.entity.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.socialnetwork.service.GetCommentsQaService" %>
<%@ page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Comments</title>
    <style type="text/css">
        html{
            height: 100%;
        }
        body {
            height: inherit;
            width: 100%;
            z-index: -1;
            background: rgb(50, 158, 238);
            background: linear-gradient(183deg, rgba(50, 158, 238, 1) 13%, rgba(195, 44, 113, 1) 80%, rgba(252, 70, 107, 1) 97%);
            background-repeat: no-repeat;
        }


        .boolean {
            width: 50px;
            height: 50px;
        }

        .answered {
            background-color: lawngreen;

        }

        .notAnswered {
            background-color: lightcoral;
        }

        #tick-mark {
            position: relative;
            display: inline-block;
            width: 30px;
            height: 30px;
        }

        #tick-mark::before {
            position: absolute;
            left: 0;
            top: 50%;
            height: 50%;
            width: 3px;
            background-color: #336699;
            content: "";
            transform: translateX(10px) rotate(-45deg);
            transform-origin: left bottom;
        }

        #tick-mark::after {
            position: absolute;
            left: 0;
            bottom: 0;
            height: 3px;
            width: 100%;
            background-color: #336699;
            content: "";
            transform: translateX(10px) rotate(-45deg);
            transform-origin: left bottom;
        }

        .flex-container {
            width: inherit;
            display: flex;
            flex-flow: row wrap;
            justify-content: space-around;
            padding: 0;
            margin: 0;
            list-style: none;
        }


        .feature {
            width: 30%;
            min-width: 300px;
            text-align: center;
            margin-bottom: 3%;
            border-radius: 1rem;
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
            width: inherit;
            height: 100%;
            flex-direction: column;
            align-items: center;
            justify-content: center;

        }

        .header {
            margin-bottom: 3%;
            width: 80%;
            text-align: center;
        }

    </style>
    <script type="application/javascript" defer>
        function changeBack(bool, id) {
            console.log(bool);
            console.log(id)
            if (bool == false) {
                document.getElementById(id).classList.remove("notAnswered")
                document.getElementById(id).classList.add("answered");
            } else {
                document.getElementById(id).classList.remove("answered")
                document.getElementById(id).classList.add("notAnswered");
            }

        }


    </script>
</head>
<body>
<div class="container">


    <h1 class="header">THIS IS QUESTION PAGE</h1>
    <div class="flex-container">
        <%
            String token = (String) request.getAttribute("token");
            String postId = (String) request.getAttribute("id");
            GetCommentsQaService commentsService = new GetCommentsQaService();
            List<Comment> commentList = null;
            try {
                commentList = commentsService.qaComments(postId, token);
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>




        <%
            Iterator<Comment> comments = commentList.iterator();

            if (commentList.size() > 0) {

                Comment comment = new Comment();
                String id = "0";
                while (comments.hasNext()) {
                    id += "0";
                    comment = comments.next();
        %>
        <div class="feature ">
            <h2><%=comment.getName() %>
            </h2>
            <h2><%=comment.getMessage() %>
            </h2>
            <h2><%=comment.getCreated_time() %>
            </h2>
            <button id="bool<%=id%>" class="notAnswered boolean"
                    onclick='changeBack(<%=comment.getAnswered()%>,"bool<%=id%>")'>
                <div id="tick-mark"></div>
            </button>
        </div>

        <%

                }
            }

        %>
    </div>
</div>

</body>
</html>