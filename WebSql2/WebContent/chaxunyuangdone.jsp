<%-- 
    Document   : index
    Created on : 2010-8-16, 1:45:07
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <title>员工信息</title>
    </head>
    <style type="text/css">
            table{
                border:1px solid #666;

            }
            td{

                border: 1px solid #666;
            }
        </style>
    <body>
       
        
       
        <div>
          <h2>查询员工信息</h2>
        </div>
        <table>
          <tr>
            <td>工号</td>
            <td>姓名</td>
            <td>员工电话</td>
       
          </tr>
        
        <%
        //jsp代码是用<%的一堆符号括起来的
        Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");//调用驱动链接数据库
        Connection conn=DriverManager.getConnection("jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=car","yhblsqt","19980322");
        Statement stmt=conn.createStatement();//上一行的后面部分是数据库名test，用户名yhblsqt，密码19980322
		//接收一个数据
		String id1=request.getParameter("id1");
	
		//转中文编码
        String id1cn = new String(id1.getBytes("ISO-8859-1"),"UTF-8");

		//拼接一句insert
		//执行sql
		String sqlselect="select * from 员工  where 工号="+"'"+id1cn+"'";
		ResultSet rs=stmt.executeQuery(sqlselect);
		while(rs.next())
        {%>
          <tr>
            <td><%=rs.getString("工号") %></td>
            <td><%=rs.getString("姓名") %></td>
            <td><%=rs.getString("员工电话") %></td>
            
            
          </tr>
        <%}%>
		
		<%=sqlselect %>
		</table>
		<a href="guzhang.jsp">go</a>

    </body>
</html>