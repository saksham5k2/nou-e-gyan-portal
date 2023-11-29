
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
                    <h2 style="color: blue; text-align: center;">Assignments</h2>
                    <table class="table table-bordered">
                        <tr>
                            <th>Id</th>
                            <th>Subject</th>
                            <th>Title</th>
                            <th>Download</th>
                        </tr>
                        <%
                            DB_manager dm = new DB_manager();
                            String rollno = session.getAttribute("studentid").toString();
                            String query = "select * from student where rollno='"+rollno+"'";
                            ResultSet rs = dm.select(query);
                            if(rs.next())
                            {
                                String program = rs.getString("program");
                                String branch = rs.getString("branch");
                                String year = rs.getString("year");
                                
                               query = "select * from material where program = '"+program+"'and branch = '"+branch+"' and year= '"+year+"'  and materialtype= 'assign'";
                               rs=dm.select(query);
                               while(rs.next())
                               {
                                   %>
                                   <tr>
                                       <td><%=rs.getInt("id")%></td>
                                       <td><%=rs.getString("subject")%></td>
                                       <td><%=rs.getString("title")%></td>
                                       <td>
                                           <a href="<%=request.getContextPath()%>/upload/<%=rs.getString("filename")%>" download><%=rs.getString("title")%></a>
                                       </td>
                                   </tr>
                                   <%
                               }

                                
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