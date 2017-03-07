<%@ Language="Javascript" %>
<%
    var curGender = Session('curGender');

    var gend = Request.QueryString("radGender");
    var socStat = Request.QueryString("cboStat");
    var bodyShape = Request.QueryString("cboBody");
    var kids = Request.QueryString("cboKids");
    var educ = Request.QueryString("cboEdu");
    var etnic = Request.QueryString("cboEtn");
    var sql1 = "";
    var sql2 = "";
    var sql3 = "";
    var sql4 = "";
    var sql5 = "";
    var sql6 = "";

    var myConn = new ActiveXObject("ADODB.Connection");
    var myRec = new ActiveXObject("ADODB.Recordset");
   
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= E:\\+++College Lassale+++\\INTERNET\\LongueilLife Project\\App-Data\\Longueilife.mdb")
    var sql = "SELECT Profiles.ProfileID, Profiles.Nickname, Profiles.City, Profiles.Province, Profiles.Height,";

    if (gend != ""){
        sql1 = " Profiles.Gender";
    }
    if (socStat != ""){
        sql2 = ", Profiles.MaritalStatus";
    }
    if (bodyShape != "") {
        sql3 = ", Profiles.Body";
    }
    if (kids != "") {
        sql4 = ", Profiles.Children";
    }
    if (educ != "") {
        sql5 = ", Profiles.Education";
    }
    if (etnic != "") {
        sql6 = ", Profiles.Etnicity";
    }
    var firstSQL = sql + sql1 + sql2 + sql3 + sql4 + sql5 + sql6;
    var sql1 = "";
    var sql2 = "";
    var sql3 = "";
    var sql4 = "";
    var sql5 = "";
    var sql6 = "";

    firstSQL += " FROM Profiles WHERE ";

    if (gend != "") {
        sql1 = '((Profiles.Gender) = "'+gend+'")';
    }
    if (socStat != "") {
        sql2 = ' AND ((MaritalStatus) = "' + socStat + '")';
    }
    if (bodyShape != "") {
        sql3 = ' AND ((Profiles.Body) = "' + bodyShape + '")';
    }
    if (kids != "") {
        sql4 = ' AND ((Profiles.Children) = "' + kids + '")';
    }
    if (educ != "") {
        sql5 = ' AND ((Profiles.Education) = "' + educ + '")';
    }
    if (etnic != "") {
        sql6 = ' AND ((Profiles.Etnicity) = "' + etnic + '")';
    }
    var secondSQL = sql1 + sql2 + sql3 + sql4 + sql5 + sql6;
    secondSQL += ' AND ((Profiles.ProfileID) <> ' + Session('currProfileID') + ');';
    var finalSQL = firstSQL + secondSQL;    
    myRec.Open(finalSQL, myConn);

    if (myRec.EOF)
    {
        Session('noResult') = "There are no results to display based on your criterias";
        myRec.Close();
        myConn.Close();
        Response.Redirect('search.asp');
    }

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
            background-color: #F0F8FF;
		}
		 .panels
		{   
			opacity: 0.95;
			border-radius: 10px;
			position: relative;
		}
		 .right_panel_top 
		{
            background-color:#eaecf2;
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
            background-color:#eaecf2;
			float:right; 
			width: 18%; 
			height:200px; 
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
	<div class ="panels right_panel_top " > 
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
				<h1 style="padding:30px;">Here're those who we have found:</h1>
			</div>	
            <br /><br /><br />
            <div class="form-horizontal">	
                <% while(!myRec.EOF)
                   {
                %>   
                <div class="text_frame">
					<div class="form-group">
					<label class="control-label col-sm-2" >
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
                        <a href="display_profile.asp?selProf=<%= myRec.Fields("ProfileID") %>">                     
                            <img src="<%= picUser %>" style="width:200px; height:auto"/>
                        </a>
					</label>
						<div style="margin-left:300px; margin-top:50px">
							<a href="display_profile.asp?selProf=<%= myRec.Fields("ProfileID") %>"> <%= myRec.Fields("Nickname") %> </a>
						</div>
                        <div style="margin-left:300px;">
                            <p>From <%= myRec.Fields("City") %>, <%= myRec.Fields("Province") %> </p>
                        </div>   
					</div>
			    </div>     
                <% 
                    myRec.MoveNext();
                }
                %>  
            </div>
            <%
                myRec.Close()
                myConn.Close() 
            %>
		</div>
	</div>
	<div " class="panels right_panel_bottom">
		<h3>... and here ...</h3> 
	</div>
	<div class="panels right_panel_bottom">
		<h3>... and here too</h3> 
	</div>
	<div style="clear:both;"></div>
</div>

</body>
</html>

<html>
<head>
    <title></title>
	
</head>
<body>

</body>
</html>
