<%-- 
    Document   : postquestion
    Created on : Oct 27, 2023, 9:42:02 AM
    Author     : Rock
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DB_manager"%>
<%
    if(session.getAttribute("studentid")==null)
    {
        response.sendRedirect("../login.jsp");
    }
    else{
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NOU - Student Zone</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <script src="../js/bootstrap.bundle.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <br><h1 style="text-align: center">Welcome Student</h1><br>
        
        <div class="row">
            <div class="col-sm-12" style="min-height:600px;">
             <h2 style="text-align: center;">Discussion Forum</h2>
             <form class="form-group" method="post" action="studentcontroller.jsp">
                 <input type="hidden" name="page" value="postquestion"/>
                 <table class="table table-bordered" style="width: 70%; margin: auto;">
                     <tr>
                         <td>Enter Your Question</td>
                         <td>
                             <textarea class="form-control" name ="question" required ></textarea>
                         </td>
                     </tr>
                     <tr>
                         <td></td>
                         <td>
                             <button type="submit" class="btn btn-success">Post Question</button>
                         </td>
                     </tr>
                 </table>
             </form>
             <br/>
             <table class="table table-bordered">
                 <tr>
                     <th>Qid</th>
                     <th>Question</th>
                     <th>Asked by</th>
                     <th>Posted Date</th>
                     <th>Post Answer</th>
                     <th>View Answer</th>

                 </tr>
                 <%
                    DB_manager dm=new DB_manager();
                    String query="select * from question";
                    ResultSet rs=dm.select(query);
                    while(rs.next()){
                 %>
                 <tr>
                     <td><%=rs.getInt("qid")%></td>
                     <td><%=rs.getString("question")%></td>
                     <td><%=rs.getString("askedby")%></td>
                     <td><%=rs.getString("posteddate")%></td>
                     <td><a href="postanswer.jsp?qid=<%=rs.getInt("qid")%>"><button type="button" class="btn btn-primary">Post Answer</button></a></td>
                     <td><a href="viewanswer.jsp?qid=<%=rs.getInt("qid")%>"<button type="button" class="btn btn-success">View Answer</button></a></td>
                 </tr>
                 <%
                    }
                 %>
             </table>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
<% } %>
