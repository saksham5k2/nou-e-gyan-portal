<%-- 
    Document   : studenthome
    Created on : Oct 18, 2023, 10:53:54 AM
    Author     : Rock
--%>
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
        <div>
            <jsp:include page="header.jsp"/>
            
            <div class="row">
                <div class="col-sm-12" style="background-color: pink; min-height: 600px;">
                    <h2 style="color: blue; text-align: center;">News Management</h2>
                    <form class="form-group" method="post" action="admincontroller.jsp">
                        <input type="hidden" name="page" value="adminhome"/>
                        <table class="table table-bordered" style="margin: auto; width: 70%">
                            <tr>
                                <td>Enter News Text</td>
                                <td>
                                    <textarea name="newstext" class="form-control" required></textarea>
                                </td>
                            </tr>
                            
                            <tr>
                                <td></td>
                                <td>
                                    <button type="submit" class="btn btn-success">Add News</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <br>
                    <br>
                    <table class="table table-bordered">
                        <tr>
                            <th>Id</th>
                            <th>News Text</th>
                            <th>Posted Date</th>
                            <th>Delete</th>
                        </tr>
                    
                    <%
                        DB_manager dm = new DB_manager();
                        String query = "select * from news";
                        ResultSet rs = dm.select(query);
                        while(rs.next()){
                            
                    %>
                    <tr>
                        <td><%=rs.getInt("id")%></td>
                        <td><%=rs.getString("newstext")%></td>
                        <td><%=rs.getString("posteddate")%></td>
                        <td>
                            <a href="delnews.jsp?id=<%=rs.getInt("id")%>">
                                <button type="button" class="btn btn-danger">Delete</button>
                            </a>
                        </td>
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