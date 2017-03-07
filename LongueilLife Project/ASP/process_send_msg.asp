<%@ Language ="Javascript" %>
<%
    var receiver = Session("receiverID");    
    var msgBody = Request.Form("refMsg");
    var sender = Session("currProfileID");

    var myConn = new ActiveXObject("ADODB.Connection");
    var myRec = new ActiveXObject("ADODB.RecordSet");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= E:\\Longueilife.mdb");

    var sqlStat = 'INSERT INTO Messages (Sender, Receiver, MessageBody) VALUES ('+sender + ', ' + receiver + ', "' + msgBody + '")';
    myRec.Open(sqlStat, myConn);

    Session('msgSuccess') = "Message sent successfuly";
    Session.Contents.Remove("receiverID");

    Response.Redirect("display_profile.asp?selProf=" + receiver);

    %>

<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>
