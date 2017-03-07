<%@ Language ="Javascript" %>
<%    
    var messBody = Request.Form("refMsg");
    var sender = Session('currProfileID');
    var receiver = Request.Form("ProfID");
    var messId = Request.Form("MessID");
    

    var myConn = new ActiveXObject("ADODB.Connection");
    var myRec = new ActiveXObject("ADODB.RecordSet");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= E:\\+++College Lassale+++\\INTERNET\\LongueilLife Project\\App-Data\\Longueilife.mdb");

    var sql = "INSERT INTO Messages (MessageBody, Sender, Receiver) VALUES ('" + messBody + "', " + sender + ", " + receiver + ");";
    myRec.Open(sql, myConn);

    var myRec1 = new ActiveXObject("ADODB.RecordSet");
    sql1 = "UPDATE Messages SET Replied = 1 where MessageID = " + messId;
    myRec1.Open(sql1, myConn);
    
    Response.Redirect('check_all_messages.asp');
%>
<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>
