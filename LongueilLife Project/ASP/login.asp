<%@ Language ="Javascript" %>
<%
    %>
<html>
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/rememberMe.js"></script>
    <script>
        $(document).ready(function()
        {
            $('[data-toggle="tooltip"]').tooltip();   
        });
    </script>
    <script>
        $(document).ready(function() 
        {
            fillByMemory()
            {
                if ($('#rememberChkBox').val()) 
                {
                    rememberMe();
                }
            }
        });
    </script>    
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
            background-image: url(../images/image4.jpg); 
            background-size: 100%; 
            background-repeat: no-repeat;
            height: 100%;
            margin: 0;
            padding: 0;
        }
        .login-table
        {
            width: 300px;
            opacity: 0.8;
            background-color: #F0F8FF;
            align-content: center;
            border-radius: 10px;
            position: relative;
            top: 50%;
            left: 50%;
            margin-right: -50%;
            transform: translate(-50%, -50%); 
        }
    </style>
</head>

<body style="height:700px;"  class="im">
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid" style="width: 100%; "><br />  
        <div class="navbar-header">                      
            <div class="navbar-header">              
                <p class="navbar-text"> <img src="../images/heart.png" style="max-width:15%; max-height:15%;" />&nbsp Longueilife</p>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="../index.asp"><span class="glyphicon glyphicon-home"></span> &nbsp Home</a></li>                
                <li><a href="#"><span class="glyphicon glyphicon-flash"></span> &nbsp Reach us</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-briefcase"></span> &nbsp About us</a></li>
            </ul>
        </div>
    </div>
</nav>
<div>
<div style="float:left; width: 60%; height:100%; margin-top:50px;"></div>

<div style="float:right; width: 40%; margin-top:150px;">   
    <br /> <br />
    <table class="login-table">
        <tr>
            <td>
                <div style="margin:10px">
                    <h2>Welcome back!</h2>
                    <h4>Please enter your credentials:</h4>
                </div>
            </td>
        </tr>
    </table>
<form action="validate_login.asp" method="post">
    <table  class="login-table">
        <tr>
            <td>
                <div style="margin:10px" class="form-group">
                    <label for="usr">Email:</label>
                    
                    <input type="email" 
                        class="form-control" 
                        id="usr" name="bxEmail" 
                        data-toggle="tooltip" 
                        data-placement="top" 
                        title="Your email address"
                        Required="Required"
                        onmousedown ="<% Session.Abandon %>" />                        
                </div>
            </td>
        </tr>        
    </table>
    <table  class="login-table">
        <tr>
            <td>
                <div style="margin:10px" class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" 
                        class="form-control"
                        id="pwd" 
                        name="bxPasswd" 
                        data-toggle="tooltip" 
                        data-placement="auto" 
                        title="Must contain at least 8 characters including digits, upper case and lowercase letters."
                        Required="Required"
                        onmousedown ="<% Session.Abandon %>" />                        
                </div>
                <div><p style="margin-left:20px; color:red;"><i> <%= Session("wrongMessage") %> </i></p></div>
            </td>
        </tr>        
    </table>
    <br />
    <table  class="login-table">
        <tr>
            <td>
                <div style="margin:10px" class="form-group">
                    <div class="checkbox">
                        <label><input type="checkbox" id="rememberChkBox"> Remember me</label>
                    </div>
                    <button type="submit" id="sign" class="btn btn-default">Submit</button>
                </div>
            </td>
        </tr>        
    </table>
</form>
</div>
<div style="clear:both;"></div>
</div>

</body>
</html>
