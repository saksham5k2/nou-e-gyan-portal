<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DB_manager"%>
<%
    if(session.getAttribute("adminid")==null)
    {
        response.sendRedirect("../login.jsp");
    }
    else
    {
        
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NOU - Student Zone</title>
        <link href="../css/bootstrap.css" rel="stylesheet"/>
    </head>
    <body>
        
        <div class="container">
        <jsp:include page="header.jsp"/>
        <div class="row">
            <div class="col-sm-12" style="background-color: pink; min-height: 600px;">
                <h2 style="color:blue; text-align: center;">Student Information</h2>
                <table class="table table-bordered">
                    <tr>
                        <th>Roll no</th>
                        <th>Name</th>
                        <th>Father's name</th>
                        <th>Mother's name</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th>Program</th>
                        <th>Branch</th>
                        <th>Year</th>
                        <th>Contact no</th>
                        <th>Email Address</th>
                        <th>Reg. date</th>
                    </tr>
                    <%
                        DB_manager dm = new DB_manager();
                        String query = "select * from student";
                        ResultSet rs = dm.select(query);
                        while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getInt("rollno")%></td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("fname")%></td>
                        <td><%=rs.getString("mname")%></td>
                        <td><%=rs.getString("gender")%></td>
                        <td><%=rs.getString("address")%></td>
                        <td><%=rs.getString("program")%></td>
                        <td><%=rs.getString("branch")%></td>
                        <td><%=rs.getString("year")%></td>
                        <td><%=rs.getString("contactno")%></td>
                        <td><%=rs.getString("emailaddress")%></td>
                        <td><%=rs.getString("regdate")%></td>
                    </tr>
                    
                    <% } %>
                </table>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>   
        </div>
    </body>
</html>
<%
    }
%>