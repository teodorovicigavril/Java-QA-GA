<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Facebook Login JavaScript Example</title>
    <meta charset="UTF-8">
    <style>

        body{
            height: 100%;
            width: 100%;
            z-index: -1;
            background: rgb(50,158,238);
            background: linear-gradient(183deg, rgba(50,158,238,1) 13%, rgba(195,44,113,1) 80%, rgba(252,70,107,1) 97%);
            background-repeat: no-repeat;
        }

        .purple {
            color: white;
        }
        .titles{
            margin-top: 5%;
            margin-bottom: 5%;
        }
        .instructionContainer {
            padding-top: 8%;
            display: flex;
            justify-content: space-around;
        }

        .instruction {
            max-width: 40%;
        }

        .leftInstruction {
            align-self: flex-start;
        }

        .rightInstruction {
            align-self: flex-end;
        }



        input {
            width: 200px;
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

        .wrapper {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100vw;
            height: 100vh;
        }

        .spacer {
            margin-bottom: 5%;
        }



        #modalContainer {
            background-color:rgba(0, 0, 0, 0.3);
            position:absolute;
            width:100%;
            height:100%;
            top:0px;
            left:0px;
            z-index:10000;

        }

        #alertBox {
            position:relative;
            width:300px;
            min-height:100px;
            margin-top:50px;
            border:1px solid #666;
            background-color:#fff;
            background-repeat:no-repeat;
            background-position:20px 30px;
        }

        #modalContainer > #alertBox {
            position:fixed;
        }

        #alertBox h1 {
            margin:0;
            font:bold 0.9em verdana,arial;
            background-color:#3073BB;
            color:#FFF;
            border-bottom:1px solid #000;
            padding:2px 0 2px 5px;
        }

        #alertBox p {
            font:0.7em verdana,arial;
            height:50px;
            padding-left:5px;
            margin-left:55px;
        }

        #alertBox #closeBtn {
            display:block;
            position:relative;
            margin:5px auto;
            padding:7px;
            border:0 none;
            width:70px;
            font:0.7em verdana,arial;
            text-transform:uppercase;
            text-align:center;
            color:#FFF;
            background-color:#357EBD;
            border-radius: 3px;
            text-decoration:none;
        }

        /* unrelated styles */

        #mContainer {
            position:relative;
            width:600px;
            margin:auto;
            padding:5px;
            border-top:2px solid #000;
            border-bottom:2px solid #000;
            font:0.7em verdana,arial;
        }



        code {
            font-size:1.2em;
            color:#069;
        }

        #credits {
            position:relative;
            margin:25px auto 0px auto;
            width:350px;
            font:0.7em verdana;
            border-top:1px solid #000;
            border-bottom:1px solid #000;
            height:90px;
            padding-top:4px;
        }

        #credits img {
            float:left;
            margin:5px 10px 5px 0px;
            border:1px solid #000000;
            width:80px;
            height:79px;
        }

        .important {
            background-color:#F5FCC8;
            padding:2px;
        }

        code span {
            color:green;
        }
    </style>
</head>
<body>
<div id="fb-root"></div>

<script>
    let token = "";
    let status;

    function getRidOfLogInButton() {
        document.getElementById("loginButton").remove();
    }

    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
        console.log('statusChangeCallback');
        console.log(response);                   // The current login status of the person.
        if (response.status === 'connected') {   // Logged into your webpage and Facebook.
            //I have to send the token to the java
            getRidOfLogInButton();
            token = response.authResponse.accessToken;
            status = response.status;
            console.log(token);
            document.getElementById('status').innerHTML = '';

        } else {                                 // Not logged into your webpage or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log in';
        }

        return token;
    }


    function checkLoginState() {               // Called when a person is finished with the Login Button.
        FB.getLoginStatus(function (response) {   // See the onlogin handler
            statusChangeCallback(response);
        });
    }


    window.fbAsyncInit = function () {
        FB.init({
            appId: '910278569813888',
            cookie: true,                     // Enable cookies to allow the server to access the session.
            xfbml: true,                     // Parse social plugins on this webpage.
            version: 'v10.0'           // Use this Graph API version for this call.
        });


        FB.getLoginStatus(function (response) {   // Called after the JS SDK has been initialized.
            statusChangeCallback(response);        // Returns the login status.
        });
    };

    function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function (response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('status').innerHTML =
                'Thanks for logging in, ' + response.name + '!';
        });
    }

    function setTokenOnSession() {
        return token;
    }

    function getTokenClick() {
        document.getElementById("link2").href = "/firstAPIcall?token=" + token;
    }

    function formHandlerQA() {
        if (!(status === 'connected')){
            alert("Please login!");
        }else
        window.location.href = "/qa/" + token;
    }

    function formHandlerGiveAway() {
        if (!(status === 'connected')){
            alert("Please login!");
        }else
        window.location.href = "/giveaway/" + token;
    }


    var ALERT_TITLE = "Oops!";
    var ALERT_BUTTON_TEXT = "Ok";

    if(document.getElementById) {
        window.alert = function(txt) {
            createCustomAlert(txt);
        }
    }

    function createCustomAlert(txt) {
        d = document;

        if(d.getElementById("modalContainer")) return;

        mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
        mObj.id = "modalContainer";
        mObj.style.height = d.documentElement.scrollHeight + "px";

        alertObj = mObj.appendChild(d.createElement("div"));
        alertObj.id = "alertBox";
        if(d.all && !window.opera) alertObj.style.top = document.documentElement.scrollTop + "px";
        alertObj.style.left = (d.documentElement.scrollWidth - alertObj.offsetWidth)/2 + "px";
        alertObj.style.visiblity="visible";

        h1 = alertObj.appendChild(d.createElement("h1"));
        h1.appendChild(d.createTextNode(ALERT_TITLE));

        msg = alertObj.appendChild(d.createElement("p"));
        //msg.appendChild(d.createTextNode(txt));
        msg.innerHTML = txt;

        btn = alertObj.appendChild(d.createElement("a"));
        btn.id = "closeBtn";
        btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
        btn.href = "#";
        btn.focus();
        btn.onclick = function() { removeCustomAlert();return false; }

        alertObj.style.display = "block";

    }

    function removeCustomAlert() {
        document.getElementsByTagName("body")[0].removeChild(document.getElementById("modalContainer"));
    }

</script>

<!-- The JS SDK Login Button -->
<div id="loginButton">
    <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
    </fb:login-button>
</div>

<!--
<div class="fb-login-button" data-width="" data-size="large" data-button-type="continue_with" data-layout="default"
     data-auto-logout-link="false" data-use-continue-as="false"></div>
-->

<div id="status">
</div>
<div class="wrapper">

    <h1 class="titles">Welcome to our Web app</h1>

    <form class="spacer" action="javascript:void(0);" onsubmit="return formHandlerQA() ">
        <input type="submit" value="Q&A"></form>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    </form>
    <form action="javascript:void(0);" onsubmit="return formHandlerGiveAway()">
        <input type="submit" value="Give away">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </form>
    <div class="instructionContainer">
        <div class="leftInstruction instruction">
            <h2>
                If you want to make a Q and A with our app make sure to have a post on facebook that contains the <span
                    class="purple">#Q&A</span> hashtag
            </h2>
        </div>
        <div class="rightInstruction instruction">
            <h2>
                If you want to make a give away using our app make sure that you have one post on facebook with
                the <span class="purple">#giveaway</span> hastag
            </h2>
        </div>
    </div>
</div>
<!-- Load the JS SDK asynchronously -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></SCRIPT>
</body>
</html>



