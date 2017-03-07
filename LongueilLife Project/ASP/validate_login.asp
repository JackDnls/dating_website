<%@ Language="Javascript" %>
<%
    var email = Request.Form("bxEmail");
    var passwd = Request.Form("bxPasswd");

    var myCon = new ActiveXObject("ADODB.Connection");
    var myRec = new ActiveXObject("ADODB.Recordset");
    //Profiles.Picture is taken out due to technical reason
    myCon.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= E:\\Longueilife.mdb");
    sql = "SELECT Users.EmailAddr, Users.UserPassword, Profiles.ProfileID, Profiles.FirstName, Profiles.LastName, Profiles.Gender FROM Users INNER JOIN Profiles ON Users.UserID = Profiles.ProfileID WHERE Users.EmailAddr = '" + email + "' AND Users.UserPassword ='" + passwd + "'";
    myRec.Open(sql, myCon);

    if (myRec.EOF) {
        myRec.Close();
        myCon.Close();

        Session('wrongMessage') = "Wrong username or password";
        Response.Redirect("login.asp");
    }

    Session('currProfileID') = myRec.Fields("ProfileID").value;
    Session('currFirstName') = myRec.Fields("FirstName").value;
    Session('currLastName') = myRec.Fields("LastName").value;
    Session('curGender') = myRec.Fields("Gender").value;

    Response.Redirect("welcome.asp");
    
%>
<html>
<head>
    <title></title>	
</head>
<body>

</body>
</html>
