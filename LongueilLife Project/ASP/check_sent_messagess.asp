<%@ Language ="Javascript" %>
<%
    var refSender = Session('currProfileID');
    var curGender = Session('curGender');

    var myConn = new ActiveXObject("ADODB.Connection");
    var myRec = new ActiveXObject("ADODB.RecordSet");
    var path = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source= E:\\+++College Lassale+++\\INTERNET\\LongueilLife Project\\App-Data\\Longueilife.mdb";
    myConn.Open(path);
    var sqlStat = "SELECT Messages.MessageID, Messages.MessageBody, Messages.DateSent, Profiles.ProfileID, Profiles.Nickname, Profiles.City, Profiles.Province, Profiles.Gender FROM (Profiles INNER JOIN Messages ON Profiles.ProfileID = Messages.Receiver) WHERE (Messages.Sender = "+refSender+")";
    myRec.Open(sqlStat, myConn);

    %>
<html>
<head>
	<title>Longueilife-Messages</title>
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

	</style>
</head>
<body class="im">
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid" style="width: 100%; height:100%; "><br />  
		<div class="navbar-header">                      
			<div class="navbar-header"><p class="navbar-text"><img src="../images/heart.png" style="max-width:15%; max-height:15%;" />&nbsp Longueilife</p>
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
                        <li><a href="welcome.asp"><span class=" glyphicon glyphicon-home"></span> &nbsp Welcome Page</a></li>
						<li><a href="search.asp"><span class=" glyphicon glyphicon-search "></span> &nbsp Search</a></li>
                        <li><a href="check_all_messages.asp"><span class="glyphicon glyphicon-envelope"></span> &nbsp Inbox</a></li>                        
						<hr />
						<li><a href="../index.asp"><span class="glyphicon glyphicon-log-out" ></span> &nbsp Log out</a></li>
					</ul>
				</li>                
			</ul>
            
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
                    <button type="submit" class="btn btn-default btn-block"><span class="glyphicon glyphicon-search"></span>&nbsp Search</button>
				</form>                
                <form action="check_all_messages.asp" method="post">
				    <button type="submit" class="btn btn-default btn-block"><span class="glyphicon glyphicon-envelope"></span>&nbsp Inbox</button>
			    </form>
            </div>                     
		</div>        
	</div>
	<br /><br /><br /><br /><br />   
	<div class ="right_panel" >
		<div style="position:relative; width:70%">
			<div class="row" style="margin-left:50px">
            <%
                while(!myRec.EOF)  
                {   
                        %>      
                        <div class="alert alert-warning">
                            <div style="margin-top:20px">				
				            <%      
                                if(myRec.Fields("Gender") == "Male" )
                                {
                                    var picUser = "../images/generic_male.jpg";
                                }   
                                if(myRec.Fields("Gender") == "Female")
                                {
                                    picUser = "../images/generic_female.png";
                                }
                                if(myRec.Fields("Gender") == "Both")
                                {
                                    picUser = "../images/generic_both.png";
                                }      
				            %>                                   
				                <div class="media">
                                <div class="media-left media-middle">
                                    <a href="display_profile.asp?selProf=<%= myRec.Fields("ProfileID") %>" >
                                        <img src="<%= picUser %>" style="width:100px; height:auto" />
                                    </a>
                                </div>
                                <div class="media-body">                                    
                                    <h4 class="media-heading"><a href="display_profile.asp?selProf=<%= myRec.Fields("ProfileID") %>"><%= myRec.Fields("Nickname") %> </a></h4>
                                    <p><%= myRec.Fields("City") %>, <%= myRec.Fields("Province") %></p>
                                    <h6> Message: </h6>                                    
                                    <div class="panel panel-default">
                                        <div class="panel-body" >
                                            <h5>" <%= myRec.Fields("MessageBody") %> "</h5>                                            
                                        </div>
                                        <footer style="float:right"><i>Received on <%= myRec.Fields("DateSent") %></i></footer>
                                    </div>
                                    <form action="delete_msg.asp" method="get">
                                        <input type="hidden" name="MessID"value="<%= myRec.Fields("MessageID") %>" /> 
                                        <button type="submit" class="btn btn-primary btn-xs" style="float:right; margin-top:5px; width:50px">Delete</button>
                                    </form >
                                </div>
                                
                               </div>                      
			                </div>   
                        </div>
                    <%
                        myRec.MoveNext();
                }
                myRec.Close();
                myConn.Close(); 
                %>
            </div>
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

