<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration System</title>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
            color: #333;
			
        }

        table {
            width: 50%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        table, th, td 
		{
            border: 3px solid black;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #000081;
            color: white;
        }

        /* Footer styling */
        footer {
            background-color:#000081;
            color: #fff;
            text-align: center;
            padding: 15px;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color:#000081;
        }

        li {
            float: right;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            background-color:#000081;
        }

        span {
            color:#000081;
        }
    </style>
</head>
<body>
  
    <div>
        <img src="logo.png" width="500px" height="150px">
        <span style="font-size:60px;"><b>VIJAYA DIAGNOSTIC CENTER</b></span>
    </div>

    <ul>
        <li><a href="logout.jsp">LOGOUT</a></li>
        <li><a href="profile.jsp">PROFILE</a></li>
        <li><a href="update.jsp">UPDATE</a></li>
        <li><a href="view1.html">HOME</a></li>
    </ul>

    <main>
        <%@ page import="java.sql.*" %>
        <%
            String uname = (String)session.getAttribute("uname");

            if (uname != null) 
			{
                try 
				{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nikitha");
                    String qry = "SELECT * FROM patient WHERE email = ?";
                    PreparedStatement pstmt = con.prepareStatement(qry);
                    pstmt.setString(1, uname);

                    ResultSet rs = pstmt.executeQuery();

                    if (rs.next()) 
					{
                        out.println("<table>");
                        out.println("<tr><th>Field</th><th>Value</th></tr>");
                        out.println("<tr><td>Full Name</td><td>" + rs.getString("fname") + "</td></tr>");
                        out.println("<tr><td>Email</td><td>" + rs.getString("email") + "</td></tr>");
                        out.println("<tr><td>Gender</td><td>" + rs.getString("gender") + "</td></tr>");
                        out.println("<tr><td>Phone</td><td>" + rs.getLong("phno") + "</td></tr>");
                        out.println("<tr><td>Address</td><td>" + rs.getString("address") + "</td></tr>");
                        out.println("</table>");
                    } 
					else 
					{
                        out.println("User not found.");
                    }
                    con.close();
                } 
				catch (Exception e)
				{
                    out.print("An error occurred: " + e.getMessage());
                }
            } 
			else 
			{
                out.println("Session does not have username information.");
            }
        %>
    </main>

   <footer>
        <h4>VIJAYA DIAGNOSTIC CENTER copyrights@nikitha:23765A0512</h4>
    </footer>
</body>
</html>
