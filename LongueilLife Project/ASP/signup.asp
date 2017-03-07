
<html>
<head>
	<title>Longueilife-Register</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
    <script type="text/javascript">
        function updateTextInput(val)
        {
            document.getElementById('heightInput').value = val;             
        }        
    </script>
    <script type="text/javascript">
        function repeatPassword()
        {
            if (document.getElementById("Pwd1").value == document.getElementById("Pwd2").value)
            {
                return true;
            }
            else
            {
                alert("Password missmatch. \nPlease make sure the entered passwords match", "Alert")
                return false;
            }
        }
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
			background-image: url(../images/image1.jpg); 
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
			height:700px; 
			margin-left:1%; 
			margin-right:1%; 
			margin-top:100px; 
			padding-left:10px; 
		}
		.right_panel_bottom 
		{
			float:right; 
			width: 18%; 
			height:250px; 
			margin-left:1%;
			margin-top:1%; 
			margin-right:1%; 
			padding-left:10px; 
		}
		.left_panel
		{
			float:left; 
			width: 79%; 
			height:1230px; 
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
	    .bt_register 
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
        .bt_register:hover 
        {
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
        }
	</style>
</head>
<body class="im" >
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container" style="width: 100%; height:100%; "><br />  
		<div class="navbar-header">                      
			<div class="navbar-header">               
				<p class="navbar-text"><img src="../images/heart.png" style="max-width:15%; max-height:15%;" />&nbsp Longueilife</p>
			</div>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="../index.asp">
					<span class="glyphicon glyphicon-home"></span> &nbsp Home</a>
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
				<h1 style="padding:30px;">So, go ahead and let us know about yourself: </h1>
			</div>
			<br /><br />
            <form class="form-horizontal" action="register.asp" method="post" onsubmit="return repeatPassword()"> 
                <!-- -------------------------------------------------------------First Name------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
					    <label class="control-label col-sm-2" >First Name:</label>
						<div class="col-sm-10">
							<input type="text" name="txtFirstName" class="form-control" placeholder="Your First Name goes here..." required="required" />
				        </div> 
			        </div>
                </div>
                <!-- -------------------------------------------------------------Last Name------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
				    	<label class="control-label col-sm-2" >Last Name:</label>
					  	<div class="col-sm-10">
							<input type="text" name="txtLastName" class="form-control" placeholder="Your Last Name goes here..." required="required" />
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Nickname------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
				    	<label class="control-label col-sm-2" >Profile Name:</label>
					  	<div class="col-sm-10">
							<input type="text" name="nick" class="form-control" placeholder="Your nickname you'd like to be displayed with... " required="required" onmousedown ="<% Session.Abandon %>" />
                            <div><p style="margin-left:20px; color:red;"><i> <%= Session("wrongNick") %> </i></p></div>
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------City------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
				    	<label class="control-label col-sm-2" >City:</label>
					  	<div class="col-sm-10">
							<input type="text" name="city" class="form-control" placeholder="Your City should go in here... " required="required" />
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Province------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2" >Province:</label>
						<div class="col-sm-10">
							<select class="form-control" name="cboProv" required style="width:auto">
								<option value="">Please choose</option>
								<option value="AB">Alberta</option>
								<option value="BC">British Columbia</option>
								<option value="MB">Manitoba</option>
								<option value="NB">New Brunswick</option>
                                <option value="NL">Newfoundland and Labrador</option>
								<option value="NS">Nova Scotia</option>
								<option value="NT">Nortwest Territories</option>
								<option value="NU">Nunavut</option>
                                <option value="ON">Ontario</option>
								<option value="PE">Prince Edward Island</option>
								<option value="QC">Quebec</option>
								<option value="SK">Saskatchewan</option>
                                <option value="YT">Yukon</option>
							</select>
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Gender------------------------------------------------- -->
                <div class="text_frame">
					<div class="form-group">
					<label class="control-label col-sm-2" >Gender:</label>
						<div class="col-sm-10">
							<label class="radio-inline">
								<input type="radio" name="radGender" value="Male"  required="required" />Male
							</label>
							<label class="radio-inline">
								<input type="radio" name="radGender" value="Female" />Female
							</label>
							<label class="radio-inline">
								<input type="radio" name="radGender" value="Both" />I'm a bi
							</label>
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Preferences------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
					<label class="control-label col-sm-2" >Preferences:</label>
						<div class="col-sm-10">
							<label class="radio-inline">
								<input type="radio" name="radPref" value="Men" required="required" />Men
							</label>
							<label class="radio-inline">
								<input type="radio" name="radPref" value="Women" />Women
							</label>
							<label class="radio-inline">
								<input type="radio" name="radPref" value="Both" />It could be androgynous
							</label>
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------BDate------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
					    <label class="control-label col-sm-2" >Birth date:</label>
						<div class="col-sm-10">
							<input type="date" name="bDate" class="form-control" required="required" placeholder="mm/dd/yyyy"/>
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Email------------------------------------------------- -->
			    <div class="text_frame">
				    <div class="form-group">
					    <label class="control-label col-sm-2" for="email">Email:</label>
						<div class="col-sm-10">
							<input type="email" name="EmailAddr" class="form-control" id="email" placeholder="Your Email goes here..." required="required" onmousedown ="<% Session.Abandon %>" />
                            <div><p style="margin-left:20px; color:red;"><i> <%= Session("EmailExists") %> </i></p></div>
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Password------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
					    <label class="control-label col-sm-2" >Password:</label>
						<div class="col-sm-10">
							<input type="password" id="Pwd1" name="Pwd1" class="form-control" placeholder="Your password goes here..." required="required" />
						</div>
					</div>
			    </div>
			    <div class="text_frame">
					<div class="form-group">
					    <label class="control-label col-sm-2" >Password:</label>
						<div class="col-sm-10">
						    <input type="password" id="Pwd2" name="Pwd2" class="form-control" placeholder="Please retype it..." required="required">
					    </div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Marital Status------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2" >Marital status:</label>
						<div class="col-sm-10">
							<select class="form-control" name="cboStat" required>
								<option value="">Please choose</option>
								<option value="Single">Single</option>
								<option value="Maried">Maried</option>
								<option value="In a relationship">In a relationship</option>
								<option value="Long story">Long story...</option>
							</select>
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Body------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2">Body:</label>
						<div class="col-sm-10">
							<select class="form-control" name="cboBody" required>
								<option value="">Please choose</option>
								<option value="Slim">Slim</option>
								<option value="Athletic">Athletic</option>
								<option value="Average">Average</option>
								<option value="Stout">Stout</option>
							</select>
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Children------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2">Children:</label>
						<div class="col-sm-10">
							<select class="form-control" name="cboKids" required>
								<option value="">Please choose</option>
								<option value="No">No</option>
								<option value="Yes, with me">Yes, with me</option>
								<option value="Yes but not with me">Yes but not with me</option>
							</select>
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Education------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2">Education:</label>
						<div class="col-sm-10">
							<select class="form-control" name="cboEdu" required>
                                <option value="">Please choose</option>
								<option value="High school">High school</option>
								<option value="College graduate">College graduate</option>
								<option value="Advanced degree">Advanced degree</option>
							</select>
						</div>
					</div>
			    </div>
                <!-- -------------------------------------------------------------Height------------------------------------------------- -->
                <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2">Height:</label>
						<div class="col-sm-10">
                            <div><input type="range" name="rangeInput" min="140" max="240" onchange="updateTextInput(this.value);" style="width:200px;" >
                            <input type="text" id="heightInput" name="height" style="width:40px" value="" required="required" /></div>
						</div>
					</div>
			    </div>   
                <!-- -------------------------------------------------------------Etnicity------------------------------------------------- -->
			    <div class="text_frame">
					<div class="form-group">
						<label class="control-label col-sm-2">Etnicity:</label>
						<div class="col-sm-10">
							<select class="form-control" name="cboEtn" required>
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
                    <input type="submit" value="Register" class="bt_register" />
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
