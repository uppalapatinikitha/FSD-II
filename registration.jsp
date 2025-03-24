<%@ page import="java.sql.*" %>

<%
   
    String fname= request.getParameter("fname");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    long phno =  Long.parseLong(request.getParameter("phno")); 
    String address = request.getParameter("address");
    String pwd = request.getParameter("pwd");

   
       
   try
   {
     
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "nikitha");

        String qry = "INSERT INTO patient (fname,email,gender,phno,address,pwd) VALUES (?,?,?,?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(qry);

        pstmt.setString(1, fname);
        pstmt.setString(2, email);
        pstmt.setString(3, gender);
        pstmt.setLong(4, phno);
        pstmt.setString(5, address);
        pstmt.setString(6,pwd);

        pstmt.executeUpdate();

        out.print("Student Registration successful");
        con.close();

        // Redirect to the login page after successful registration
        response.sendRedirect("login.html");
    }
	catch (NumberFormatException ex) 
		{
        // Handle invalid numeric conversion
        out.print("Invalid input: Please enter a valid number.");
    } 
	
	catch (Exception e) 
		{
        // General exception handling
        out.print("An error occurred during registration: " + e.getMessage());
    }
%>
