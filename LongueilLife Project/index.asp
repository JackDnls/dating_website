<%@ Language = "Javascript" %>
<%
    Session.Contents.RemoveAll();
     %>
<html>
<head>
    <title>Longueilife-Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <style>
        .cont
        {                
             width:100%; 
             height:32px; 
             background-color:lightskyblue; 
             background-repeat:repeat-x;
        }
        .im 
        {
            background-image: url(images/image3.jpg); 
            background-size: 100%; 
            background-repeat: no-repeat;width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;        
        }
    </style>
</head>
<body class="im">
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid" style="width: 100%; height:100%; "><br />  
        <div class="navbar-header">                      
            <div class="navbar-header">              
                <p class="navbar-text"><img src="images/heart.png" style="max-width:15%; max-height:15%;" />&nbsp Longueilife</p>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span> &nbsp Home</a></li>              
                <li><a href="#"><span class="glyphicon glyphicon-flash"></span> &nbsp Reach us</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-briefcase"></span> &nbsp About us</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="ASP/signup.asp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="ASP/login.asp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="jumbotron" style="margin-top:10%; opacity:0.8">
        <h2><center>Join one of the biggest Social Networks!</center></h2>
    </div>
    <div style="float:left; width: 50%; margin-top:50px; padding-left:100px">
        <h3 style="color:azure">Your soulmate's waiting for you</h3>
    </div>
    <div style="float:right; width: 50%; margin-top:50px; padding-left:100px">
        <h3 style="color:azure">here... and now!</h3>
    </div>
    <div class="well" style="opacity:0.8; margin-top:250px">
        <h4>Meet more people, spark more conversations and have more fun! Longueilife.com 
            makes meeting singles easy. <br /> <br />
            We also believe it should be stress-free! Kick the common dating myths to the curb and start meeting great new people today.
            <br /> <br />
            <center><strong>It's absolutely FREE! Today, tomorrow, always!</strong></center>
        </h4>
    </div>
    <div style="clear:both;"></div>
</div>

</body>
</html>
