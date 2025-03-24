<%@ page import="java.sql.*"%>
<%
	String un=request.getParameter("uname");
	String pwd=request.getParameter("pwd");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nikitha");
	    String qry="select * from patient where email=? and pwd=?";
		PreparedStatement pstmt=con.prepareStatement(qry);
		pstmt.setString(1,un);
		pstmt.setString(2,pwd);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{
			session.setAttribute("uname", un);
			out.print("Login successful");
			%>
				<jsp:forward page="view1.html">
				<jsp:param name="uname" value="<%= un %>"/>
				</jsp:forward>
				<%
		}
		else
		{
			%>
				<jsp:forward page="loginfailed.html"/>
				<%
             
				out.print("<h1 style='color:red';>Login failed</h1>");
		}
		con.close();
	}
	catch(Exception e)
	{
	   out.print(e);
	}    
%>