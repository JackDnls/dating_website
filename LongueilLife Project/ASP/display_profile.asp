<%@ Language = "Javascript" %>
<% 
	var selProf = parseInt(Request.QueryString("selPRof"));
	Session("receiverID") = selProf;
	var curGender = Session('curGender');

	var myConn = new ActiveXObject("ADODB.Connection");	
	myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= E:\\Longueilife.mdb");

	var myRec = new ActiveXObject("ADODB.Recordset");
	var sqlSt = "SELECT Nickname, City, Province, Gender, Preferences, Birthday, MaritalStatus, Body, Children, Education, Etnicity, Height";
	sqlSt += " FROM Profiles WHERE ProfileID = " + selProf;
	myRec.Open(sqlSt, myConn);


	%>
<html>
<head>
	<title>Longueilife-Profile</title>
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
			background-size: 150% auto;
			 background-attachment: fixed;
			background-position: center; 
			background-repeat: no-repeat;
			
			margin: 0;
			padding: 0;        
		}
		 .panels
		{   
			opacity: 0.95;
			background-color: #F0F8FF;
			border-radius: 10px;
			position: relative;
		}
		 .right_panel_top 
		{
			float:right; 
			width: 18%; 
			height:470px; 
			margin-left:1%; 
			margin-right:1%; 
			margin-top:100px; 
			padding-left:10px; 
		}
		.right_panel_bottom 
		{
			float:right; 
			width: 18%; 
			height:200px; 
			margin-left:1%;
			margin-top:1%; 
			margin-right:1%; 
			padding-left:10px; 
		}
		.left_panel
		{
			float:left; 
			width: 79%; 
			height:900px; 
			margin-left:1%;
			margin-bottom:1%;
			padding: 0px 10px 10px 20px;
		}
		.text_frame
		{   
			opacity: 0.8;
			background-color:white;
			border-radius: 10px;
			position: relative;
			margin: 1% 1% 1% 1%;
			width:130%;
		}
		.bt_submit 
		{
			background-color: #F0F8FF;
			border:groove;
			color: black;
			padding: 15px 32px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 4px 2px;
			cursor: pointer;
			-webkit-transition-duration: 0.4s; /* Safari */
			transition-duration: 0.4s;
		}
		.bt_submit:hover 
		{
			box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
		}
	</style>
</head>
<body class="im" >
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
						<li><a href="check_all_messages.asp"><span class=" glyphicon glyphicon-envelope"></span> &nbsp My Messages</a></li>
						<li><a href="search.asp"><span class=" glyphicon glyphicon-search"></span> &nbsp Search</a></li>
						<hr />
						<li><a href="../index.asp"><span class="glyphicon glyphicon-log-out"></span> &nbsp Log out</a></li>
					</ul>                                     
				</li>                
			</ul>
		</div>
	</div>
</nav>
<div style="width:100%" >
	<div class ="panels right_panel_top" > 
		<div style="position:relative;">
			<div class="panel-body" style="padding-top:30px">
				<h3>Your add could be here</h3>
			</div>
		</div>        
	</div>
	<br /><br /><br /><br /><br />      
	<div class ="panels left_panel" >		
		<div style="position:relative; width:70%">
			<div style="margin-left:30%; margin-top:20px">				
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
				<img src="<%= picUser %>" style="width:300px; height:auto"/>				
			</div>	
			<br /><br /><br />
            
			<div class="text_frame">
				<h4 style="padding:10px 10px 10px 100px;"><b><%= myRec.Fields("Nickname") %></b></h4>
			</div>
            <div style="padding-left:50px">
                <table>
                    <tr>
                        <td style="width:150px">
                            <h4 ><b>From: </b></h4>
                        </td>
                        <td style="width:250px">
                            <h4><%= myRec.Fields("City") %>, <%= myRec.Fields("Province") %></h4>
                        </td>
                        <td>
                            <h4 style="width:150px"><b>Children: </b></h4>
                        </td>
                        <td>
                            <h4 style="width:200px"><%= myRec.Fields("Children") %></h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4><b>Gender: </b></h4>
                        </td>
                        <td>
                            <%
							    if (myRec.Fields("Gender") == "Both")
							    {
								    var sex = "I'm a bit of both..."
							    }
							    if (myRec.Fields("Gender") == "Male") {
								    var sex = "Male"
							    }
							    if (myRec.Fields("Gender") == "Female") {
								    var sex = "Female"
							    }                                
						    %>
						    <h4 ><%= sex %></h4>
                        </td>
                        <td>
						    <h4 ><b>Education: </b></h4>
                        </td>
                        <td>
                            <h4 ><%= myRec.Fields("Education") %></h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4><b>Interested in: </b></h4>
                        </td>
                        <td>
                            <%
							    if (myRec.Fields("Gender") == "Both")
							    {
								    var sex = "Both, women and men"
							    }
							    if (myRec.Fields("Gender") == "Male") {
								    var sex = "Men"
							    }
							    if (myRec.Fields("Gender") == "Female") {
								    var sex = "Women"
							    }                                
						    %>
                            <h4><%= sex %></h4>
                        </td>
                        <td>
                            <h4 ><b>Etnicity: </b></h4>
                        </td>
                        <td>
                            <h4><%= myRec.Fields("Etnicity") %></h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4 ><b>Born on: </b></h4>
                        </td>
                        <td>
                            <h4><%= myRec.Fields("Birthday") %></h4>
                        </td>
                        <td>
                            <h4 ><b>Height: </b></h4>
                        </td>
                        <td>
                            <h4><%= myRec.Fields("Height") %> cm</h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4 ><b>Social status: </b></h4>
                        </td>
                        <td>
                            <h4><%= myRec.Fields("MaritalStatus") %></h4>
                        </td>
                        <td>
                            <h4 ><b>Body type: </b></h4>
                        </td>
                        <td>
                            <h4><%= myRec.Fields("Body") %></h4>
                            
                        </td>                        
                    </tr>
                </table>
            </div>            
            
            <form action="process_send_msg.asp" method="post">
                <div class="text_frame" style="padding:10px 10px 10px 100px; float:left">
				    <label for="comment">Message Body:</label>
                    <textarea class="form-control" name="refMsg" style="height:100px" placeholder="Type a message"></textarea>  
                    <button type="submit" class="btn btn-primary btn-xs" style="float:right; margin-top:5px">Send</button>                      
                </div>  
                <label style="color:red; margin-left:100px"><strong><i><%=Session("msgSuccess")  %> </i></strong> </label>
            </form>
            <%
                
                Session("msgSuccess") = '';
                myRec.Close();
                myConn.Close();                                
                %>
		</div>
	</div>
</div>
<div style="position: relative; " class="panels right_panel_bottom">
	<h3>... and here ...</h3> 
</div>
<div style="position: relative; " class="panels right_panel_bottom">
	<h3>... and here too</h3> 
</div>
<div style="clear:both;"></div>


</body>
</html>

<html>
<head>
	<title></title>
	
</head>
<body>

</body>
</html>

