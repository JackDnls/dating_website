<%@ Language ="Javascript" %>
<%
    var curGender = Session('curGender');

    %>
<html>
<head>
	<title>Longueilife-Search</title>
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
			<div class="text_frame">
				<h1 style="padding:30px;">So, describe us who are you looking for:</h1>
			</div>	
            <br />
            <h4 style="padding:30px; color:red; "><i><%= Session('noResult') %> </i></h4>			            
            <form class="form-horizontal" action="display_search.asp" method="get" >                 
                <!-- -------------------------------------------------------------Gender------------------------------------------------- -->
                <div class="text_frame">
					<div class="form-group">
					<label class="control-label col-sm-2" >It must be a:</label>
						<div class="col-sm-10">
							<label class="radio-inline">
								<input type="radio" name="radGender" value="Male" onmousedown ="<% Session.Contents.Remove("noResult") %>" />Man
							</label>
							<label class="radio-inline">
								<input type="radio" name="radGender" value="Female" required="required" />Woman
							</label>
							<label class="radio-inline">
								<input type="radio" name="radGender" value="Both" />Bi
							</label>
						</div>
					</div>
			    </div>     
                <br />          
                <!-- -------------------------------------------------------------Marital Status------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2" >Social status:</label>
						<div class="col-sm-10">
							<select class="form-control" id="sel1" name="cboStat" onmousedown ="<% Session.Contents.Remove("noResult") %>">
								<option value="">Please choose</option>
								<option value="Single">Single</option>
								<option value="Maried">Maried</option>
								<option value="In a relationship">In a relationship</option>
								<option value="Long story">Long story...</option>
							</select>
						</div>
					</div>
			    </div>
                <br />
                <!-- -------------------------------------------------------------Body------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2">Body shape:</label>
						<div class="col-sm-10">
							<select class="form-control" id="sel2" name="cboBody" onmousedown ="<% Session.Contents.Remove("noResult") %>">
								<option value="">Please choose</option>
								<option value="Slim">Slim</option>
								<option value="Athletic">Athletic</option>
								<option value="Average">Average</option>
								<option value="Stout">Stout</option>
							</select>
						</div>
					</div>
			    </div>
                <br />
                <!-- -------------------------------------------------------------Children------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2">Children:</label>
						<div class="col-sm-10">
							<select class="form-control" id="sel3" name="cboKids" onmousedown ="<% Session.Contents.Remove("noResult") %>" >
								<option value="">Please choose</option>
								<option value="No">No</option>
								<option value="Yes with me">Yes, with me</option>
								<option value="Yes but not with me">Yes but not with me</option>
							</select>
						</div>
					</div>
			    </div>
                <br />
                <!-- -------------------------------------------------------------Education------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2">How well educated:</label>
						<div class="col-sm-10">
							<select class="form-control" id="sel4" name="cboEdu" onmousedown ="<% Session.Contents.Remove("noResult") %>" >
                                <option value="">Please choose</option>
								<option value="High school">High school</option>
								<option value="College graduate">College graduate</option>
								<option value="Advanced degree">Advanced degree</option>
							</select>
						</div>
					</div>
			    </div>
                <br />
                <!-- -------------------------------------------------------------Etnicity------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2">Etnicity:</label>
						<div class="col-sm-10">
							<select class="form-control" id="sel5" name="cboEtn" onmousedown ="<% Session.Contents.Remove("noResult") %>" >
                                <option value="">Please choose</option>
								<option value="Asian">Asian</option>
								<option value="Black/African">Black/African</option>
								<option value="Indian">Indian</option>
								<option value="Latino/Hispanic">Latino/Hispanic</option>
								<option value="White/Caucasian">White/Caucasian</option>
								<option value="Mixed/Other">Mixed/Other</option>
							</select>
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Submit Button------------------------------------------------- -->
                <div style="float:right; margin-top:50px">
                    <input type="submit" value="Submit" class="bt_submit" />
                </div>
            </form>
		</div>
	</div>
	<div style="position: relative; " class="panels right_panel_bottom">
		<h3>... and here ...</h3> 
	</div>
	<div style="position: relative; " class="panels right_panel_bottom">
		<h3>... and here too</h3> 
	</div>
	<div style="clear:both;"></div>
</div>

</body>
</html>
