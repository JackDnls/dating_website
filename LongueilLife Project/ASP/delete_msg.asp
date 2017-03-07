<%@ Language ="Javascript" %>
<%
    var refMsg = parseInt(Request.QueryString("MessID"));

    var myConn = new ActiveXObject("ADODB.CONNECTION");
    var path = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source= E:\\Longueilife.mdb";
    myConn.Open(path);

    var myRec = new ActiveXObject("ADODB.RecordSet");
    var sqlStat = "DELETE FROM Messages WHERE MessageID =" + refMsg;
    myRec.Open(sqlStat, myConn);

    Session("DelSucceed") = "Message successfully deleted";

    Response.Redirect("check_all_messages.asp");

    Response.Write(refMsg);
    %>
<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>
