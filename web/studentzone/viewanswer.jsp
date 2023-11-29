
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DB_manager"%>
<%
    if(session.getAttribute("studentid")==null)
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
                    <h2 style="color:blue;text-align: center;">View Answer</h2>
                    <table class="table table-bordered">
                        <tr>
                            <th>AId</th>
                            <th>Answer</th>
                            <th>Answered By</th>
                            <th>Posted Date</th>
                        </tr>
                        <%
                            int qid=Integer.parseInt(request.getParameter("qid"));
                            DB_manager dm = new DB_manager();
                            String query = "select * from answer where qid='"+qid+"'";
                            ResultSet rs = dm.select(query);
                            while(rs.next())
                            {
                                
                            
                        %>
                        <tr>
                            <td><%=rs.getInt("aid")%></td>
                            <td><%=rs.getString("answer")%></td>
                            <td><%=rs.getString("answeredby")%></td>
                            <td><%=rs.getString("posteddate")%></td>
                        </tr>
                        <% 
                            }
                        %>
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