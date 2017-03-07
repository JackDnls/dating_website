 <%@ Language ="Javascript" %>
<%
    var curGender = Session('curGender');

	%>
<html>
<head>
	<title>Longueilife-Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>    
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
			background-repeat: no-repeat;width: 100%;
			height: 100%;
			margin: 0;
			padding: 0;        
		}
		.panels
		{   
			opacity: 0.8;
			background-color: #F0F8FF;
			border-radius: 10px;
			position: relative;
		}
		.picture_frame
		{   
			opacity: 0.8;
			background-color:white;
			border-radius: 10px;
			position: relative;
			margin: 2% 5% 15% 5%;

		}
		.left_panel_top 
		{
			float:left; 
			width: 18%; 
			height:40%; 
			margin-left:1%; 
			margin-right:1%; 
			margin-top:100px; 
			padding-left:10px; 
		}
		.left_panel_bottom 
		{
			float:left; 
			width: 18%; 
			height:22%; 
			margin-left:1%;
			margin-top:1%; 
			margin-right:1%; 
			padding-left:10px; 
		}
		.right_panel
		{
			float:right; 
			width: 79%; 
			height:88%; 
			margin-right:1%;
			padding: 0px 10px 10px 20px;
		}
		img_profile 
		{
			width:5px;
			height:5px;
		}
        .carousel-inner > .item > img
        .carousel-inner > .item > a > img 
        {
            width: 70%;
            margin: auto;

        } 
        .carousel-control.left, .carousel-control.right 
        {
            background-image:none !important;
            filter:none !important;
        }
       
	</style>
</head>
<body class="im">
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid" style="width: 100%; height:100%; "><br />  
		<div class="navbar-header">                      
			<div class="navbar-header"><p class="navbar-text"><img src="../images/love.png" style="max-width:15%; max-height:15%;" />&nbsp Longueilife</p>
			</div>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <%
				            if(curGender == 'Male' )
                            {
                                var picUser = "../images/generic_male.jpg";
                            }   
				            if (curGender == 'Female')
                            {
                                picUser = "../images/generic_female.png";
                            }
				            if (curGender == 'Both')
                            {
                                picUser = "../images/generic_both.png";
                            }
      
				            %> 			
                        <img src="<%= picUser %>" style="width:25px; height:auto"/>		
						&nbsp <%= Session("currFirstName") %>, 
							  <%= Session("currLastName") %>   
					</a>
					<ul class="dropdown-menu">
						<li><a href="search.asp"><span class=" glyphicon glyphicon-search "></span> &nbsp Search</a></li>
                        <li><a href="check_all_messages.asp"><span class=" glyphicon glyphicon-envelope "></span> &nbsp My messages</a></li>
						<hr />
						<li><a href="../index.asp"><span class="glyphicon glyphicon-log-out" onclick="doPostBack()"></span> &nbsp Log out</a></li>
					</ul>
				</li>                
			</ul>
            <p><%= Session('currProfileID') %> </p>
		</div>
	</div>
</nav>
<div style="width:100%">
	<div class ="panels left_panel_top" > 
		<div style="position:relative;">
			<div class="panel-body" style="padding-top:30px">
                <form action ="welcome.asp">
                    <button type="submit" class="btn btn-default btn-block"><span class="glyphicon glyphicon-home"></span>&nbsp Home</button>
			    </form>
				<form action="search.asp" method="post">
                    <button type="submit" class="btn btn-default btn-block" onclick="search.asp"><span class="glyphicon glyphicon-search"></span>&nbsp Search</button>
				</form>
                <form action="check_all_messages.asp" method="post">
				    <button type="submit" class="btn btn-default btn-block"><span class="glyphicon glyphicon-envelope"></span>&nbsp My Messages</button>
			    </form>
            </div>     
		</div>        
	</div>
	<br /><br /><br /><br /><br />   
	<div class ="panels right_panel" >
		<div style="position:relative; width:auto">
            <div class="alert alert-danger" style="margin:20px 10px 10px 10px">
                <center><strong>Check out our new members!</strong></center>
            </div>
            <form action="display_profile.asp" method="get">
            <div id="myCarousel" class="carousel slide" data-interval="false" style="width:760px; margin:40px 39% 20px 15%">
                <div class="carousel-inner" role="listbox" style="align-items:center">
                    <div class="item active">
                        <img src="../images/profiles/image1.jpg" width="760" >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=3">
                                <h3 style="color:white"><strong>simple_emy </strong></h3>
                            </a>
                            <p>Montreal, QC</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="../images/profiles/image2.jpg" width="760" >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=1">
                                <h3 style="color:white"><strong>jimmy_b</strong></h3>
                            </a>
                            <p>Verdun, QC</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="../images/profiles/image3.jpg" width="760"  >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=2">
                                <h3 style="color:white"><strong>johny_w</strong></h3>
                            </a>
                            <p>Torronto, ON</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="../images/profiles/image4.jpg" width="760" >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=29">
                                <h3 style="color:white"><strong>only_yours29</strong></h3>
                            </a>
                            <p>Vancouver, BC</p>            
                        </div>
                    </div>  
                    <div class="item">
                        <img src="../images/profiles/image5.jpg" width="760" >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=34">
                                <h3 style="color:white"><strong>trully_yours32</strong></h3>
                            </a>
                            <p>Lassale, QC</p>       
                        </div>
                    </div>  
                    <div class="item">
                        <img src="../images/profiles/image6.jpg" width="760" >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=41">
                                <h3 style="color:white"><strong>janet_ch</strong></h3>
                            </a>
                            <p>Saint-Huber, QC</p>            
                        </div>
                    </div> 
                    <div class="item">
                        <img src="../images/profiles/image7.jpg" width="760" >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=35">
                                <h3 style="color:white"><strong>vicky_brown</strong></h3>
                            </a>
                            <p>Saint-Huber, QC</p>            
                        </div>
                    </div> 
                    <div class="item">
                        <img src="../images/profiles/image8.jpg" width="760" >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=36">
                                <h3 style="color:white"><strong>hidden_bunny</strong></h3>
                            </a>
                            <p>Prescott, ON</p>            
                        </div>
                    </div> 
                    <div class="item">
                        <img src="../images/profiles/image9.jpeg" width="760" >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=38">
                                <h3 style="color:white"><strong>bunny_jess</strong></h3>
                            </a>
                            <p>Saint-Constant, QC</p>            
                        </div>
                    </div> 
                    <div class="item">
                        <img src="../images/profiles/image10.jpg" width="760" >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=42">
                                <h3 style="color:white"><strong>louise_f</strong></h3>
                            </a>
                            <p>Regina, SK</p>            
                        </div>
                    </div> 
                    <div class="item">
                        <img src="../images/profiles/image11.jpg" width="760" >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=26">
                                <h3 style="color:white"><strong>al_p</strong></h3>
                            </a>
                            <p>Montreal, QC</p>            
                        </div>
                    </div> 
                    <div class="item">
                        <img src="../images/profiles/image12.jpg" width="760" >
                        <div class="carousel-caption">
                            <a href="display_profile.asp?selProf=30">
                                <h3 style="color:white"><strong>jack_d</strong></h3>
                            </a>
                            <p>Saint-Bruno-de-Montarville, QC</p>            
                        </div>
                    </div> 
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>   
            </form>
        </div>
	</div>
	<div style="position: relative; float:left;" class="panels left_panel_bottom">
        <h3>Your add could be here</h3> 
	</div>
	<div style="position: relative; float:left;" class="panels left_panel_bottom">
		<h3>... and here too</h3> 
	</div>
	<div style="clear:both;"></div>
</div>

</body>
</html>

