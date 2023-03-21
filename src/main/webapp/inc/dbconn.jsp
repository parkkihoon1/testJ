<%@page import="java.sql.*"%>
<%
  Connection conn= null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try{
    String url = "jdbc:mariadb://localhost:3306/teamproject_market";
    String user = "root";
    String password = "8259";

    Class.forName("org.mariadb.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
  } catch(SQLException ex){

  }
%>