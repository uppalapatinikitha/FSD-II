<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>



<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial scale=1.0">
<title>login page</title>
<link rel="stylesheet" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
  <div class="wrapper">
 <form name="myform"  method="post">
   <h1>LOGIN</h1>
     <div class="input-box">
        <input type="text" placeholder="Username" name="username" required>
<i class='bx bxs-user'></i>
</div>

   <div class="input-box">
        <input type="Password" placeholder="New Password" name="newpwd" required>
<i class='bx bxs-lock-alt'></i>
</div>
 <div class="input-box">
        <input type="Password" placeholder="Confirm Password" name="confirmpwd" required>
<i class='bx bxs-lock-alt'></i>
</div>

    

<button type="submit" class="btn">Update</button>

   </form> 

   <% 
            String username = request.getParameter("username");
            String newpwd = request.getParameter("newpwd");
            String confirmpwd = request.getParameter("confirmpwd");

       if (username != null && newpwd != null && !newpwd.isEmpty() && newpwd.equals(confirmpwd)) {
                Connection con = null;
                PreparedStatement pstmt = null;
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "nikitha");
                    String query = "UPDATE patient SET pwd = ? WHERE email = ?";
                    pstmt = con.prepareStatement(query);
                    pstmt.setString(1, newpwd);
                    pstmt.setString(2, username);
                    int result = pstmt.executeUpdate();
                    if (result > 0)
						{
                        %>
							<script>window.alert("Updation is successful");</script>
							<jsp:forward page="login.html"></jsp:forward>
							<%
                        } 
					else 
						{
                        out.println("<p>Error updating password. Please try again.</p>");
                        }
                      } 
				catch (Exception e) 
					{
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                    } 
					finally
						{
                          try 
						  {
                        if (pstmt != null) pstmt.close();
                        if (con != null) con.close();
                          }
						  catch (SQLException e)
						  {
                          out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
                         }
                       }
            } 
			
        %>

   
</body>
</html>