<%@ Language ="Javascript" %>
<%
    var firstName = Request.Form("txtFirstName");
    var lastName = Request.Form("txtLastName");
    var nick = Request.Form("nick");
    var city = Request.Form("city");
    var prov = Request.Form("cboProv");
    var gender = Request.Form("radGender");   
    var preferences = Request.Form("radPref");   
    var bDate = Request.Form("bDate");
    var emailAddr = Request.Form("EmailAddr");
    var passwd = Request.Form("Pwd1");
    var mStatus = Request.Form("cboStat");   
    var body = Request.Form("cboBody");   
    var kids = Request.Form("cboKids");    
    var education = Request.Form("cboEdu");   
    var height = Request.Form("Height");
    var etnicity = Request.Form("cboEtn");    

    var myConn, myRec;
    myConn = new ActiveXObject("ADODB.Connection");
    myRec = new ActiveXObject("ADODB.RecordSet");

    myConn.Open('Provider=Microsoft.Jet.OLEDB.4.0;Data Source = E:\\Longueilife.mdb');

    var sqlReadEmail = "SELECT EmailAddr FROM Users WHERE EmailAddr = '" + emailAddr+"'";
    myRec.Open(sqlReadEmail, myConn);
    if (!myRec.EOF)
    {
        Session('EmailExists') = "This is a registered email. \nDid you forget your password?";
        myRec.Close();
        myConn.Close();
        Response.Redirect("signup.asp");
    }
    myRec.Close();

    var sqlReadNick = "SELECT Nickname FROM Profiles WHERE Nickname = '" + nick + "'";
    myRec.Open(sqlReadNick, myConn);
    if (!myRec.EOF) {
        Session('wrongNick') = "Sorry, this nickname has already been taken. \nPlease choose another one.";
        myRec.Close();
        myConn.Close();
        Response.Redirect("signup.asp");
    }
    myRec.Close();

    var sqlWriteUser = "INSERT INTO Users (EmailAddr, UserPassword) VALUES ('" + emailAddr + "', '" + passwd + "');";
    myRec.Open(sqlWriteUser, myConn);

    var sqlReadId = "SELECT UserID, EmailAddr FROM Users where EmailAddr = '" + emailAddr+"'";
    myRec.Open(sqlReadId, myConn);

    var selectedId = myRec.Fields("UserID").value;
    myRec.Close();
    var sqlWriteProfile = "INSERT INTO Profiles (ProfileId, firstName, lastName, Nickname, City, Province, Gender, Preferences, Birthday, ";
    sqlWriteProfile += "MaritalStatus, Body, Children, Education, Etnicity, Height) VALUES ";
    sqlWriteProfile += "(" + selectedId + ", '" + firstName + "', '" + lastName + "', '" + nick + "', '" + city + "', '" + prov + "', '" + gender + "', '" + preferences + "', '" + bDate + "', '" + mStatus + "', '" + body + "', '" + kids + "', '" + education + "', '" + etnicity + "', " + height + ");";
    
    myRec.Open(sqlWriteProfile, myConn);

    Response.Redirect("login.asp");

    %>
<html>
<head>
	<title></title>
</head>
<body>

</body>
</html>
