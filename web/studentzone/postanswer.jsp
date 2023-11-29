<%-- 
    Document   : postanswer
    Created on : Oct 27, 2023, 9:42:29 AM
    Author     : Rock
--%>

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
                <h2 style="text-align: center; color:blue;">Post Answer</h2>
                <%
                    int qid=Integer.parseInt(request.getParameter("qid"));
                %>
                <form class="form-group" method="post" action="studentcontroller.jsp">
                    <input type="hidden" name="page" value="postanswer"/>
                    <input type="hidden" name="qid" value="<%=qid%>"/>
                    <table class="table table-bordered" style="width: 70%; margin: auto;">
                        <tr>
                            <td>Enter Answer</td>
                            <td>
                                <textarea name="answer" class="form-control" required></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button type="submit" class="btn btn-success">Post Answer</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
<% } %>
